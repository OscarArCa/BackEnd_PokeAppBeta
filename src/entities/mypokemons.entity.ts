import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { PokemonEntity } from './pokemon.entity';
import { PlayerEntity } from './player.entity';

@Entity('my_pokemons')
export class MyPokemonsEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column({type:'enum', enum:['pc','equipado'], default:'equipado'})
    status!: 'pc' | 'equipado'; 

    @Column({ type: 'varchar', nullable: true })
    nickname!: string;

    @Column({default: 1})
    level!: number;

    @Column({default: 0})
    levelpoints!: number;

    @Column({ default: true })
    islife!: boolean;

    @Column({default: 100})
    lifepoints!: number;

    @Column({nullable:true})
    state!: string;

    @ManyToOne(() => PokemonEntity, (poke_mypoke) => poke_mypoke.mypokemon)
    pokemon!: PokemonEntity;

    @ManyToOne(() => PlayerEntity, (poke_player) => poke_player.mypokemon)
    player!: PlayerEntity;

}