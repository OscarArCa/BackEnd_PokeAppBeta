import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany} from 'typeorm'; // ◄── Cambiado a 'typeorm' plano
import { ProfileImagesEntity } from './profileImages.entity';
import { SkinPlayerEntity } from './skinplayer.entity';
import { MapEntity } from './map.entity';
import { MyPokemonsEntity } from './mypokemons.entity';

@Entity('players') // ◄── Cambiado a @Entity para que cree la tabla en MySQL
export class PlayerEntity { // ◄── Cambiado el nombre a PlayerEntity

    @PrimaryGeneratedColumn()
    id!: number;

    @Column({ unique: true })
    username!: string;

    @Column({type:'enum', enum:['masculino', 'femenino'], default: 'masculino'})
    gender!: 'masculino' | 'femenino';

    @Column({ default: 1000 })
    gold!: number;

    @Column({default: 1})
    level!: number;

    @Column({default: 0})
    levelpoints!: number;

    @Column({nullable:false})
    password!: string;

    @Column('float', { default: 500 })
    x!: number;

    @Column('float', { default: 500 })
    y!: number;

    @ManyToOne(() => ProfileImagesEntity, (player_img) => player_img.player)
    profile!: ProfileImagesEntity;

    @ManyToOne(() => SkinPlayerEntity, (player_skin) => player_skin.player)
    skin_player!: SkinPlayerEntity;

    @ManyToOne(() => MapEntity, (player_skin) => player_skin.player)
    map_player!: MapEntity;

    @OneToMany(() => MyPokemonsEntity, (player_mypoke) => player_mypoke.player)
    mypokemon!: MyPokemonsEntity[];
}