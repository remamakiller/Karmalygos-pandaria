/*Apertura_lvl85   Cerrando Todo Pandaria */


/*Cerrando BG y Arenas de Pandaria*/
DELETE FROM `battleground_template` WHERE `id` = 757;
DELETE FROM `battleground_template` WHERE `id` = 719;
DELETE FROM `battleground_template` WHERE `id` = 754;
DELETE FROM `battleground_template` WHERE `id` = 708;
DELETE FROM `battleground_template` WHERE `id` = 699;


-- disable pandaria dungeons
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1011' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Siege of Niuzao Temple - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1011' AND `difficulty` = 'DUNGEON_HEROIC'; -- Siege of Niuzao Temple - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1011' AND `difficulty` = 'DUNGEON_NORMAL'; -- Siege of Niuzao Temple - N : 88

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '961' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Stormstout Brewery - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '961' AND `difficulty` = 'DUNGEON_HEROIC'; -- Stormstout Brewery - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '961' AND `difficulty` = 'DUNGEON_NORMAL'; -- Stormstout Brewery - N : 85

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1001' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Scarlet Halls - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1001' AND `difficulty` = 'DUNGEON_HEROIC'; -- Scarlet Halls - N : 90

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '959' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Shado Pan Monastery - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '959' AND `difficulty` = 'DUNGEON_HEROIC'; -- Shado Pan Monastery - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '959' AND `difficulty` = 'DUNGEON_NORMAL'; -- Shado Pan Monastery - N : 87

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1004' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Scarlet Monastery - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1004' AND `difficulty` = 'DUNGEON_HEROIC'; -- Scarlet Monastery - N : 90

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '994' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Mogushan Palace - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '994' AND `difficulty` = 'DUNGEON_HEROIC'; -- Mogushan Palace - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '994' AND `difficulty` = 'DUNGEON_NORMAL'; -- Mogushan Palace - N : 87

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '962' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Gate of the Setting Sun  - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '962' AND `difficulty` = 'DUNGEON_HEROIC'; -- Gate of the Setting Sun  - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '962' AND `difficulty` = 'DUNGEON_NORMAL'; -- Gate of the Setting Sun  - N : 88

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1007' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Scholomance  - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1007' AND `difficulty` = 'DUNGEON_HEROIC'; -- Scholomance  - N : 90

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '960' AND `difficulty` = 'DUNGEON_CHALLENGE';  -- Temple of the Jade Serpent  - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '960' AND `difficulty` = 'DUNGEON_HEROIC'; -- Temple of the Jade Serpent  - N : 90
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '960' AND `difficulty` = 'DUNGEON_NORMAL'; -- Temple of the Jade Serpent  - N : 85

-- disable pandaria raids
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1136' AND `difficulty` = 'RAID_10MAN_NORMAL'; -- Siege of Orgrimmar
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1136' AND `difficulty` = 'RAID_10MAN_HEROIC'; -- Siege of Orgrimmar
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1136' AND `difficulty` = 'RAID_25MAN_NORMAL'; -- Siege of Orgrimmar 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1136' AND `difficulty` = 'RAID_25MAN_HEROIC'; -- Siege of Orgrimmar
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1136' AND `difficulty` = 'RAID_25MAN_LFR'; -- Siege of Orgrimmar
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1136' AND `difficulty` = 'RAID_1025MAN_FLEX'; -- Siege of Orgrimmar

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1009' AND `difficulty` = 'RAID_10MAN_NORMAL'; -- Heart of Fear 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1009' AND `difficulty` = 'RAID_10MAN_HEROIC'; -- Heart of Fear 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1009' AND `difficulty` = 'RAID_25MAN_NORMAL'; --  Heart of Fear 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1009' AND `difficulty` = 'RAID_25MAN_HEROIC'; -- Heart of Fear 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1009' AND `difficulty` = 'RAID_25MAN_LFR'; -- Heart of Fear 

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1008' AND `difficulty` = 'RAID_10MAN_NORMAL'; -- Mogu'shan Vaults 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1008' AND `difficulty` = 'RAID_10MAN_HEROIC'; -- Mogu'shan Vaults 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1008' AND `difficulty` = 'RAID_25MAN_NORMAL'; -- Mogu'shan Vaults 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1008' AND `difficulty` = 'RAID_25MAN_HEROIC'; -- Mogu'shan Vaults 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1008' AND `difficulty` = 'RAID_25MAN_LFR'; -- Mogu'shan Vaults 

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1098' AND `difficulty` = 'RAID_10MAN_NORMAL'; -- Throne of Thunder 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1098' AND `difficulty` = 'RAID_10MAN_HEROIC'; -- Throne of Thunder
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1098' AND `difficulty` = 'RAID_25MAN_NORMAL'; -- Throne of Thunder
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1098' AND `difficulty` = 'RAID_25MAN_HEROIC'; -- Throne of Thunder
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1098' AND `difficulty` = 'RAID_25MAN_LFR'; -- Throne of Thunder

UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '996' AND `difficulty` = 'RAID_10MAN_NORMAL'; -- Terrace of Endless Spring 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '996' AND `difficulty` = 'RAID_10MAN_HEROIC'; -- Terrace of Endless Spring
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '996' AND `difficulty` = 'RAID_25MAN_NORMAL'; -- Terrace of Endless Spring
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '996' AND `difficulty` = 'RAID_25MAN_HEROIC'; -- Terrace of Endless Spring
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '996' AND `difficulty` = 'RAID_25MAN_LFR'; -- Terrace of Endless Spring

-- disable pandaria scenarios
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1005' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - A Brewing Storm Entrance 
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1104' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - A Little Patience Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1031' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Arena of Annihilation Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1050' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Assault on Zan'vess Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1099' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Battle on the High Seas Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1099' AND `difficulty` = 'SCENARIO_HEROIC'; -- Level:90 - Battle on the High Seas Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1130' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Blood in the Snow Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1130' AND `difficulty` = 'SCENARIO_HEROIC'; -- Level:90 - Blood in the Snow Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1051' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Brewmoon Festival Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1161' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Celestial Tournament Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1030' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Crypt of Forgotten Kings Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1030' AND `difficulty` = 'SCENARIO_HEROIC'; -- Level:90 - Crypt of Forgotten Kings Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1095' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Dagger in the Dark Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1144' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Dark Heart of Pandaria Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1144' AND `difficulty` = 'SCENARIO_HEROIC'; -- Level:90 - Dark Heart of Pandaria Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1102' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Domination Point Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1157' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Finding the Secret Ingredient Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1024' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Greenstone Village Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1126' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Isle of Thunder Scenarios
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1103' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Lion's Landing Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1157' AND `difficulty` = 'SCENARIO_HEROIC'; -- Level:90 - Noodle Time Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1148' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Proving Grounds Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1112' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Pursuing the Black Harvest Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1035' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Temple of Kotmogu Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1131' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - The Secrets of Ragefire Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1131' AND `difficulty` = 'SCENARIO_HEROIC'; -- Level:90 - The Secrets of Ragefire Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1000' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:85 - Theramore's Fall Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '999' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:85 - Theramore's Fall Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1135' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Troves of the Thunder King Entrance
UPDATE `access_requirement` SET `level_min` = '99' WHERE `mapId` = '1048' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Unga Ingoo Entrance

-- desactivando laz mazmorras de scholomance y cámaras escarlata en modo normal y heroico
DELETE FROM `disables` WHERE `sourceType` = '2' AND `entry` = '1007'; 
DELETE FROM `disables` WHERE `sourceType` = '2' AND `entry` = '1001'; 
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) 
VALUES 
('2', '1007', '3', '0', '0', 'Disabled Scholomance'),
('2', '1001', '3', '0', '0', 'Disabled Scarlet Halls');

-- agregando requisito de nivel de equipo para apuntar al buscdor de bandas, ahora necesitan nivel 600
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '527'; -- old requiredItemLevel: 460 , guardianes de mogushan
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '528'; -- old requiredItemLevel: 460 , la camara de los misterios
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '529'; -- old requiredItemLevel: 470 , un enfoque aterrador
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '530'; -- old requiredItemLevel: 470 , pesadilla de shekzeer
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '526'; -- old requiredItemLevel: 470 , veranda de la primavera eterna
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '610'; -- old requiredItemLevel: 480 , la carga de la brigaba zandalari
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '611'; -- old requiredItemLevel: 480 , avismo de la desidia
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '612'; -- old requiredItemLevel: 480 , camaras del modelado de carne
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '613'; -- old requiredItemLevel: 480 , pinaculos de la tormenta
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '716'; -- old requiredItemLevel: 496 , valle de la pena eterna
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '717'; -- old requiredItemLevel: 496 , las puertas de la venganza
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '724'; -- old requiredItemLevel: 496 , El bunker
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '725'; -- old requiredItemLevel: 496 , El ocaso
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '464'; -- old requiredItemLevel: 358 , Temple of the Jade Serpent
UPDATE `lfg_dungeon_template` SET `requiredItemLevel` = '600' WHERE `dungeonId` = '465'; -- old requiredItemLevel: 358 , Stormstout Brewery

-- eliminando botín normal de los jefes de mundo Sha de la Ira y Galeon
DELETE FROM `creature_loot_template` WHERE `entry` = '62346'; -- Galeón
DELETE FROM `creature_loot_template` WHERE `entry` = '60491'; -- sha de la ira

-- Se modifica el tiempo de estos jefes de mundo a 4 horas

-- sha de la ira
UPDATE `creature` SET `spawntimesecs` = '14400' WHERE `guid` = '564256';
UPDATE `creature` SET `spawntimesecs` = '14400' WHERE `guid` = '564257';
UPDATE `creature` SET `spawntimesecs` = '14400' WHERE `guid` = '564258';
UPDATE `creature` SET `spawntimesecs` = '14400' WHERE `guid` = '564259';
UPDATE `creatuRE` SET `spawntimesecs` = '14400' WHERE `guid` = '564260';

-- galeon
UPDATE `creature` SET `spawntimesecs` = '14400' WHERE `guid` = '516616'; 


-- Creature Galeon - Id : 89783 , se redujo el % de la montura
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 1 WHERE `entry` = 62346 AND item=89783;

-- Misiones Introductorias a pandaria
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=29547;
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=29612;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (1, 29547, 0, '', '', 'quitar al abrir el parche 5.0.x');
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (1, 29612, 0, '', '', 'quitar al abrir el parche 5.0.x');
