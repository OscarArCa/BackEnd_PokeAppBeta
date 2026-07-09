import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { PlayerEntity } from './player.entity';

@Entity('profile_images')
export class ProfileImagesEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    name!: string;

    @Column({type:'enum', enum:['masculino', 'femenino'], default: 'masculino'})
    gender!: 'masculino' | 'femenino';

    @Column()
    url!: string

    @OneToMany(() => PlayerEntity, (profile_img) => profile_img.profile)
    player!: PlayerEntity[];
}