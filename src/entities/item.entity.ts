import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity('item')
export class ItemEntity{

    @PrimaryGeneratedColumn()
    id!: number;

    @Column()
    name!: string;

    @Column({nullable:true})
    url!: string;

    @Column({nullable:true})
    description!: string;

    @Column({type: 'enum',enum: ['objetos','medicina','pokeballs','mts','mos','objetosclave','objetoscombate','objetosevolutivos','bayas','correo',],})
    type!: 'objetos'| 'medicina'| 'pokeballs'| 'mts'| 'mos'| 'objetosclave'| 'objetoscombate'| 'objetosevolutivos'| 'bayas'| 'correo';

    @Column({default:false})
    isEquiped!: boolean;
}