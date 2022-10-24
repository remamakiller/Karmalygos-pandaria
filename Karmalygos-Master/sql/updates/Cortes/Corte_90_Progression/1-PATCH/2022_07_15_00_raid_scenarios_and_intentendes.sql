DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=616;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(616, 'Dagger in the Dark', 778.34, -191.181, 402.445, 6.26, 425);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=593;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(593, 'Assault on Zan\'vess', -679.186, 4408.64, 186.2, 4.55, 425);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=566;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(566, 'Theramore\'s Fall', -4023.08, -4748.8, 5.21768, 0.781, 425);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=567;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(567, 'Theramore\'s Fall', -3813.67, -4790.98, 10.5307, 0.805, 425);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=590;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(590, 'Lion\'s Landing', -1189.26, -1196.95, 36.7994, 5.58, 425);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=595;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(595, 'Domination Point', -1751.35, 2488.86, 33.9575, 3.176, 425);
-- esta es templanza?
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=589;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(589, 'A Little Patience', -1085.8, 1168.9, 16.8407, 5.122, 425);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=619;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES 
(619, 'A Little Patience', -1085.8, 1168.9, 16.8407, 5.122, 425);

-- Intendentes spawn
DELETE FROM `creature` WHERE `guid`=527449;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(527449, 64599, 870, 6138, 6315, 1, 65535, 0, 0, 150.167, 3184.61, 214.716, 0.00266838, 300, 0, 0, 0, 393941, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `guid`=533977;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(533977, 64032, 870, 5840, 6142, 1, 65535, 0, 0, 871.173, 337.956, 456.53, 5.80112, 300, 0, 0, 0, 393941, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `guid`=524060;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(524060, 64595, 870, 5842, 6197, 1, 1, 0, 0, 1855.02, 4272.08, 148.868, 3.98206, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `guid`=535311;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(535311, 59908, 870, 5840, 6554, 1, 1, 0, 0, 1575.4, 879.368, 424.057, 2.95608, 120, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `guid`=572372;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(572372, 59908, 870, 5840, 6142, 1, 1, 0, 0, 888.234, 347.184, 456.563, 0.256374, 120, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `access_requirement` WHERE `mapId`=1008 AND `difficulty`='RAID_10MAN_NORMAL';
INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item_level`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) VALUES 
(1008, 'RAID_10MAN_NORMAL', 90, 0, 0, 0, 0, 0, 0, 0, NULL, 'Mogu\'shan Vaults (Entrance)');
DELETE FROM `access_requirement` WHERE `mapId`=1008 AND `difficulty`='RAID_25MAN_NORMAL';
INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item_level`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) VALUES 
(1008, 'RAID_25MAN_NORMAL', 90, 0, 0, 0, 0, 0, 0, 0, NULL, 'Mogu\'shan Vaults (Entrance)');
 
 /*Cosas q Faltaron*/
UPDATE `creature_template` SET `npcflag` = 4227 WHERE `entry` = 64032;
UPDATE `creature_template` SET `npcflag` = 131 WHERE `entry` = 64599;
UPDATE `creature_template` SET `npcflag` = 4224 WHERE `entry` = 64595;
UPDATE `creature_template` SET `npcflag` = 4227 WHERE `entry` = 59908;
update `creature_template` set `npcflag`=4225 where `entry`=59908;
update `creature_template` set `npcflag`=4227 where `entry`=64001;



UPDATE `access_requirement` SET `level_min` = '85' WHERE `mapId` = '1000' AND `difficulty` = 'SCENARIO_NORMAL';
UPDATE `access_requirement` SET `level_min` = '85' WHERE `mapId` = '999' AND `difficulty` = 'SCENARIO_NORMAL';
UPDATE `access_requirement` SET `level_min` = '90' WHERE `mapId` = '1050' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Assault on Zan'vess Entrance
UPDATE `access_requirement` SET `level_min` = '90' WHERE `mapId` = '1103' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Lion's Landing Entrance
UPDATE `access_requirement` SET `level_min` = '90' WHERE `mapId` = '1102' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Domination Point Entrance
UPDATE `access_requirement` SET `level_min` = '90' WHERE `mapId` = '1095' AND `difficulty` = 'SCENARIO_NORMAL'; -- Level:90 - Dagger in the Dark Entrance