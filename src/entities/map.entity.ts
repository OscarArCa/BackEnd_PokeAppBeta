import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { PlayerEntity } from './player.entity';
import { PokemonEncountersEntity } from './pokemonencounters.entity';

@Entity('map')
export class MapEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    name!: string;

    @Column()
    tmjurl!: string

    @Column()
    tileseturl!: string

    @OneToMany(() => PlayerEntity, (map) => map.map_player)
    player!: PlayerEntity[];

    @OneToMany(() => PokemonEncountersEntity, (encounter_map) => encounter_map.map)
    encounter!: PokemonEncountersEntity[];
}