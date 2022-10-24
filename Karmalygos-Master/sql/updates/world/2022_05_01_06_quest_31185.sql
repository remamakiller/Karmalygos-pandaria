DELETE FROM `creature` WHERE `guid`=582638;
DELETE FROM `creature` WHERE `guid`=582639;
DELETE FROM `creature` WHERE `guid`=582640;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(582638, 63879, 870, 6138, 6401, 1, 65535, 0, -1228.9, 3656.29, -52.6571, 2.87352, 300, 0, 0, 84, 0, 0, 0, 33554432, 0),
(582639, 63880, 870, 6138, 6402, 1, 65535, 0, -1399.63, 3752.09, -43.9473, 5.2788, 300, 0, 0, 84, 0, 0, 0, 33554432, 0),
(582640, 63881, 870, 6138, 6401, 1, 65535, 0, -1383.56, 3984.26, -34.4473, 2.11286, 300, 0, 0, 84, 0, 0, 0, 33554432, 0);

update `creature_template` set `AIName`= 'SmartAI' where `entry` in (63879,63880,63881,63955);

DELETE FROM `smart_scripts` WHERE `entryorguid`=63879 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=63880 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=63881 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=63955 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(63879, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 45, 1, 1, 0, 0, 0, 0, 19, 63955, 80, 0, 0, 0, 0, 0, 'Event Update - Send Data'),
(63880, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 45, 2, 2, 0, 0, 0, 0, 19, 63955, 80, 0, 0, 0, 0, 0, 'Event Update - Send Data'),
(63881, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 45, 3, 3, 0, 0, 0, 0, 19, 63955, 80, 0, 0, 0, 0, 0, 'Event Update - Send Data'),
(63955, 0, 0, 1, 38, 0, 100, 1, 1, 1, 0, 0, 33, 63879, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Update Data - Kill Credit'),
(63955, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(63955, 0, 2, 3, 38, 0, 100, 1, 2, 2, 0, 0, 33, 63880, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Update Data - Kill Credit'),
(63955, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(63955, 0, 4, 5, 38, 0, 100, 1, 3, 3, 0, 0, 33, 63881, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Update Data - Kill Credit'),
(63955, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(63955, 0, 6, 0, 54, 0, 100, 1, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Just Summoned - Follow Invoker');

