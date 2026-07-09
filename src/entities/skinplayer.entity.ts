import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { PlayerEntity } from './player.entity';

@Entity('skin_player')
export class SkinPlayerEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    name!: string;

    @Column({type:'enum', enum:['masculino', 'femenino'], default: 'masculino'})
    gender!: 'masculino' | 'femenino';

    @Column()
    url!: string

    @OneToMany(() => PlayerEntity, (skin) => skin.skin_player)
    player!: PlayerEntity[];
}