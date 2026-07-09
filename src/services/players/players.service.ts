import { BadRequestException, ConflictException, Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { PlayerEntity } from '@/entities/player.entity';
import { JwtService } from '@nestjs/jwt'; 
import * as bcrypt from 'bcrypt';
import { MyPokemonsEntity } from '@/entities/mypokemons.entity';
import { PokemonEntity } from '@/entities/pokemon.entity'; // ◄── Tu entidad base global
import { MapEntity } from '@/entities/map.entity';

@Injectable()
export class PlayersService {

  constructor(
    @InjectRepository(PlayerEntity)
    private readonly playerRepository: Repository<PlayerEntity>, 
    
    @InjectRepository(MyPokemonsEntity)
    private readonly myPokemonRepository: Repository<MyPokemonsEntity>,
    
    @InjectRepository(PokemonEntity)
    private readonly pokemonRepository: Repository<PokemonEntity>, // ◄── ¡CORREGIDO: Ahora sí es PokemonEntity!

    @InjectRepository(MapEntity)
    private readonly mapRepository: Repository<MapEntity>,
    
    private readonly jwtService: JwtService, 
  ) {}

  async obtenerJugador(id: number): Promise<{username: string, x: number, y: number, gold: number, level: number, levelpoints: number }> {
    const jugador = await this.playerRepository.findOneBy({ id });

    if (!jugador) {
      throw new NotFoundException(`El jugador con ID ${id} no existe`);
    }

    return {
        username: jugador.username,
        x: jugador.x,
        y: jugador.y,
        gold: jugador.gold,
        level: jugador.level,
        levelpoints: jugador.levelpoints
    };
  }

  public async register(body: any): Promise<any> {
    const { username, password, gender } = body;

    if (!username || !password || !gender) {
      throw new BadRequestException('Todos los campos son obligatorios.');
    }

    if (gender !== 'masculino' && gender !== 'femenino') {
      throw new BadRequestException('Género no válido. Debe ser masculino o femenino.');
    }

    const existingPlayer = await this.playerRepository.findOne({ where: { username } });
    if (existingPlayer) {
      throw new ConflictException('El nombre de usuario ya está en uso.');
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const newPlayer = this.playerRepository.create({
      username,
      password: hashedPassword,
      gender,
      profile: { id: (gender === 'masculino' ? 1 : 2) },
      skin_player: { id: (gender === 'masculino' ? 1 : 2) },
      map_player: { id: 1 },
    });

    const savedPlayer = await this.playerRepository.save(newPlayer);

    const jugadorCompleto = await this.playerRepository.findOne({
      where: { id: savedPlayer.id },
      relations: { profile: true, skin_player: true, map_player: true }
    });

    if (!jugadorCompleto) {
      throw new NotFoundException('Error al recuperar el usuario registrado.');
    }

    const payload = { sub: jugadorCompleto.id, username: jugadorCompleto.username };
    const token = this.jwtService.sign(payload);

    const urlTmj = jugadorCompleto.map_player?.tmjurl ? String(jugadorCompleto.map_player.tmjurl) : '';
    const urlTileset = jugadorCompleto.map_player?.tileseturl ? String(jugadorCompleto.map_player.tileseturl) : '';

    return {
      message: 'Cuenta creada con éxito e inicio de sesión automático.',
      token: token, 
      user: {
        id: jugadorCompleto.id,
        username: jugadorCompleto.username,
        gender: jugadorCompleto.gender,
        gold: jugadorCompleto.gold,
        level: jugadorCompleto.level,
        levelpoints: jugadorCompleto.levelpoints,
        profileurl: jugadorCompleto.profile?.url || '',
        skinurl: jugadorCompleto.skin_player?.url || '',
        mapid: jugadorCompleto.map_player.id,
        tmjurl: urlTmj,
        tileseturl: urlTileset,
        x: jugadorCompleto.x,
        y: jugadorCompleto.y
      }
    };
  }

  public async login(body: any): Promise<any> {
    const { username, password } = body;

    if (!username || !password) {
      throw new BadRequestException('Usuario y contraseña son obligatorios.');
    }

    const jugador = await this.playerRepository.findOne({ 
      where: { username },
      relations: { profile: true, skin_player: true, map_player: true }
    });
    if (!jugador) {
      throw new UnauthorizedException('Credenciales inválidas.');
    }

    const isPasswordValid = await bcrypt.compare(password, jugador.password);
    if (!isPasswordValid) {
      throw new UnauthorizedException('Credenciales inválidas.');
    }

    const payload = { sub: jugador.id, username: jugador.username };
    const token = this.jwtService.sign(payload); 

    const urlTmj = jugador.map_player?.tmjurl ? String(jugador.map_player.tmjurl) : '';
    const urlTileset = jugador.map_player?.tileseturl ? String(jugador.map_player.tileseturl) : '';

    return {
      message: 'Inicio de sesión exitoso.',
      token: token, 
      user: {
        id: jugador.id,
        username: jugador.username,
        gender: jugador.gender,
        gold: jugador.gold,
        level: jugador.level,
        levelpoints: jugador.levelpoints,
        profileurl: jugador.profile.url,
        skinurl: jugador.skin_player.url,
        mapid: jugador.map_player.id,
        tmjurl: urlTmj,
        tileseturl: urlTileset,
        x: jugador.x,
        y: jugador.y
      }
    };
  }

  public async getEquippedPokemons(playerId: number): Promise<any> {
    const jugador = await this.playerRepository.findOne({
      where: { 
        id: playerId,
        mypokemon: {
          status: 'equipado'
        }
      },
      relations: {
        mypokemon: {
          pokemon: true
        }
      }
    });

    if (!jugador) {
      throw new NotFoundException('Jugador no encontrado o sin pokémones equipados.');
    }

    return jugador.mypokemon.map((mp: any) => ({
      id: mp.id,
      level: mp.level,
      url: mp.pokemon?.miniurl,
      name: mp.pokemon?.name,
      islife: mp.islife,
      lifepoints: mp.lifepoints,
      pokemonurl: mp.pokemon?.pokemonurl
    }));
  }

  public async addPokemon(playerId: number, pokemonId: number): Promise<any> {
    // Ahora resolverá de forma estricta contra la tabla base
    const pokemonBase = await this.pokemonRepository.findOne({ where: { id: pokemonId } });
    
    if (!pokemonBase) {
      throw new NotFoundException('El Pokémon especificado no existe en el juego.');
    }

    const numPokes = await this.myPokemonRepository.count({
      where: { 
        player: { id: playerId }, 
        status: 'equipado' 
      }
    });

    const decideStatus = numPokes >= 6 ? 'pc' : 'equipado';
    
    const newAddPoke = this.myPokemonRepository.create({
      player: { id: playerId },   
      pokemon: { id: pokemonId }, 
      level: 5,
      status: decideStatus,
    });

    const newMyPoke = await this.myPokemonRepository.save(newAddPoke);
    
    return {
      message: decideStatus === 'equipado' 
        ? '¡Pokémon añadido a tu equipo!' 
        : 'Tu equipo está lleno. ¡Pokémon enviado a la PC!',
      pokemon: newMyPoke
    };
  }
  

  public async obtenerMapaCombate(): Promise<MapEntity> {
    // 🎯 Vamos a la DB real. Buscamos el mapa de combate (ID: 2 como tenías antes, o el que uses)
    const mapa = await this.mapRepository.findOne({ where: { id: 2 } });

    if (!mapa) {
      throw new NotFoundException('❌ No se encontró la configuración del mapa de combate en la tabla map');
    }

    return mapa;
  }
}