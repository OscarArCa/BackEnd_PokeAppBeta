import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PokemonEntity } from '../../entities/pokemon.entity'; 
import { PokemonsService } from '@/services/pokemons/pokemons.service'; 
import { PokemonsController } from '@/controllers/pokemons/pokemons.controller'; // ◄── Ajusta la ruta a tu alias de controladores
import { PokemonEncountersEntity } from '@/entities/pokemonencounters.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([PokemonEntity, PokemonEncountersEntity])
  ],
  controllers: [PokemonsController], // ◄── Registramos el controlador aquí
  providers: [PokemonsService],
  exports: [PokemonsService] 
})
export class PokemonsModule {}