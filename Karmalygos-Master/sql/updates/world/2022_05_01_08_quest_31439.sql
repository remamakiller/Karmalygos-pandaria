update `creature_template` set `npcflag`= 2 where `entry` in (64672);

DELETE FROM `creature` WHERE `guid`=582663;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(582663, 64672, 870, 6138, 6441, 1, 1, 0, 0, -654.458, 3140.33, 146.404, 4.62734, 60, 0, 0, 0, 393941, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_questender` WHERE `id`=64672 AND `quest`=31439;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (64672, 31439);

DELETE FROM `creature_queststarter` WHERE `id`=64672 AND `quest`=31441;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (64672, 31441);
