import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { PokemonEntity } from './pokemon.entity';

@Entity('pokemon_type')
export class PokemonTypeEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    name!: string;

    @Column()
    color!: string;

    @OneToMany(() => PokemonEntity, (type_poke1) => type_poke1.type_one)
    poke_type_one!: PokemonEntity[];

    @OneToMany(() => PokemonEntity, (type_poke2) => type_poke2.type_two)
    poke_type_two!: PokemonEntity[];

}