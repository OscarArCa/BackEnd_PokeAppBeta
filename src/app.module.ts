import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PlayersModule } from './modules/players/players.module';
import { GameModule } from './game/game.module';
import { PokemonsModule } from './modules/pokemons/pokemons.module'; // ◄── Este ya incluye el controller y service

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),

    TypeOrmModule.forRoot({
      type: 'mysql',
      host: process.env.DB_HOST || 'localhost',
      port: parseInt(process.env.DB_PORT || '3306', 10),
      username: process.env.DB_USERNAME || 'root',
      password: process.env.DB_PASSWORD || '123',
      database: process.env.DB_NAME || 'poke_game',
      entities: [__dirname + '/entities/*.entity{.ts,.js}'], 
      synchronize: true,      
    }),

    PlayersModule,
    GameModule,
    PokemonsModule, // ◄── Dejamos solo el módulo aquí
  ],
  controllers: [], // ◄── VACÍO (Ya se maneja dentro de sus respectivos módulos)
  providers: [],   // ◄── VACÍO (Ya se maneja dentro de sus respectivos módulos)
})
export class AppModule {}