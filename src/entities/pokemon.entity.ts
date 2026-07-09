import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { MyPokemonsEntity } from './mypokemons.entity';
import { PokemonTypeEntity } from './pokemontype.entity';
import { PokemonEncountersEntity } from './pokemonencounters.entity';

@Entity('pokemon')
export class PokemonEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    Numpokedex!: number;

    @Column()
    name!: string;

    @Column({nullable:true})
    pokedexurl!: string;

    @Column({nullable:true})
    pokemonurl!: string;

    @Column({nullable:true})
    miniurl!: string;

    @Column({nullable:true})
    description!: string;

    @ManyToOne(() => PokemonTypeEntity, (poke_type1) => poke_type1.poke_type_one)
    type_one!: PokemonTypeEntity;

    @ManyToOne(() => PokemonTypeEntity, (poke_type2) => poke_type2.poke_type_two)
    type_two!: PokemonTypeEntity;

    @OneToMany(() => MyPokemonsEntity, (mypoke_poke) => mypoke_poke.pokemon)
    mypokemon!: MyPokemonsEntity[];

    @OneToMany(() => PokemonEncountersEntity, (poke_encounter) => poke_encounter.pokemon)
    encounter!: PokemonEncountersEntity[];

}