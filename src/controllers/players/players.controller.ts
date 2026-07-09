import { Body, Controller, Get, HttpCode, HttpStatus, Param, ParseIntPipe, Post } from '@nestjs/common';
import { PlayersService } from './../../services/players/players.service';

@Controller('players')
export class PlayersController {
    constructor(private readonly playersService: PlayersService) {} 

    @Get('mapa-combate')
  async obtenerMapaCombate() {
    return await this.playersService.obtenerMapaCombate();
  }

    @Get(':id') 
    async playerData(@Param('id', ParseIntPipe) id: number) {
        return this.playersService.obtenerJugador(id);
    }

    // 🎯 NUEVO: Obtiene los pokémones equipados del jugador
    // Ruta final: GET /players/1/pokemons
    @Get(':id/pokemons')
    async getEquippedPokemons(@Param('id', ParseIntPipe) id: number) {
        return await this.playersService.getEquippedPokemons(id);
    }

    @Post('register')
    @HttpCode(HttpStatus.CREATED) 
    public async register(@Body() registerDto: any): Promise<any> {
        return await this.playersService.register(registerDto);
    }

    @Post('login')
    @HttpCode(HttpStatus.OK) 
    public async login(@Body() loginDto: any): Promise<any> {
        return await this.playersService.login(loginDto);
    }

   // 🎯 CAMBIO: Le agregamos un verbo claro al inicio para evitar colisiones de parámetros
@Post('add/:playerId/:pokemonId')
@HttpCode(HttpStatus.CREATED)
public async addPokemon(
  @Param('playerId', ParseIntPipe) playerId: number,
  @Param('pokemonId', ParseIntPipe) pokemonId: number,
): Promise<any> {
  return await this.playersService.addPokemon(playerId, pokemonId);
}

}