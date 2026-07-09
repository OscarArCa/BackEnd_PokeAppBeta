import { Entity, PrimaryGeneratedColumn, Column, OneToMany, ManyToOne } from 'typeorm';
import { PlayerEntity } from './player.entity';
import { MapEntity } from './map.entity';
import { PokemonEntity } from './pokemon.entity';

@Entity('pokemon_encounters')
export class PokemonEncountersEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    max_level!: number;

    @Column()
    min_level!: number;

    @ManyToOne(() => MapEntity, (map_encounter) => map_encounter.encounter)
    map!: MapEntity;

    @ManyToOne(() => PokemonEntity, (encounter_poke) => encounter_poke.encounter)
    pokemon!: PokemonEntity;
}