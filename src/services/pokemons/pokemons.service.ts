import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, In } from 'typeorm';
import { PokemonEntity } from '../../entities/pokemon.entity'; // ◄── Ajusta la ruta real de tu entidad
import { PokemonEncountersEntity } from '@/entities/pokemonencounters.entity';

@Injectable()
export class PokemonsService {
  constructor(
    @InjectRepository(PokemonEntity)
    private readonly pokemonRepository: Repository<PokemonEntity>,
    
    @InjectRepository(PokemonEncountersEntity)
    private readonly encountersRepository: Repository<PokemonEncountersEntity>,
  ) {}

  /**
   * Obtiene los 3 pokémones iniciales por su ID de la base de datos
   */
  public async obtenerIniciales(): Promise<PokemonEntity[]> {
    const iniciales = await this.pokemonRepository.find({
      // 🎯 LA CLAVE: Seleccionamos explícitamente solo lo que el frontend necesita
      relations:{
        type_one: true,
        type_two: true
      },
      select: {
        id: true,
        Numpokedex: true,
        name: true,
        pokedexurl: true, // Filtramos para que mande solo esta URL de imagen
        description: true,
        type_one: {
          name:true,
          color:true
        },
        type_two: {
          name:true,
          color:true
        },
      },
      where: {
        id: In([1, 4, 7]),
      },
      order: {
        id: 'ASC',
      },
    });

    if (!iniciales || iniciales.length === 0) {
      throw new NotFoundException('No se encontraron los pokémones iniciales en la base de datos.');
    }

    return iniciales;
  }

  async getRandomEncounterByMap(mapId: number): Promise<PokemonEncountersEntity> {
    // 1. Contamos cuántos encuentros existen para ese mapa específico
    const totalEncounters = await this.encountersRepository.count({
      where: {
        map: { id: mapId }, // Filtro estructurado a través de la relación del mapa
      },
    });

    // Si no hay encuentros, lanzamos la excepción inmediatamente
    if (totalEncounters === 0) {
      throw new NotFoundException(`No se encontraron encuentros salvajes en el mapa con ID ${mapId}`);
    }

    // 2. Generamos un número aleatorio entre 0 y el total de encuentros menos 1
    const randomIndex = Math.floor(Math.random() * totalEncounters);

    // 3. Buscamos utilizando skip (OFFSET) para posicionarnos en el índice aleatorio
    const encounters = await this.encountersRepository.find({
      where: {
        map: { id: mapId },
      },
      relations: {
        pokemon: true, // Carga la relación estructurada del Pokémon de forma limpia
      },
      skip: randomIndex, // Se salta N registros de forma aleatoria
      take: 1,         // Solo nos interesa traer un único registro
    });

    // Retornamos el único elemento del array resultante
    return encounters[0];
  }
  
}