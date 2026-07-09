-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql-db
-- Tiempo de generación: 09-07-2026 a las 18:37:14
-- Versión del servidor: 8.4.10
-- Versión de PHP: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mi_base`
--
CREATE DATABASE IF NOT EXISTS `mi_base` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `mi_base`;
--
-- Base de datos: `poke_game`
--
CREATE DATABASE IF NOT EXISTS `poke_game` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `poke_game`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` enum('objetos','medicina','pokeballs','mts','mos','objetosclave','objetoscombate','objetosevolutivos','bayas','correo') NOT NULL,
  `isEquiped` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`id`, `name`, `url`, `description`, `type`, `isEquiped`) VALUES
(1, 'Master Ball', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/MASTERBALL.png', 'La Poké Ball definitiva. Atrapa cualquier Pokémon sin fallar.', 'pokeballs', 0),
(2, 'Ultra Ball', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/ULTRABALL.png', 'Una Poké Ball de alto rendimiento con un índice de captura muy elevado.', 'pokeballs', 0),
(3, 'Super Ball', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/GREATBALL.png', 'Una Poké Ball de buen rendimiento con un índice de captura superior al de la Poké Ball.', 'pokeballs', 0),
(4, 'Poké Ball', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/POKEBALL.png', 'Una cápsula diseñada para capturar Pokémon salvajes.', 'pokeballs', 0),
(5, 'Safari Ball', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/SAFARIBALL.png', 'Una Poké Ball exclusiva para capturar Pokémon en la Zona Safari.', 'pokeballs', 0),
(6, 'Poción', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/POTION.png', 'Restaura 20 PS de un Pokémon.', 'medicina', 0),
(7, 'Superpoción', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/SUPERPOTION.png', 'Restaura 50 PS de un Pokémon.', 'medicina', 0),
(8, 'Hiperpoción', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/HYPERPOTION.png', 'Restaura 200 PS de un Pokémon.', 'medicina', 0),
(9, 'Máxima Poción', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/MAXPOTION.png', 'Restaura todos los PS de un Pokémon.', 'medicina', 0),
(10, 'Restaurar Todo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/FULLRESTORE.png', 'Restaura todos los PS y cura cualquier problema de estado.', 'medicina', 0),
(11, 'Antídoto', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/ANTIDOTE.png', 'Cura el envenenamiento de un Pokémon.', 'medicina', 0),
(12, 'Antiquemar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/BURNHEAL.png', 'Cura las quemaduras de un Pokémon.', 'medicina', 0),
(13, 'Antihielo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/ICEHEAL.png', 'Descongela a un Pokémon.', 'medicina', 0),
(14, 'Despertar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/AWAKENING.png', 'Despierta a un Pokémon dormido.', 'medicina', 0),
(15, 'Antiparalizador', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/PARALYZEHEAL.png', 'Cura la parálisis de un Pokémon.', 'medicina', 0),
(16, 'Cura Total', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/FULLHEAL.png', 'Cura cualquier problema de estado de un Pokémon.', 'medicina', 0),
(17, 'Revivir', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/REVIVE.png', 'Revive a un Pokémon debilitado con la mitad de sus PS.', 'medicina', 0),
(18, 'Máximo Revivir', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/MAXREVIVE.png', 'Revive a un Pokémon debilitado con todos sus PS.', 'medicina', 0),
(19, 'Éter', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/ETHER.png', 'Restaura 10 PP de un movimiento.', 'medicina', 0),
(20, 'Máximo Éter', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/MAXETHER.png', 'Restaura todos los PP de un movimiento.', 'medicina', 0),
(21, 'Elixir', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/ELIXIR.png', 'Restaura 10 PP de todos los movimientos.', 'medicina', 0),
(22, 'Máximo Elixir', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/MAXELIXIR.png', 'Restaura todos los PP de todos los movimientos.', 'medicina', 0),
(23, 'Más PP', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/PPUP.png', 'Aumenta permanentemente los PP máximos de un movimiento.', 'medicina', 0),
(24, 'Más PS', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/HPUP.png', 'Aumenta permanentemente los PS base de un Pokémon.', 'medicina', 0),
(25, 'Proteína', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/PROTEIN.png', 'Aumenta permanentemente el Ataque base de un Pokémon.', 'medicina', 0),
(26, 'Hierro', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/IRON.png', 'Aumenta permanentemente la Defensa base de un Pokémon.', 'medicina', 0),
(27, 'Carburante', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/CARBOS.png', 'Aumenta permanentemente la Velocidad base de un Pokémon.', 'medicina', 0),
(28, 'Calcio', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/CALCIUM.png', 'Aumenta permanentemente el Ataque Especial base de un Pokémon.', 'medicina', 0),
(29, 'Caramelo Raro', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/RARECANDY.png', 'Hace subir un nivel a un Pokémon.', 'medicina', 0),
(30, 'Cuerda Huida', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/ESCAPEROPE.png', 'Permite escapar instantáneamente de una cueva o mazmorra.', 'objetos', 0),
(31, 'Repelente', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/REPEL.png', 'Evita temporalmente los encuentros con Pokémon salvajes débiles.', 'objetos', 0),
(32, 'Superrepelente', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/SUPERREPEL.png', 'Evita durante más tiempo los encuentros con Pokémon salvajes débiles.', 'objetos', 0),
(33, 'Máximo Repelente', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/MAXREPEL.png', 'Evita durante mucho más tiempo los encuentros con Pokémon salvajes débiles.', 'objetos', 0),
(34, 'Muñeco Poké', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/POKEDOLL.png', 'Un muñeco que permite huir fácilmente de los combates contra Pokémon salvajes.', 'objetos', 0),
(35, 'Agua Fresca', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/FRESHWATER.png', 'Restaura 50 PS de un Pokémon.', 'objetos', 0),
(36, 'Refresco', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/SODAPOP.png', 'Restaura 60 PS de un Pokémon.', 'objetos', 0),
(37, 'Limonada', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/LEMONADE.png', 'Restaura 80 PS de un Pokémon.', 'objetos', 0),
(38, 'Moneda', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/players/pokecoin.png', 'Una moneda que puede usarse para jugar en el Casino.', 'objetos', 0),
(39, 'Pepita', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/NUGGET.png', 'Una pepita de oro puro que puede venderse por un alto precio.', 'objetos', 0),
(40, 'Repartir Experiencia', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/EXPSHARE.png', 'Comparte la experiencia obtenida en combate con todo el equipo.', 'objetos', 0),
(41, 'MT01 Puño Mega', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un movimiento de tipo Normal que golpea al objetivo con una fuerza descomunal.', 'mts', 0),
(42, 'MT02 Ciclón', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un movimiento que lanza un fuerte ciclón que puede hacer retroceder al rival.', 'mts', 0),
(43, 'MT03 Golpe Cuerpo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un ataque físico que golpea al enemigo con todo el cuerpo.', 'mts', 0),
(44, 'MT04 Cometa', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Lanza un proyectil en forma de cometa que golpea al objetivo.', 'mts', 0),
(45, 'MT05 Mega Patada', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Una poderosa patada que causa gran daño al rival.', 'mts', 0),
(46, 'MT06 Toxic', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_POISON.png', 'Un movimiento que envenena gravemente al objetivo.', 'mts', 0),
(47, 'MT07 Perforador', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un ataque que perfora al rival con una fuerza capaz de causar un golpe crítico.', 'mts', 0),
(48, 'MT08 Hiperrayo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un poderoso rayo de energía que causa un gran daño, pero requiere un turno de descanso.', 'mts', 0),
(49, 'MT09 Derribo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un ataque físico que causa daño al rival aunque también puede afectar al usuario.', 'mts', 0),
(50, 'MT10 Doble Filo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un fuerte golpe que causa daño al objetivo y al usuario por el retroceso.', 'mts', 0),
(51, 'MT11 Burbuja', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_WATER.png', 'Lanza una corriente de burbujas que puede reducir la velocidad del enemigo.', 'mts', 0),
(52, 'MT12 Rayo Aurora', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_WATER.png', 'Dispara un rayo helado que puede congelar al objetivo.', 'mts', 0),
(53, 'MT13 Rayo Hielo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ICE.png', 'Un poderoso ataque de hielo que puede congelar al rival.', 'mts', 0),
(54, 'MT14 Ventisca', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ICE.png', 'Una tormenta de hielo que golpea a todos los enemigos cercanos.', 'mts', 0),
(55, 'MT15 Hiperrayo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un ataque de energía extremadamente poderoso que obliga al usuario a descansar.', 'mts', 0),
(56, 'MT16 Día de Pago', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'El usuario lanza monedas al rival y gana dinero tras el combate.', 'mts', 0),
(57, 'MT17 Sumisión', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_FIGHTING.png', 'Un ataque físico muy fuerte que puede dejar al usuario confundido.', 'mts', 0),
(58, 'MT18 Contador', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_FIGHTING.png', 'Devuelve al rival el doble del daño recibido mediante un contraataque.', 'mts', 0),
(59, 'MT19 Movimiento Sísmico', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_FIGHTING.png', 'Un movimiento que causa daño fijo equivalente al nivel del usuario.', 'mts', 0),
(60, 'MT20 Furia', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un ataque que aumenta su potencia conforme se usa repetidamente.', 'mts', 0),
(61, 'MT21 Megaagotar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_GRASS.png', 'Absorbe energía del rival y restaura los PS del usuario.', 'mts', 0),
(62, 'MT22 Rayo Solar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_GRASS.png', 'Acumula energía solar durante un turno y lanza un potente rayo de luz.', 'mts', 0),
(63, 'MT23 Cola Dragón', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_DRAGON.png', 'Un ataque de tipo Dragón que golpea al objetivo y puede reducir sus capacidades.', 'mts', 0),
(64, 'MT24 Rayo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ELECTRIC.png', 'Un poderoso ataque eléctrico que puede paralizar al objetivo.', 'mts', 0),
(65, 'MT25 Trueno', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ELECTRIC.png', 'Un ataque eléctrico muy potente que puede paralizar al enemigo.', 'mts', 0),
(66, 'MT26 Terremoto', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_GROUND.png', 'Un potente terremoto que golpea a todos los Pokémon cercanos.', 'mts', 0),
(67, 'MT27 Fisura', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_GROUND.png', 'Un ataque que derrota al rival de un solo golpe si acierta.', 'mts', 0),
(68, 'MT28 Excavar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_GROUND.png', 'El usuario excava bajo tierra durante un turno y ataca después.', 'mts', 0),
(69, 'MT29 Psíquico', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_PSYCHIC.png', 'Un poderoso ataque psíquico que puede reducir la defensa especial del rival.', 'mts', 0),
(70, 'MT30 Teletransporte', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_PSYCHIC.png', 'Permite escapar de una batalla contra Pokémon salvajes y volver a un lugar conocido.', 'mts', 0),
(71, 'MT31 Mimético', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Copia temporalmente el último movimiento usado por el rival.', 'mts', 0),
(72, 'MT32 Doble Equipo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Aumenta la evasión del usuario creando copias ilusorias.', 'mts', 0),
(73, 'MT33 Reflejo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_PSYCHIC.png', 'Crea una barrera que reduce el daño recibido por ataques físicos.', 'mts', 0),
(74, 'MT34 Venganza', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Lanza una bomba que puede causar una gran explosión al rival.', 'mts', 0),
(75, 'MT35 Metronomo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Usa un movimiento aleatorio de entre todos los movimientos conocidos.', 'mts', 0),
(76, 'MT36 Autodestrucción', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Provoca una explosión que causa gran daño y deja fuera de combate al usuario.', 'mts', 0),
(77, 'MT37 Bomba Huevo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Lanza un huevo explosivo que golpea al rival.', 'mts', 0),
(78, 'MT38 Lanzallamas', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_FIRE.png', 'Lanza una potente llamarada que puede quemar al enemigo.', 'mts', 0),
(79, 'MT39 Swift', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un ataque rápido que nunca falla al golpear al objetivo.', 'mts', 0),
(80, 'MT40 Calavera', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Golpea al enemigo con una calavera endurecida.', 'mts', 0),
(81, 'MT41 Soft-Boiled', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Recupera los PS del usuario mediante descanso y recuperación.', 'mts', 0),
(82, 'MT42 Come Sueños', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_PSYCHIC.png', 'Permite atacar al rival mientras duerme y puede causar más daño.', 'mts', 0),
(83, 'MT43 Sky Attack', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_FLYING.png', 'Un poderoso ataque aéreo que requiere preparación antes de golpear.', 'mts', 0),
(84, 'MT44 Descanso', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_PSYCHIC.png', 'El usuario duerme para recuperar completamente sus PS y eliminar problemas de estado.', 'mts', 0),
(85, 'MT45 Onda Trueno', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ELECTRIC.png', 'Una descarga eléctrica que puede paralizar al enemigo.', 'mts', 0),
(86, 'MT46 Psicoonda', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_PSYCHIC.png', 'Lanza una onda psíquica que causa daño variable.', 'mts', 0),
(87, 'MT47 Explosión', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ELECTRIC.png', 'Una enorme explosión que causa daño masivo y deja debilitado al usuario.', 'mts', 0),
(88, 'MT48 Derrumbe', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ROCK.png', 'Lanza rocas contra el rival causando daño físico.', 'mts', 0),
(89, 'MT49 Triataque', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ELECTRIC.png', 'Un ataque que dispara tres tipos de energía diferentes.', 'mts', 0),
(90, 'MT50 Sustituto', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_ELECTRIC.png', 'Crea un sustituto que recibe daño en lugar del usuario.', 'mts', 0),
(91, 'MO01 Corte', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un movimiento que corta pequeños árboles y objetos que bloquean el camino.', 'mos', 0),
(92, 'MO02 Vuelo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_FLYING.png', 'Permite al Pokémon volar hacia lugares visitados anteriormente fuera de combate.', 'mos', 0),
(93, 'MO03 Surf', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_WATER.png', 'Permite desplazarse por el agua montando sobre un Pokémon.', 'mos', 0),
(94, 'MO04 Fuerza', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Un poderoso movimiento físico que permite mover rocas pesadas y obstáculos.', 'mos', 0),
(95, 'MO05 Destello', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/machine_NORMAL.png', 'Ilumina zonas oscuras y permite avanzar por lugares con poca visibilidad.', 'mos', 0),
(96, 'Mapa', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/TOWNMAP.png', 'Un mapa que muestra la región y los lugares importantes visitados.', 'objetosclave', 0),
(97, 'Bicicleta', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/BICYCLE.png', 'Una bicicleta que permite desplazarse más rápido por tierra.', 'objetosclave', 0),
(98, 'Pokédex', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/POKEDEX_key.png', 'Un dispositivo que registra información de los Pokémon encontrados y capturados.', 'objetosclave', 0),
(99, 'Llave Secreta', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/llave_secreta_(Kanto).png', 'Una llave especial utilizada para abrir lugares secretos.', 'objetosclave', 0),
(100, 'Vale Bici', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/bono_bici.png', 'Un vale que permite obtener una bicicleta gratuitamente.', 'objetosclave', 0),
(101, 'Tarjeta Llave', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/LLAVEMAGNETICA.png', 'La Llave Magnética permite abrir las puertas bloqueadas.', 'objetosclave', 0),
(102, 'Billete Barco', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/Ticket_del_barco.png', 'Un billete que permite viajar en barco hacia otros destinos.', 'objetosclave', 0),
(103, 'Dentadura de Oro', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/Dentadura_de_oro.png', 'Una dentadura de oro perdida que pertenece a una persona importante.', 'objetosclave', 0),
(104, 'Paquete de Oak', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/Artwork_Paquete.png', 'Un paquete entregado por el Profesor Oak que debe ser llevado a su destino.', 'objetosclave', 0),
(105, 'Buscaobjetos', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/ITEMFINDER.png', 'Emite sonido al detectar un objeto cerca.', 'objetosclave', 0),
(106, 'Silph Scope', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/SILPHSCOPE.png', 'Un objeto especial que permite ver Pokémon fantasmas ocultos.', 'objetosclave', 0),
(107, 'Poké Flauta', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/POKEFLUTE.png', 'Una flauta especial cuyo sonido puede despertar Pokémon dormidos.', 'objetosclave', 0),
(108, 'Llave del Ascensor', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/llave_ascensor_(Kanto).png', NULL, 'objetosclave', 0),
(109, 'Caña Vieja', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/OLDROD.png', 'Una caña básica utilizada para pescar Pokémon en el agua.', 'objetosclave', 0),
(110, 'Caña Buena', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/GOODROD.png', 'Una caña de pesca de calidad media para encontrar Pokémon acuáticos.', 'objetosclave', 0),
(111, 'Supercaña', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/SUPERROD.png', 'Una caña mejorada que permite pescar Pokémon más raros.', 'objetosclave', 0),
(112, 'Monedero', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/COINCASE.png', NULL, 'objetosclave', 0),
(113, 'Ataque X', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/XATTACK.png', 'Aumenta temporalmente el ataque del Pokémon durante un combate.', 'objetoscombate', 0),
(114, 'Defensa X', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/XDEFENSE.png', 'Aumenta temporalmente la defensa del Pokémon durante un combate.', 'objetoscombate', 0),
(115, 'Velocidad X', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/XSPEED.png', 'Aumenta temporalmente la velocidad del Pokémon durante un combate.', 'objetoscombate', 0),
(116, 'Especial X', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/XSPATK.png', 'Aumenta temporalmente el ataque especial del Pokémon durante un combate.', 'objetoscombate', 0),
(117, 'Precisión X', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/XACCURACY.png', 'Aumenta temporalmente la precisión del Pokémon durante un combate.', 'objetoscombate', 0),
(118, 'Dire Hit', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/DIREHIT.png', 'Aumenta la probabilidad de realizar golpes críticos durante un combate.', 'objetoscombate', 0),
(119, 'Guard Spec.', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/GUARDSPEC.png', NULL, 'objetoscombate', 0),
(120, 'Piedra Fuego', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/FIRESTONE.png', 'Una piedra evolutiva que permite evolucionar ciertos Pokémon de tipo Fuego.', 'objetosevolutivos', 0),
(121, 'Piedra Agua', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/WATERSTONE.png', 'Una piedra evolutiva que permite evolucionar ciertos Pokémon de tipo Agua.', 'objetosevolutivos', 0),
(122, 'Piedra Trueno', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/THUNDERSTONE.png', 'Una piedra evolutiva que permite evolucionar ciertos Pokémon de tipo Eléctrico.', 'objetosevolutivos', 0),
(123, 'Piedra Hoja', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/LEAFSTONE.png', 'Una piedra evolutiva que permite evolucionar ciertos Pokémon de tipo Planta.', 'objetosevolutivos', 0),
(124, 'Piedra Lunar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/MOONSTONE.png', 'Una piedra evolutiva que permite evolucionar ciertos Pokémon especiales.', 'objetosevolutivos', 0),
(125, 'Fósil Domo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/DOMEFOSSIL.png', 'Un fósil antiguo con forma de caparazón que puede restaurar un Pokémon extinto.', 'objetosevolutivos', 0),
(126, 'Fósil Helix', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/HELIXFOSSIL.png', 'Un fósil antiguo con forma de espiral que puede restaurar un Pokémon extinto.', 'objetosevolutivos', 0),
(127, 'Ámbar Viejo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/items/OLDAMBER.png', 'Un fósil de un Pokémon antiguo que puede ser restaurado mediante tecnología especial.', 'objetosevolutivos', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `map`
--

CREATE TABLE `map` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `tmjurl` varchar(255) NOT NULL,
  `tileseturl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `map`
--

INSERT INTO `map` (`id`, `name`, `tmjurl`, `tileseturl`) VALUES
(1, 'Exterior1', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/maps/PuebloInicial.tmj', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/maps/Exterior1.png'),
(2, 'battleGrassMap', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/maps/battleGrassMap.tmj', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/maps/Outside.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `my_pokemons`
--

CREATE TABLE `my_pokemons` (
  `id` int NOT NULL,
  `status` enum('pc','equipado') NOT NULL DEFAULT 'equipado',
  `nickname` varchar(255) DEFAULT NULL,
  `level` int NOT NULL DEFAULT '1',
  `levelpoints` int NOT NULL DEFAULT '0',
  `islife` tinyint NOT NULL DEFAULT '1',
  `lifepoints` int NOT NULL DEFAULT '100',
  `state` varchar(255) DEFAULT NULL,
  `pokemonId` int DEFAULT NULL,
  `playerId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `my_pokemons`
--

INSERT INTO `my_pokemons` (`id`, `status`, `nickname`, `level`, `levelpoints`, `islife`, `lifepoints`, `state`, `pokemonId`, `playerId`) VALUES
(1, 'equipado', NULL, 5, 0, 1, 100, NULL, 4, 1),
(2, 'equipado', NULL, 5, 0, 1, 100, NULL, 23, 1),
(3, 'equipado', NULL, 5, 0, 1, 100, NULL, 63, 1),
(4, 'equipado', NULL, 5, 0, 1, 100, NULL, 69, 1),
(5, 'equipado', NULL, 5, 0, 1, 100, NULL, 10, 1),
(6, 'equipado', NULL, 5, 0, 1, 100, NULL, 133, 1),
(7, 'pc', NULL, 5, 0, 1, 100, NULL, 74, 1),
(8, 'equipado', NULL, 5, 0, 1, 100, NULL, 7, 2),
(9, 'equipado', NULL, 5, 0, 1, 100, NULL, 63, 2),
(10, 'equipado', NULL, 5, 0, 1, 100, NULL, 69, 2),
(11, 'equipado', NULL, 5, 0, 1, 100, NULL, 74, 2),
(12, 'equipado', NULL, 5, 0, 1, 100, NULL, 23, 2),
(13, 'equipado', NULL, 5, 0, 1, 100, NULL, 10, 2),
(14, 'pc', NULL, 5, 0, 1, 100, NULL, 133, 2),
(15, 'equipado', NULL, 5, 0, 1, 100, NULL, 7, 3),
(16, 'equipado', NULL, 5, 0, 1, 100, NULL, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `gender` enum('masculino','femenino') NOT NULL DEFAULT 'masculino',
  `gold` int NOT NULL DEFAULT '1000',
  `level` int NOT NULL DEFAULT '1',
  `levelpoints` int NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `x` float NOT NULL DEFAULT '500',
  `y` float NOT NULL DEFAULT '500',
  `profileId` int DEFAULT NULL,
  `skinPlayerId` int DEFAULT NULL,
  `mapPlayerId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `players`
--

INSERT INTO `players` (`id`, `username`, `gender`, `gold`, `level`, `levelpoints`, `password`, `x`, `y`, `profileId`, `skinPlayerId`, `mapPlayerId`) VALUES
(1, 'Alastor', 'masculino', 1000, 1, 0, '$2b$10$qfvxAKDhPaCjvErDGzeL4uCXdLb/VPNNV.o/UfCfzAYeJyv58Mg52', 3715.6, 443.166, 1, 1, 1),
(2, ' sohJ', 'masculino', 1000, 1, 0, '$2b$10$.S3nYFundDyTj/BBk2SLXujtgh2q5q2whA1kCwIGOOLRIntLBhJuC', 4103.1, 472.533, 1, 1, 1),
(3, 'beta', 'masculino', 1000, 1, 0, '$2b$10$vXtQnlKrweQ.B/MaVfjnuuswPFbheTSc6hlai7m9BY1ajMxjKSWMW', 3720.83, 404.167, 1, 1, 1),
(4, 'Juan', 'masculino', 1000, 1, 0, '$2b$10$UCiL46eXpyq/MudMKdSMk.1HjrtTaOEZJ4LB2AuCPVQyS2ugHW2JC', 3333.17, 339.2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int NOT NULL,
  `Numpokedex` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `pokedexurl` varchar(255) DEFAULT NULL,
  `pokemonurl` varchar(255) DEFAULT NULL,
  `miniurl` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `typeOneId` int DEFAULT NULL,
  `typeTwoId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`id`, `Numpokedex`, `name`, `pokedexurl`, `pokemonurl`, `miniurl`, `description`, `typeOneId`, `typeTwoId`) VALUES
(1, 1, 'Bulbasaur', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/001.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/001.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon001.png', 'Lleva un bulbo en el lomo desde que nace. A medida que el Pokémon crece, el bulbo también va haciéndose más grande.', 4, 8),
(2, 2, 'Ivysaur', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/002.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/002.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon002.png', 'Cuanta más luz solar recibe, más aumenta su fuerza y más se desarrolla el capullo que tiene en el lomo.', 4, 8),
(3, 3, 'Venusaur', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/003.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/003.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon003.png', 'Después de un día de lluvia, el aroma de la flor que tiene en el lomo se intensifica y atrae a otros Pokémon.', 4, 8),
(4, 4, 'Charmander', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/004.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/004.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon004.png', 'La llama de su cola indica su fuerza vital. Si está débil, la llama arderá más tenue.', 2, NULL),
(5, 5, 'Charmeleon', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/005.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/005.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon005.png', 'Al agitar su ardiente cola, eleva poco a poco la temperatura a su alrededor para sofocar a sus rivales.', 2, NULL),
(6, 6, 'Charizard', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/006.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/006.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon006.png', 'Sus potentes alas le permiten volar a una altura de 1,400 m. Escupe llamaradas que alcanzan temperaturas muy elevadas.', 2, 10),
(7, 7, 'Squirtle', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/007.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/007.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon007.png', 'Tras nacer, se le hincha el lomo y se le forma un caparazón. Escupe poderosa espuma por la boca.', 3, NULL),
(8, 8, 'Wartortle', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/008.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/008.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon008.png', 'Tiene una cola larga y peluda que simboliza la longevidad y lo hace popular entre los mayores.', 3, NULL),
(9, 9, 'Blastoise', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/009.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/009.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon009.png', 'Para vencer a su enemigo, lo aplasta con el peso de su cuerpo. En momentos de apuro, se esconde en el caparazón.', 3, NULL),
(10, 10, 'Caterpie', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/010.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/010.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon010.png', 'Para protegerse, despide un hedor horrible por las antenas con el que repele a sus enemigos.', 12, NULL),
(11, 11, 'Metapod', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/011.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/011.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon011.png', 'Como en este estado solo puede endurecer su coraza, permanece inmóvil a la espera de evolucionar.', 12, NULL),
(12, 12, 'Butterfree', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/012.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/012.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon012.png', 'Adora el néctar de las flores. Una pequeña cantidad de polen le basta para localizar prados floridos.', 12, 10),
(13, 13, 'Weedle', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/013.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/013.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon013.png', 'El aguijón de la cabeza es muy puntiagudo. Se alimenta de hojas oculto en la espesura de bosques y praderas.', 12, 8),
(14, 14, 'Kakuna', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/014.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/014.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon014.png', 'Aunque es casi incapaz de moverse, en caso de sentirse amenazado puede envenenar a los enemigos con su aguijón.', 12, NULL),
(15, 15, 'Beedrill', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/015.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/015.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon015.png', 'Tiene tres aguijones venenosos, dos en las patas anteriores y uno en la parte baja del abdomen, con los que ataca a sus enemigos una y otra vez.', 12, 8),
(16, 16, 'Pidgey', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/016.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/016.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon016.png', 'Su docilidad es tal que suelen defenderse levantando arena en lugar de contraatacar.', 1, NULL),
(17, 17, 'Pidgeotto', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/017.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/017.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon017.png', 'Su extraordinaria vitalidad y resistencia le permiten cubrir grandes distancias del territorio que habita en busca de presas.', 1, NULL),
(18, 18, 'Pidgeot', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/018.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/018.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon018.png', 'Este Pokémon vuela a una velocidad de 2 mach en busca de presas. Sus grandes garras son armas muy peligrosas.', 1, NULL),
(19, 19, 'Rattata', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/019.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/019.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon019.png', 'Es propenso a hincar los incisivos en cualquier cosa que se le ponga por delante. Si se ve alguno, seguramente haya cuarenta cerca.', 1, NULL),
(20, 20, 'Raticate', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/020.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/020.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon020.png', 'Gracias a las pequeñas membranas de las patas traseras, puede nadar por los ríos para capturar presas.', 1, NULL),
(21, 21, 'Spearow', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/021.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/021.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon021.png', 'A la hora de proteger su territorio, compensa su incapacidad para volar a gran altura con una increíble velocidad.', 1, 10),
(22, 22, 'Fearow', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/022.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/022.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon022.png', 'Este Pokémon ha existido desde tiempos remotos. Al menor atisbo de peligro, alza el vuelo y huye.', 1, 10),
(23, 23, 'Ekans', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/023.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/023.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon023.png', 'Puede desencajar la mandíbula libremente para engullir grandes presas, aunque esto le dificulte el movimiento por pesar demasiado.', 8, NULL),
(24, 24, 'Arbok', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/024.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/024.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon024.png', 'El dibujo que tiene en el vientre parece una cara terrorífica. Los rivales más débiles salen huyendo nada más verlo.', 8, NULL),
(25, 25, 'Pikachu', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/024.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/025.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon025.png', 'Las bolsas de sus mejillas están llenas de electricidad, que libera cuando se siente amenazado.', 5, NULL),
(26, 26, 'Raichu', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/026.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/026.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon026.png', 'Cuando se carga de electricidad, se le tensan los músculos y se vuelve más agresivo de lo normal.', 5, NULL),
(27, 27, 'Sandshrew', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/027.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/027.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon027.png', 'Excava madrigueras profundas en las que vive. Cuando lo ataca algún enemigo, se hace una bola y aguanta pacientemente sus embates.', 9, NULL),
(28, 28, 'Sandslash', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/028.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/028.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon028.png', 'Corre de un lado a otro a toda velocidad al tiempo que ataca hábilmente con las púas que tiene en la espalda y con sus afiladas garras.', 9, NULL),
(29, 29, 'Nidoran♀', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/029.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/029.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon029.png', 'Posee un olfato más fino que los Nidoran♂. Usa los bigotes para percibir la dirección del viento y buscar comida a sotavento de sus depredadores.', 8, NULL),
(30, 30, 'Nidorina', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/030.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/030.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon030.png', 'Se cree que el cuerno de la frente se le ha atrofiado para evitar herir a sus crías al alimentarlas.', 8, NULL),
(31, 31, 'Nidoqueen', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/031.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/031.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon031.png', 'Su defensa destaca sobre la capacidad ofensiva. Usa las escamas del cuerpo como una coraza para proteger a su prole de cualquier ataque.', 8, 9),
(32, 32, 'Nidoran♂', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/032.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/032.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon032.png', 'Mantiene sus grandes orejas levantadas, siempre alerta. Si advierte peligro, ataca inoculando una potente toxina con su cuerno frontal.', 8, NULL),
(33, 33, 'Nidorino', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/033.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/033.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon033.png', 'Dondequiera que va, parte rocas con su cuerno, más duro que un diamante, en busca de una Piedra Lunar.', 8, NULL),
(34, 34, 'Nidoking', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/034.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/034.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon034.png', 'Una vez que se desboca, no hay quien lo pare. Solo se calma ante Nidoqueen, su compañera de toda la vida.', 8, 9),
(35, 35, 'Clefairy', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/035.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/035.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon035.png', 'En las noches de luna llena, Clefairy de diversos lugares se reúnen para bailar bajo su luz, la cual los hace flotar.', 18, NULL),
(36, 36, 'Clefable', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/036.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/036.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon036.png', 'Este Pokémon de aspecto feérico, raramente visto por los humanos, corre a esconderse en cuanto detecta que hay alguien cerca.', 18, NULL),
(37, 37, 'Vulpix', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/037.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/037.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon037.png', 'Si lo ataca un enemigo más fuerte que él, finge estar herido para confundirlo y huir en cuanto baja la guardia.', 2, NULL),
(38, 38, 'Ninetales', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/038.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/038.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon038.png', 'Cuentan algunas leyendas que cada una de sus nueve colas posee su propio y único poder sobrenatural.', 2, NULL),
(39, 39, 'Jigglypuff', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/039.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/039.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon039.png', 'Cuando le tiemblan sus redondos y adorables ojos, entona una melodía agradable y misteriosa con la que duerme a sus enemigos.', 1, 18),
(40, 40, 'Wigglytuff', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/040.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/040.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon040.png', 'Tiene un pelaje muy fino. Se recomienda no enfadarlo, o se inflará y golpeará con todo su cuerpo.', 1, 18),
(41, 41, 'Zubat', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/041.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/041.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon041.png', 'Emite ondas ultrasónicas por la boca para escrutar el entorno, lo que le permite volar con pericia por cuevas angostas.', 8, 10),
(42, 42, 'Golbat', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/042.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/042.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon042.png', 'Le encanta chuparles la sangre a los seres vivos. En ocasiones comparte la preciada colecta con otros congéneres hambrientos.', 8, 10),
(43, 43, 'Oddish', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/043.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/043.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon043.png', 'Su nombre científico es Oddium viandantis. Se dice que, cuando cae la noche, puede llegar a desplazarse hasta 300 m con sus dos raíces.', 4, 8),
(44, 44, 'Gloom', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/044.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/044.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon044.png', 'El fluido que le cae lentamente de la boca no es saliva, sino una especie de néctar que utiliza para atraer a sus presas.', 4, 8),
(45, 45, 'Vileplume', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/045.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/045.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon045.png', 'El capullo florece de golpe con un chasquido, tras lo cual comienza a desprender un polen alergénico y venenoso.', 4, 8),
(46, 46, 'Paras', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/046.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/046.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon046.png', 'Escarba en el suelo para extraer nutrientes de las raíces de los árboles, que las setas del lomo absorben después casi por completo.', 12, 4),
(47, 47, 'Parasect', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/047.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/047.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon047.png', 'Tras largo tiempo absorbiendo la energía del huésped, la seta parásita del lomo es la que parece controlar la voluntad de este Pokémon.', 12, 4),
(48, 48, 'Venonat', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/048.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/048.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon048.png', 'Rezuma veneno por todo su cuerpo. De noche, atrapa y come pequeños Pokémon insecto atraídos por la luz.', 12, 8),
(49, 49, 'Venomoth', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/049.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/049.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon049.png', 'Tiene las alas cubiertas de escamas. Cada vez que las bate, esparce un polvillo sumamente venenoso.', 12, 8),
(50, 50, 'Diglett', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/050.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/050.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon050.png', 'Vive 1 m por debajo del suelo, donde se alimenta de raíces. A veces también aparece en la superficie.', 9, NULL),
(51, 51, 'Dugtrio', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/051.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/051.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon051.png', 'Sus tres cabezas suben y bajan para remover la tierra cercana y facilitar así la excavación.', 9, NULL),
(52, 52, 'Meowth', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/052.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/052.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon052.png', 'Le encanta todo lo que brilla. Adora en especial las monedas, que recoge y guarda en un lugar secreto.', 1, NULL),
(53, 53, 'Persian', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/053.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/053.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon053.png', 'Aunque es muy admirado por el pelaje, es difícil de entrenar como mascota porque enseguida suelta arañazos.', 1, NULL),
(54, 54, 'Psyduck', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/054.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/054.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon054.png', 'Padece continuamente dolores de cabeza. Cuando son muy fuertes, empieza a usar misteriosos poderes.', 3, NULL),
(55, 55, 'Golduck', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/055.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/055.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon055.png', 'Cuando nada a toda velocidad usando sus largas extremidades palmeadas, su frente comienza a brillar.', 3, NULL),
(56, 56, 'Mankey', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/056.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/056.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon056.png', 'Vive en grupos en las copas de los árboles. Si pierde de vista a su manada, se siente solo y se enfada.', 7, NULL),
(57, 57, 'Primeape', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/057.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/057.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon057.png', 'Se pone furioso si nota que alguien lo está mirando. Persigue a cualquiera que establezca contacto visual con él.', 7, NULL),
(58, 58, 'Growlithe', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/058.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/058.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon058.png', 'De naturaleza valiente y honrada, se enfrenta sin miedo a enemigos más grandes y fuertes.', 2, NULL),
(59, 59, 'Arcanine', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/059.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/059.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon059.png', 'Cuenta un antiguo pergamino que la gente se quedaba fascinada al verlo correr por las praderas.', 2, NULL),
(60, 60, 'Poliwag', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/060.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/060.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon060.png', 'La espiral que tiene en el vientre son sus vísceras, visibles a través de la piel. Cuando acaba de comer, se ven de manera aún más nítida.', 3, NULL),
(61, 61, 'Poliwhirl', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/061.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/061.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon061.png', 'Aunque puede vivir en tierra firme gracias a que sus extremidades inferiores se han desarrollado, por algún motivo prefiere el medio acuático.', 3, NULL),
(62, 62, 'Poliwrath', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/062.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/062.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon062.png', 'Aunque puede nadar de forma hábil y enérgica utilizando todos sus músculos, por algún motivo prefiere vivir en tierra firme.', 3, 7),
(63, 63, 'Abra', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/063.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/063.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon063.png', 'Es capaz de usar sus poderes psíquicos aun estando dormido. Al parecer, el contenido del sueño influye en sus facultades.', 11, NULL),
(64, 64, 'Kadabra', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/064.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/064.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon064.png', 'Duerme suspendido en el aire gracias a sus poderes psíquicos. La cola, de una flexibilidad extraordinaria, hace las veces de almohada.', 11, NULL),
(65, 65, 'Alakazam', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/065.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/065.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon065.png', 'Posee una capacidad intelectual fuera de lo común que le permite recordar todo lo sucedido desde el instante de su nacimiento.', 11, NULL),
(66, 66, 'Machop', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/066.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/066.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon066.png', 'Es una masa de músculos y, pese a su pequeño tamaño, tiene fuerza de sobra para levantar en brazos a 100 personas.', 7, NULL),
(67, 67, 'Machoke', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/067.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/067.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon067.png', 'Su musculoso cuerpo es tan fuerte que usa un cinto antifuerza para controlar sus movimientos.', 7, NULL),
(68, 68, 'Machamp', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/068.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/068.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon068.png', 'Usa sus cuatro brazos para sujetar las extremidades del adversario e inmovilizarlo y, después, lo arroja hasta donde alcanza la vista.', 7, NULL),
(69, 69, 'Bellsprout', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/069.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/069.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon069.png', 'Si detecta algún movimiento a su alrededor, sea cuando sea, reacciona enseguida extendiendo sus finas lianas en esa dirección.', 4, 8),
(70, 70, 'Weepinbell', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/070.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/070.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon070.png', 'Rezuma un fluido neutralizante que impide que su propio ácido lo disuelva.', 4, 8),
(71, 71, 'Victreebel', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/071.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/071.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon071.png', 'Sus jugos gástricos son capaces de disolver completamente cualquier cosa que ingiera, por más dura que sea.', 4, 8),
(72, 72, 'Tentacool', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/072.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/072.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon072.png', 'Cuando baja la marea, se pueden encontrar Tentacool deshidratados junto a la orilla.', 3, 8),
(73, 73, 'Tentacruel', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/073.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/073.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon073.png', 'En muy raras ocasiones, cuando se produce una aparición masiva de Tentacruel, los Pokémon pez de los alrededores se esfuman sin dejar rastro.', 3, 8),
(74, 74, 'Geodude', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/074.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/074.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon074.png', 'En reposo parece una roca normal, pero responde agitando los puños con agresividad si se pisa por error.', 13, 9),
(75, 75, 'Graveler', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/075.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/075.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon075.png', 'Camina muy lentamente, por lo que se desplaza rodando, sin importarle lo que pueda haber en su camino.', 13, 9),
(76, 76, 'Golem', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/076.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/076.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon076.png', 'Está cubierto por un duro caparazón formado por losas de piedra. Lo muda una vez al año para aumentar de tamaño.', 13, 9),
(77, 77, 'Ponyta', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/077.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/077.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon077.png', 'Apenas una hora después de nacer, ya le crecen la cola y la crin de fuego, que le confieren un aspecto magnífico.', 2, NULL),
(78, 78, 'Rapidash', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/078.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/078.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon078.png', 'Su crin de fuego centellea cuando galopa como una flecha a velocidades que llegan a alcanzar los 240 km/h.', 2, NULL),
(79, 79, 'Slowpoke', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/079.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/079.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon079.png', 'Increíblemente lento y torpe. Tarda cinco segundos en sentir dolor si lo atacan.', 3, 11),
(80, 80, 'Slowbro', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/080.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/080.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon080.png', 'Según parece, cuando Slowpoke fue a pescar al mar, un Shellder le mordió la cola y así evolucionó a Slowbro.', 3, 11),
(81, 81, 'Magnemite', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/081.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/081.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon081.png', 'Las unidades laterales crean ondas electromagnéticas que contrarrestan la gravedad y le permiten flotar.', 5, 16),
(82, 82, 'Magneton', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/082.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/082.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon082.png', 'Tres Magnemite se enlazan mediante una intensa fuerza magnética. Provoca un fuerte pitido en los oídos a quien se le acerque.', 5, 16),
(83, 83, 'Farfetch\'d', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/083.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/083.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon083.png', 'No puede vivir sin el puerro que lleva, así que lo protege de sus atacantes con todas sus fuerzas.', 1, 10),
(84, 84, 'Doduo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/084.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/084.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon084.png', 'Sus cabezas gemelas comparten la misma información genética y combaten juntas al unísono.', 1, 10),
(85, 85, 'Dodrio', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/085.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/085.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon085.png', 'Ahora cuenta con tres corazones y tres pares de pulmones. No alcanza las velocidades de Doduo, pero es capaz de correr durante más tiempo.', 1, 10),
(86, 86, 'Seel', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/086.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/086.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon086.png', 'La protuberancia que tiene en la cabeza es tan dura que la usa para abrirse paso a cabezazos por el hielo de los icebergs.', 3, NULL),
(87, 87, 'Dewgong', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/087.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/087.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon087.png', 'Duerme en aguas poco profundas durante el día y, por la noche, cuando baja la temperatura del agua, nada en busca de comida.', 3, 6),
(88, 88, 'Grimer', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/088.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/088.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon088.png', 'Formados a partir de lodo, los Grimer se juntan en lugares sucios para aumentar el número de gérmenes de su cuerpo.', 8, NULL),
(89, 89, 'Muk', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/089.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/089.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon089.png', 'Está cubierto por un repugnante lodo. Es tan tóxico que hasta su rastro es venenoso.', 8, NULL),
(90, 90, 'Shellder', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/090.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/090.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon090.png', 'Está metido en una concha más dura que el diamante, pero tiene un cuerpo muy blando.', 3, NULL),
(91, 91, 'Cloyster', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/091.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/091.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon091.png', 'A los Cloyster que viven en las fuertes corrientes marinas les crecen largas y afiladas púas en la concha.', 3, 6),
(92, 92, 'Gastly', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/092.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/092.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon092.png', 'Su estrategia consiste en envolver al rival con su cuerpo gaseoso y envenenarlo a través de la piel.', 14, 8),
(93, 93, 'Haunter', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/093.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/093.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon093.png', 'Le gusta acechar en la oscuridad y tocarles el hombro a sus víctimas con su mano gaseosa. Estas se quedan temblando para siempre.', 14, 8),
(94, 94, 'Gengar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/094.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/094.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon094.png', 'Se esconde entre las sombras. Dicen que la temperatura baja 5 ºC en donde sea que aceche.', 14, 8),
(95, 95, 'Onix', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/095.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/095.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon095.png', 'Al abrirse paso bajo tierra, va absorbiendo todo lo que encuentra. Eso hace que su cuerpo sea así de sólido.', 13, 9),
(96, 96, 'Drowzee', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/096.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/096.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon096.png', 'Recuerda todos los sueños que engulle. Raramente come sueños de adultos porque los de los niños están más ricos.', 11, NULL),
(97, 97, 'Hypno', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/097.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/097.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon097.png', 'Cuando mira al enemigo, usa diversos poderes psíquicos como la hipnosis.', 11, NULL),
(98, 98, 'Krabby', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/098.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/098.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon098.png', 'Es fácil encontrarlo cerca del mar. Las largas pinzas que tiene vuelven a crecer si se las quitan de su sitio.', 3, NULL),
(99, 99, 'Kingler', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/099.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/099.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon099.png', 'La pinza mayor posee una fuerza devastadora, pero es tan pesada que le cuesta usarla con precisión.', 3, NULL),
(100, 100, 'Voltorb', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/100.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/100.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon100.png', 'Se mueve rodando. Si el terreno es irregular, una chispa provocada por algún bache lo hará explotar.', 5, NULL),
(101, 101, 'Electrode', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/101.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/101.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon101.png', 'Cuanta más energía almacena, mayor velocidad alcanza, aunque aumenta también el riesgo de que explote.', 5, NULL),
(102, 102, 'Exeggcute', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/102.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/102.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon102.png', 'Si alguien confunde a una de sus cabezas con un huevo y la toca, se reagrupa con las otras para atacar todas juntas.', 4, 11),
(103, 103, 'Exeggutor', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/103.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/103.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon103.png', 'Se lo llama la Selva Andante. Cada fruto tiene una cara distinta y voluntad propia.', 4, 11),
(104, 104, 'Cubone', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/104.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/104.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon104.png', 'Cuando llora al acordarse de su madre fallecida, su llanto resuena en el cráneo que lleva en la cabeza.', 9, NULL),
(105, 105, 'Marowak', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/105.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/105.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon105.png', 'Ha evolucionado tras fortalecerse y superar su pena. Ahora lucha con arrojo blandiendo su hueso a modo de arma.', 9, NULL),
(106, 106, 'Hitmonlee', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/106.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/106.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon106.png', 'Endurece los músculos de las plantas de los pies en el momento en el que impactan contra su rival para potenciar al máximo sus patadas.', 7, NULL),
(107, 107, 'Hitmonchan', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/107.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/107.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon107.png', 'Acorrala a sus enemigos con combinaciones de puñetazos con ambos puños, para luego darles el golpe de gracia con un directo a 500 km/h.', 7, NULL),
(108, 108, 'Lickitung', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/108.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/108.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon108.png', 'Si sus lametones no se tratan a tiempo, su saliva pegajosa y urticante puede provocar picores persistentes.', 1, NULL),
(109, 109, 'Koffing', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/109.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/109.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon109.png', 'Su cuerpo, con forma de globo y poco grosor, encierra gases muy tóxicos que pueden ocasionar explosiones espontáneas de gran magnitud.', 8, NULL),
(110, 110, 'Weezing', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/110.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/110.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon110.png', 'Diluir sus venenosos gases internos lo máximo posible permite fabricar perfumes de alta gama.', 8, NULL);
INSERT INTO `pokemon` (`id`, `Numpokedex`, `name`, `pokedexurl`, `pokemonurl`, `miniurl`, `description`, `typeOneId`, `typeTwoId`) VALUES
(111, 111, 'Rhyhorn', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/111.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/111.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon111.png', 'Puede controlar un territorio de hasta 10 km de radio, pero, cuando se pone a correr, parece olvidársele dónde empieza y dónde acaba.', 9, 13),
(112, 112, 'Rhydon', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/112.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/112.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon112.png', 'Hace chocar el cuerno con el de sus congéneres para afilarlo. Es capaz de horadar diamantes en bruto con él.', 9, 13),
(113, 113, 'Chansey', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/113.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/113.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon113.png', 'Un generoso Pokémon que pone huevos muy nutritivos y se los da a personas o Pokémon heridos.', 1, NULL),
(114, 114, 'Tangela', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/114.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/114.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon114.png', 'Sus lianas no dejan de crecer aunque se le desprendan. Aún se desconoce qué aspecto tiene sin ellas.', 4, NULL),
(115, 115, 'Kangaskhan', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/115.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/115.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon115.png', 'Aunque lleve una cría en el marsupio, su juego de pies no pierde ligereza. Abruma al rival con ráfagas de ágiles puñetazos.', 1, NULL),
(116, 116, 'Horsea', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/116.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/116.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon116.png', 'Si es atacado por un enemigo, por muy grande que sea, nada veloz a un lugar seguro gracias a su fornida aleta dorsal.', 3, NULL),
(117, 117, 'Seadra', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/117.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/117.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon117.png', 'En esta especie, es el macho quien se ocupa de cuidar a las crías, a las que defiende con sus púas venenosas de cualquiera que se les acerque.', 3, NULL),
(118, 118, 'Goldeen', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/118.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/118.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon118.png', 'Sus aletas pectorales, caudal y dorsal ondean gráciles en el agua. Por eso se le llama el Bailarín Acuático.', 3, NULL),
(119, 119, 'Seaking', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/119.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/119.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon119.png', 'En otoño gana algo de peso para atraer a posibles parejas y se cubre de llamativos colores.', 3, NULL),
(120, 120, 'Staryu', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/120.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/120.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon120.png', 'A finales de verano, se pueden ver grupos de Staryu en la orilla de la playa sincronizando el brillo de sus núcleos a ritmo regular.', 3, NULL),
(121, 121, 'Starmie', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/121.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/121.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon121.png', 'El núcleo rojo que tiene en el centro del cuerpo emite extrañas señales de radio hacia el cielo nocturno.', 3, 11),
(122, 122, 'Mr. Mime', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/122.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/122.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon122.png', 'Un experto de la pantomima capaz de crear paredes invisibles pero sólidas solo con sus gestos.', 11, 18),
(123, 123, 'Scyther', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/123.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/123.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon123.png', 'Avanza por la hierba con sus afiladas guadañas, más rápido de lo que el ojo humano puede percibir.', 12, 10),
(124, 124, 'Jynx', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/124.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/124.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon124.png', 'En cierta parte de Galar se conocía a Jynx como la Reina del Hielo y se reverenciaba con cierto temor.', 6, 11),
(125, 125, 'Electabuzz', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/125.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/125.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon125.png', 'Su cuerpo descarga electricidad constantemente, por lo que eriza el cabello a cualquiera que se le acerque.', 5, NULL),
(126, 126, 'Magmar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/126.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/126.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon126.png', 'Fue descubierto junto al cráter de un volcán. Escupe llamaradas y su temperatura corporal alcanza los 1200 ºC.', 2, NULL),
(127, 127, 'Pinsir', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/127.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/127.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon127.png', 'Los Pinsir se juzgan entre ellos por la robustez de la cornamenta. Cuanto más imponente sea, más agradará a sus congéneres del sexo opuesto.', 12, NULL),
(128, 128, 'Tauros', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/128.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/128.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon128.png', 'Cuando ve a un enemigo, se fustiga con las colas y carga ferozmente contra él.', 1, NULL),
(129, 129, 'Magikarp', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/129.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/129.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon129.png', 'Un Pokémon desvalido y patético. A veces es capaz de saltar alto, pero rara vez más de 2 m.', 3, NULL),
(130, 130, 'Gyarados', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/130.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/130.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon130.png', 'Cuando aparece, monta en cólera. No deja de estar furioso hasta que lo destruye todo.', 3, 10),
(131, 131, 'Lapras', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/131.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/131.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon131.png', 'Surca los mares transportando gente sobre el lomo. Al parecer, a veces entona un melodioso canto si está de buen humor.', 3, 6),
(132, 132, 'Ditto', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/132.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/132.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon132.png', 'Su habilidad para transformarse es perfecta, pero, si se le hace reír, perderá la fuerza y no podrá mantenerse transformado.', 1, NULL),
(133, 133, 'Eevee', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/133.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/133.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon133.png', 'Gracias a su irregular estructura genética, este Pokémon tan especial puede adoptar evoluciones muy variadas.', 1, NULL),
(134, 134, 'Vaporeon', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/134.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/134.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon134.png', 'Vive cerca del agua. Su cola termina en una aleta parecida a la de un pez, por lo que hay gente que lo confunde con una sirena.', 3, NULL),
(135, 135, 'Jolteon', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/135.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/135.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon135.png', 'Concentra la débil actividad eléctrica de sus células para lanzar dañinas descargas.', 5, NULL),
(136, 136, 'Flareon', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/136.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/136.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon136.png', 'Calienta el aire que inhala en su saca de fuego y lo expulsa a 1700 ºC.', 2, NULL),
(137, 137, 'Porygon', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/137.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/137.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon137.png', 'Un Pokémon artificial que no respira, por lo que se le supone la capacidad de desenvolverse sin problemas en cualquier entorno.', 1, NULL),
(138, 138, 'Omanyte', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/138.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/138.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon138.png', 'Varios ejemplares han escapado o bien han sido liberados tras su restauración, lo que comienza a suscitar una serie de problemas.', 13, 3),
(139, 139, 'Omastar', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/139.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/139.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon139.png', 'Se cree que se extinguió porque el excesivo tamaño y peso de su concha le impedían moverse con rapidez para capturar presas.', 13, 3),
(140, 140, 'Kabuto', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/140.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/140.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon140.png', 'Un Pokémon casi extinto. Cada tres días, muda el caparazón, que se va endureciendo de forma progresiva.', 13, 3),
(141, 141, 'Kabutops', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/141.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/141.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon141.png', 'Despedaza a las presas que atrapa para sorber sus fluidos y deja los restos para que otros Pokémon den buena cuenta de ellos.', 13, 3),
(142, 142, 'Aerodactyl', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/142.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/142.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon142.png', 'Un feroz Pokémon de la época prehistórica al que no bastan todos los avances tecnológicos actuales para regenerar a la perfección.', 13, 10),
(143, 143, 'Snorlax', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/143.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/143.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon143.png', 'Este Pokémon es un glotón que lo único que hace, aparte de comer, es dormir. Puede ingerir hasta 400 kg de comida en un solo día.', 1, NULL),
(144, 144, 'Articuno', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/144.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/144.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon144.png', 'Una de las aves legendarias. Es capaz de generar ventiscas congelando la humedad del aire.', 6, 10),
(145, 145, 'Zapdos', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/145.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/145.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon145.png', 'Una de las aves legendarias. Según dicen, vive en los nubarrones y controla los rayos a su antojo.', 5, 10),
(146, 146, 'Moltres', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/146.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/146.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon146.png', 'Una de las aves legendarias. Dicen que su presencia anuncia la llegada de la primavera.', 2, 10),
(147, 147, 'Dratini', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/147.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/147.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon147.png', 'Durante la etapa de crecimiento, muda muchas veces de piel y se protege mediante una cascada.', 15, 3),
(148, 148, 'Dragonair', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/148.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/148.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon148.png', 'Dicen que, cuando su cuerpo desprende un aura, el tiempo empieza a cambiar inmediatamente.', 15, 3),
(149, 149, 'Dragonite', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/149.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/149.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon149.png', 'Se dice que vive en algún lugar del mar. Guía a la costa a las tripulaciones de los barcos que naufragaron.', 15, 10),
(150, 150, 'Mewtwo', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/150.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/150.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon150.png', 'Su ADN es casi el mismo que el de Mew. Sin embargo, su tamaño y carácter son muy diferentes.', 11, NULL),
(151, 151, 'Mew', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/pokedex/151.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/151.png', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/pokemon/minis/icon151.png', 'Si se observa a través de un microscopio, puede distinguirse cuán corto, fino y delicado es el pelaje de este Pokémon.', 11, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon_encounters`
--

CREATE TABLE `pokemon_encounters` (
  `id` int NOT NULL,
  `max_level` int NOT NULL,
  `min_level` int NOT NULL,
  `mapId` int DEFAULT NULL,
  `pokemonId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pokemon_encounters`
--

INSERT INTO `pokemon_encounters` (`id`, `max_level`, `min_level`, `mapId`, `pokemonId`) VALUES
(1, 5, 3, 1, 10),
(2, 5, 3, 1, 63),
(3, 5, 3, 1, 69),
(4, 5, 3, 1, 23),
(5, 5, 3, 1, 74),
(6, 5, 3, 1, 133);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon_type`
--

CREATE TABLE `pokemon_type` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pokemon_type`
--

INSERT INTO `pokemon_type` (`id`, `name`, `color`) VALUES
(1, 'Normal', '#A8A878'),
(2, 'Fuego', '#F08030'),
(3, 'Agua', '#6890F0'),
(4, 'Planta', '#78C850'),
(5, 'Eléctrico', '#F8D030'),
(6, 'Hielo', '#98D8D8'),
(7, 'Lucha', '#C03028'),
(8, 'Veneno', '#A040A0'),
(9, 'Tierra', '#E0C068'),
(10, 'Volador', '#A890F0'),
(11, 'Psíquico', '#F85888'),
(12, 'Bicho', '#A8B820'),
(13, 'Roca', '#B8A038'),
(14, 'Fantasma', '#705898'),
(15, 'Dragón', '#7038F8'),
(16, 'Acero', '#B8B8D0'),
(17, 'Siniestro', '#705848'),
(18, 'Hada', '#EE99AC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_images`
--

CREATE TABLE `profile_images` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` enum('masculino','femenino') NOT NULL DEFAULT 'masculino',
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `profile_images`
--

INSERT INTO `profile_images` (`id`, `name`, `gender`, `url`) VALUES
(1, 'Basic pixel man', 'masculino', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/players/mapPlayer000.png'),
(2, 'Basic pixel woman', 'femenino', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/players/mapPlayerPOKEMONTRAINER_Leaf.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `skin_player`
--

CREATE TABLE `skin_player` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` enum('masculino','femenino') NOT NULL DEFAULT 'masculino',
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `skin_player`
--

INSERT INTO `skin_player` (`id`, `name`, `gender`, `url`) VALUES
(1, 'Standard blond man', 'masculino', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/skins/POKEMONTRAINER_RojoArio.png'),
(2, 'Standard blond woman', 'femenino', 'https://ecprlucoaqxnxvemksej.supabase.co/storage/v1/object/public/game-assets/skins/POKEMONTRAINER_HojaAria.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `my_pokemons`
--
ALTER TABLE `my_pokemons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7ff01e97ff7eb0d6e1fa371284b` (`pokemonId`),
  ADD KEY `FK_ec999859fd7d7c1cb877059a61a` (`playerId`);

--
-- Indices de la tabla `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_0ba988c87a279b5067d273c592` (`username`),
  ADD KEY `FK_1fbdee08ab779a1d05128dbec87` (`profileId`),
  ADD KEY `FK_f93fb777b24e75bfe0b4c09e577` (`skinPlayerId`),
  ADD KEY `FK_ef066aa59928a9310ca9bf3f364` (`mapPlayerId`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0c063a3dbae55d425621101e1e1` (`typeOneId`),
  ADD KEY `FK_43565849b535cc3edb3411da7ea` (`typeTwoId`);

--
-- Indices de la tabla `pokemon_encounters`
--
ALTER TABLE `pokemon_encounters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_483bd122f8c6217f7efcba09494` (`mapId`),
  ADD KEY `FK_d0a9d64cf7c06e76ec7af6a1942` (`pokemonId`);

--
-- Indices de la tabla `pokemon_type`
--
ALTER TABLE `pokemon_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profile_images`
--
ALTER TABLE `profile_images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `skin_player`
--
ALTER TABLE `skin_player`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `map`
--
ALTER TABLE `map`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `my_pokemons`
--
ALTER TABLE `my_pokemons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `players`
--
ALTER TABLE `players`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de la tabla `pokemon_encounters`
--
ALTER TABLE `pokemon_encounters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pokemon_type`
--
ALTER TABLE `pokemon_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `profile_images`
--
ALTER TABLE `profile_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `skin_player`
--
ALTER TABLE `skin_player`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `my_pokemons`
--
ALTER TABLE `my_pokemons`
  ADD CONSTRAINT `FK_7ff01e97ff7eb0d6e1fa371284b` FOREIGN KEY (`pokemonId`) REFERENCES `pokemon` (`id`),
  ADD CONSTRAINT `FK_ec999859fd7d7c1cb877059a61a` FOREIGN KEY (`playerId`) REFERENCES `players` (`id`);

--
-- Filtros para la tabla `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `FK_1fbdee08ab779a1d05128dbec87` FOREIGN KEY (`profileId`) REFERENCES `profile_images` (`id`),
  ADD CONSTRAINT `FK_ef066aa59928a9310ca9bf3f364` FOREIGN KEY (`mapPlayerId`) REFERENCES `map` (`id`),
  ADD CONSTRAINT `FK_f93fb777b24e75bfe0b4c09e577` FOREIGN KEY (`skinPlayerId`) REFERENCES `skin_player` (`id`);

--
-- Filtros para la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD CONSTRAINT `FK_0c063a3dbae55d425621101e1e1` FOREIGN KEY (`typeOneId`) REFERENCES `pokemon_type` (`id`),
  ADD CONSTRAINT `FK_43565849b535cc3edb3411da7ea` FOREIGN KEY (`typeTwoId`) REFERENCES `pokemon_type` (`id`);

--
-- Filtros para la tabla `pokemon_encounters`
--
ALTER TABLE `pokemon_encounters`
  ADD CONSTRAINT `FK_483bd122f8c6217f7efcba09494` FOREIGN KEY (`mapId`) REFERENCES `map` (`id`),
  ADD CONSTRAINT `FK_d0a9d64cf7c06e76ec7af6a1942` FOREIGN KEY (`pokemonId`) REFERENCES `pokemon` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
