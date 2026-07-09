import { PlayersController } from '@/controllers/players/players.controller';
import { PlayerEntity } from '@/entities/player.entity';
import { MyPokemonsEntity } from '@/entities/mypokemons.entity';
import { PlayersService } from '@/services/players/players.service';
import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt'; // ◄── Añadimos el import oficial
import { TypeOrmModule } from '@nestjs/typeorm';
import { PokemonEntity } from '@/entities/pokemon.entity';
import { MapEntity } from '@/entities/map.entity';

@Module({
    imports: [
        TypeOrmModule.forFeature([PlayerEntity, MyPokemonsEntity, PokemonEntity, MapEntity]),
        // ◄── Configuramos el generador de tokens
        JwtModule.register({
            secret: 'MI_PALABRA_SECRETA_SUPER_SEGURA', // Cambia esto por lo que quieras
            signOptions: { expiresIn: '1d' }, // El token durará 1 día entero
        }),
    ],
    controllers: [PlayersController], // ◄── CRUCIAL: Si esto no está aquí, da 404
    providers: [PlayersService],
})
export class PlayersModule {}