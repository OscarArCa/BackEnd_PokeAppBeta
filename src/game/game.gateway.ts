import { 
  WebSocketGateway, 
  WebSocketServer, 
  SubscribeMessage, 
  OnGatewayConnection, 
  OnGatewayDisconnect 
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { PlayerEntity } from '@/entities/player.entity';

interface DatosJugador {
  id: string; // ID del Socket (conexión)
  idDb: number;
  x: number;
  y: number;
  direction: string;
  skin: string;
  username: string;
}

@WebSocketGateway({
  cors: { origin: '*' },
})
export class GameGateway implements OnGatewayConnection, OnGatewayDisconnect {
  @WebSocketServer()
  server!: Server; 

  private jugadoresActivos: Map<string, DatosJugador> = new Map();

  constructor(
    @InjectRepository(PlayerEntity)
    private readonly playerRepository: Repository<PlayerEntity>,
  ) {}

  handleConnection(client: Socket) {
    console.log(`Jugador conectado al mapa: ${client.id}`);
  }

  handleDisconnect(client: Socket) {
    console.log(`Jugador desconectado del mapa: ${client.id}`);
    this.jugadoresActivos.delete(client.id);
    this.server.emit('jugador_desconectado', client.id);
  }

  @SubscribeMessage('ingresar_al_juego')
  handleIngresar(client: Socket, payload: { idDb: number; x: number; y: number; skin: string; username: string }) {
    const nuevoJugador: DatosJugador = {
      id: client.id,
      idDb: payload.idDb,
      x: payload.x,
      y: payload.y,
      direction: 'down',
      skin: payload.skin,
      username: payload.username,
    };

    const jugadoresAnteriores = Array.from(this.jugadoresActivos.values());
    this.jugadoresActivos.set(client.id, nuevoJugador);

    client.broadcast.emit('nuevo_jugador_ingresado', nuevoJugador);
    client.emit('lista_jugadores_actuales', jugadoresAnteriores);
  }

  @SubscribeMessage('mover_jugador')
  handleMoverJugador(client: Socket, payload: { x: number; y: number; direction: string }) {
    const jugador = this.jugadoresActivos.get(client.id);
    if (jugador) {
      jugador.x = payload.x;
      jugador.y = payload.y;
      jugador.direction = payload.direction;
      
      client.broadcast.emit('jugador_movido', jugador);

      this.playerRepository.update(jugador.idDb, { x: payload.x, y: payload.y })
        .catch(error => console.error('Error al guardar posición en DB:', error));
    }
  }

 // ─── 💬 RETRANSMISIÓN DIRECTA DE MENSAJE PARA GLOBO (CON ID_DB) ───
  @SubscribeMessage('enviar_mensaje')
  handleEnviarMensaje(client: Socket, payload: { texto: string }) {
    const jugador = this.jugadoresActivos.get(client.id);
    if (jugador && payload.texto.trim() !== '') {
      // Ahora enviamos el idDb del jugador que está en memoria RAM
      this.server.emit('jugador_hablo', {
        idSocket: client.id,
        idDb: jugador.idDb, // ◄── ESTA ES LA LÍNEA QUE AGREGAMOS
        texto: payload.texto.trim()
      });
    }
  }
}