import { Controller, Get, Param, ParseIntPipe } from '@nestjs/common';
import { PokemonsService } from '@/services/pokemons/pokemons.service'; // ◄── Ajusta la ruta real de tu service
import { PokemonEntity } from '../../entities/pokemon.entity'; // ◄── Ajusta la ruta real de tu entity
import { PokemonEncountersEntity } from '@/entities/pokemonencounters.entity';

@Controller('pokemons')
export class PokemonsController {
  constructor(private readonly pokemonsService: PokemonsService) {}

  /**
   * Endpoint: GET /pokemons/iniciales
   * Retorna los datos de Bulbasaur, Charmander y Squirtle desde la DB
   */
  @Get('iniciales')
  public async getIniciales(): Promise<PokemonEntity[]> {
    return await this.pokemonsService.obtenerIniciales();
  }

  @Get(':mapId/encuentros')
  public async getEncounter(
    // 1. Extraemos el mapId de la URL y lo convertimos a número de forma segura
    @Param('mapId', ParseIntPipe) mapId: number, 
  ): Promise<PokemonEncountersEntity> { // 2. Actualizamos el tipo de retorno
    
    // 3. Pasamos el mapId al servicio
    return await this.pokemonsService.getRandomEncounterByMap(mapId); 
  }
}
