import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm'; // ◄── Añadir esto
import { GameGateway } from './game.gateway';
import { PlayerEntity } from '@/entities/player.entity'; // ◄── Añadir tu entidad de jugadores

@Module({
  imports: [
    // Esto le da el superpoder al Gateway de usar 'playerRepository'
    TypeOrmModule.forFeature([PlayerEntity]) // ◄── Añadir esto
  ],
  providers: [GameGateway],
})
export class GameModule {}