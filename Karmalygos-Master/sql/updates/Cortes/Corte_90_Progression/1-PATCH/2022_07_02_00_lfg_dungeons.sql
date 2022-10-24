-- Misiones Introductorias a pandaria
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=29547;
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=29612;

DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=462;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (462, 'Random Mists of Pandaria Heroic', 0, 0, 0, 0, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=468;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (468, 'Temple of the Jade Serpent', 0, 0, 0, 0, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=469;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (469, 'Stormstout Brewery', 0, 0, 0, 0, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=470;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (470, 'Shado-Pan Monastery', 0, 0, 0, 0, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=471;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (471, 'Gate of the Setting Sun', 0, 0, 0, 0, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=472;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (472, 'Scholomance', 0, 0, 0, 0, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=473;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (473, 'Scarlet Halls', 836.666, 605.141, 12.8149, 4.65618, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=474;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (474, 'Scarlet Monastery', 1124.64, 512.467, 0.989549, 1.5708, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=519;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (519, 'Mogu\'Shan Palace', 0, 0, 0, 0, 435);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=554;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (554, 'Siege of Niuzao Temple', 0, 0, 0, 0, 435);


DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=463;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (463, 'Random Mists of Pandaria Dungeon', 0, 0, 0, 0, 358);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=464;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (464, 'Temple of the Jade Serpent', 0, 0, 0, 0, 358);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=465;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (465, 'Stormstout Brewery', 0, 0, 0, 0, 358);

DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=466;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (466, 'Shado-Pan Monastery', 0, 0, 0, 0, 393);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=467;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (467, 'Mogu\'shan Palace', 0, 0, 0, 0, 393);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=630;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (630, 'Siege of Niuzao Temple', 0, 0, 0, 0, 393);
DELETE FROM `lfg_dungeon_template` WHERE `dungeonId`=631;
INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`) VALUES (631, 'Gate of the Setting Sun', 0, 0, 0, 0, 393);


