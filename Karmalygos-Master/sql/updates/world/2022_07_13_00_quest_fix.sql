-- 5161
DELETE FROM `creature` WHERE `guid`=582918;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES 
(582918, 5161, 0, 1537, 4679, 1, 1, -4609.25, -1093.96, 505.086, 3.1765, 300);


-- 29930
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 56467;

DELETE FROM `smart_scripts` WHERE `entryorguid`=56467 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56467, 0, 0, 0, 19, 0, 100, 0, 29930, 0, 0, 0, 33, 56508, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 30568
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 55122;

DELETE FROM `smart_scripts` WHERE `entryorguid`=55122 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(55122, 0, 0, 1, 19, 0, 100, 0, 30568, 0, 0, 0, 33, 59572, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(55122, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 59562, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(55122, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 59609, 0, 3, 3, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');



-- 30317
DELETE FROM `smart_scripts` WHERE `entryorguid`=57298 AND `source_type`=0 AND `id` in (3,4);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(57298, 0, 3, 4, 19, 0, 100, 0, 30317, 0, 0, 0, 33, 59574, 0, 35, 35, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(57298, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 208, 30317, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 30470
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 58761;

DELETE FROM `smart_scripts` WHERE `entryorguid`=58761 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58761, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 208, 30470, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=58761;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 58761, 0, 0, 2, 0, 80134, 1, 0, 0, 0, 0, '', '');


-- 31338
UPDATE `creature_template` SET `npcflag`= 1, `AIName`= 'SmartAI' WHERE `ENTRY` = 64385;

DELETE FROM `smart_scripts` WHERE `entryorguid`=64385 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(64385, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sheepie'),
(64385, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 56, 86446, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Sheepie');

-- 30321
DELETE FROM `smart_scripts` WHERE `entryorguid`=58710 AND `source_type`=0 AND `id` in (2,3);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58710, 0, 2, 3, 19, 0, 100, 0, 30321, 0, 0, 0, 33, 59524, 0, 100, 100, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(58710, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 208, 30321, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 31341 
UPDATE `creature_template` SET `faction_A`= 14, `faction_H`= 14 WHERE `ENTRY` = 64389;

-- 30624
DELETE FROM `smart_scripts` WHERE `entryorguid`=59849 AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59849, 0, 4, 0, 60, 0, 100, 0, 1000, 1000, 1000, 1000, 33, 59881, 0, 0, 0, 0, 0, 18, 10, 0, 0, 0, 0, 0, 0, 'On update - Give quest credit');


-- 30172 30051
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 56474;

DELETE FROM `smart_scripts` WHERE `entryorguid`=56474 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56474, 0, 0, 0, 19, 0, 100, 0, 30172, 0, 0, 0, 33, 58341, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56474, 0, 1, 2, 19, 0, 100, 0, 30051, 0, 0, 0, 33, 58793, 0, 30, 30, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56474, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 208, 30051, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 31190 
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 63317;

DELETE FROM `smart_scripts` WHERE `entryorguid`=63317 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(63317, 0, 0, 1, 19, 0, 100, 0, 31190, 0, 0, 0, 33, 64230, 0, 20, 20, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(63317, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 64229, 0, 20, 20, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(63317, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 33, 64228, 0, 20, 20, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(63317, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 33, 64222, 0, 20, 20, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(63317, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 208, 31190, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 30898
update `creature` SET `spawntimesecs`= 60 WHERE `id` in (62014);

delete from `creature` WHERE `id` in (61960);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES 
(582919, 61960, 870, 5842, 6187, 1, 1, 1235.52, 2818.03, 263.013,   0.125543, 60),
(582920, 61960, 870, 5842, 6187, 1, 1, 1232.23, 2822.48,  263.29, 0.00576933, 60),
(582921, 61960, 870, 5842, 6187, 1, 1, 1237.21, 2826.86, 263.341, 0.00576933, 60),
(582922, 61960, 870, 5842, 6187, 1, 1, 1238.33, 2823.28, 263.215, 0.00576933, 60),
(582923, 61960, 870, 5842, 6187, 1, 1, 1244.18, 2817.87, 263.069, 0.00576933, 60),
(582924, 61960, 870, 5842, 6187, 1, 1, 1245.89, 2825.58, 263.523, 0.00576933, 60),
(582925, 61960, 870, 5842, 6187, 1, 1, 1245.17, 2833.26, 263.837,   0.200155, 60),
(582926, 61960, 870, 5842, 6187, 1, 1, 1244.64,  2837.3,   264.1,   0.200155, 60),
(582927, 61960, 870, 5842, 6187, 1, 1, 1238.02, 2841.16, 264.417,    5.59977, 60),
(582928, 61960, 870, 5842, 6187, 1, 1, 1223.73, 2831.29,  263.99,     6.0337, 60),
(582929, 61960, 870, 5842, 6187, 1, 1, 1220.27, 2837.08,  264.73,    5.89429, 60),
(582930, 61960, 870, 5842, 6187, 1, 1, 1213.46, 2830.21, 265.088,    6.10242, 60),
(582931, 61960, 870, 5842, 6187, 1, 1, 1210.69, 2834.81, 265.993,  0.0489642, 60),
(582932, 61960, 870, 5842, 6187, 1, 1, 1213.04, 2839.38, 265.864,  0.0489642, 60),
(582933, 61960, 870, 5842, 6187, 1, 1, 1216.85, 2845.75, 265.571,  0.0489642, 60),
(582934, 61960, 870, 5842, 6187, 1, 1, 1222.73, 2850.53, 265.504,     6.2811, 60),
(582935, 61960, 870, 5842, 6187, 1, 1, 1200.63, 2857.79, 266.876,          0, 60),
(582936, 61960, 870, 5842, 6187, 1, 1, 1199.11, 2851.41, 266.876,     6.0494, 60),
(582937, 61960, 870, 5842, 6187, 1, 1, 1203.34, 2846.83,  266.69,     6.0494, 60),
(582938, 61960, 870, 5842, 6187, 1, 1, 1205.51,  2856.7, 266.723,     6.1947, 60),
(582939, 61960, 870, 5842, 6187, 1, 1, 1196.55, 2855.05, 267.026,    6.13383, 60),
(582940, 61960, 870, 5842, 6187, 1, 1, 1186.93, 2846.72, 267.494,    5.98067, 60),
(582941, 61960, 870, 5842, 6187, 1, 1, 1192.23, 2841.87, 266.808,    6.10437, 60),
(582942, 61960, 870, 5842, 6187, 1, 1, 1189.05, 2836.65, 267.166,    6.03172, 60),
(582943, 61960, 870, 5842, 6187, 1, 1, 1195.67, 2796.91, 267.859,    6.25163, 60),
(582944, 61960, 870, 5842, 6187, 1, 1, 1198.9,  2800.97, 266.444,    6.25163, 60),
(582945, 61960, 870, 5842, 6187, 1, 1, 1193.4,  2800.25, 267.469,    6.24181, 60),
(582946, 61960, 870, 5842, 6187, 1, 1, 1202.47, 2797.66, 266.406,    6.24181, 60),
(582947, 61960, 870, 5842, 6187, 1, 1, 1205.27, 2801.27, 265.193,    6.24181, 60),
(582948, 61960, 870, 5842, 6187, 1, 1, 1209.8,  2796.35, 265.399,    6.24181, 60),
(582949, 61960, 870, 5842, 6187, 1, 1, 1212.35,    2801, 264.543,    6.24181, 60),
(582950, 61960, 870, 5842, 6187, 1, 1, 1213.56, 2792.23, 265.637,   0.052873, 60),
(582951, 61960, 870, 5842, 6187, 1, 1, 1206.24,  2794.7, 266.277,   0.245295, 60),
(582952, 61960, 870, 5842, 6187, 1, 1, 1215.76, 2796.22,  264.89,    5.93943, 60),
(582953, 61960, 870, 5842, 6187, 1, 1, 1229.84, 2794.76, 263.344,    6.13185, 60),
(582954, 61960, 870, 5842, 6187, 1, 1, 1224.27, 2790.68, 264.493,     6.2045, 60),
(582955, 61960, 870, 5842, 6187, 1, 1, 1231.22, 2791.42, 263.323,     6.2045, 60),
(582956, 61960, 870, 5842, 6187, 1, 1, 1236.87, 2794.38, 263.027,     6.2045, 60),
(582957, 61960, 870, 5842, 6187, 1, 1, 1234.26, 2798.12, 263.134,     6.2045, 60),
(582958, 61960, 870, 5842, 6187, 1, 1, 1230.23, 2800.58,  263.34,    6.14952, 60);

-- 30925 
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 61581;

DELETE FROM `smart_scripts` WHERE `entryorguid`=61581 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(61581, 0, 0, 1, 19, 0, 100, 0, 30925, 0, 0, 0, 33, 61676, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61581, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61674, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61581, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61673, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61581, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61675, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 29907
DELETE FROM `smart_scripts` WHERE `entryorguid`=56133 AND `source_type`=0 AND `id`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56133, 0, 1, 0, 19, 0, 100, 0, 29907, 0, 0, 0, 33, 56343, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'old action 85 param 105835');

-- 30694
UPDATE `gameobject_template` SET `data4`= 1 WHERE `ENTRY` = 211428;

DELETE FROM `gameobject` WHERE `id`= 211428;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(547649, 211428, 870, 6134, 6004, 1, 1, -1034.6, 731.809, 47.4759, 2.45584, 0, 0, 0, 1,   60, 255, 1),
(547650, 211428, 870, 6134, 6004, 1, 1, -987.503, 800.628, 33.062, 2.45584, 0, 0, 0, 1,   60, 255, 1),
(547651, 211428, 870, 6134, 6004, 1, 1, -1042.39, 838.099, 33.0376, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547652, 211428, 870, 6134, 6004, 1, 1, -1064.3, 731.188, 47.8533, 2.45584, 0, 0, 0, 1,  60, 255, 1),
(547653, 211428, 870, 6134, 6004, 1, 1, -1103.19, 789.042, 19.8816, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547654, 211428, 870, 6134, 6004, 1, 1, -1135.59, 733.493, 23.8078, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547655, 211428, 870, 6134, 6004, 1, 1, -1156.62, 791.715, 18.7901, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547656, 211428, 870, 6134, 6004, 1, 1, -1194.33, 774.972, 21.444, 2.45584, 0, 0, 0, 1,  60, 255, 1),
(547657, 211428, 870, 6134, 6004, 1, 1, -1199.94, 828.49, 18.1998, 2.45584, 0, 0, 0, 1,  60, 255, 1),
(547658, 211428, 870, 6134, 6004, 1, 1, -1248.16, 757.562, 22.4667, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547659, 211428, 870, 6134, 6004, 1, 1, -1239.76, 822.762, 26.3762, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547660, 211428, 870, 6134, 6004, 1, 1, -1196.39, 870.347, 26.5293, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547661, 211428, 870, 6134, 6004, 1, 1, -1301.32, 762.769, 16.4801, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547662, 211428, 870, 6134, 6004, 1, 1, -1309.84, 734.507, 15.3004, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547663, 211428, 870, 6134, 6004, 1, 1, -1265.9, 710.141, 14.2676, 2.45584, 0, 0, 0, 1,  60, 255, 1),
(547664, 211428, 870, 6134, 6004, 1, 1, -1301.02, 800.632, 17.5809, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547665, 211428, 870, 6134, 6014, 1, 1, -1504.41, 1068.18, 27.1991, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547666, 211428, 870, 6134, 6014, 1, 1, -1448.21, 1034.47, 35.7895, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547667, 211428, 870, 6134, 6014, 1, 1, -1419.33, 1065.51, 27.1952, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547668, 211428, 870, 6134, 6014, 1, 1, -1359.17, 1113.16, 23.1632, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547669, 211428, 870, 6134, 6014, 1, 1, -1314.7, 1127.76, 16.2121, 2.45584, 0, 0, 0, 1,  60, 255, 1),
(547670, 211428, 870, 6134, 6014, 1, 1, -1287.34, 1135.76, 16.5981, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547671, 211428, 870, 6134, 6014, 1, 1, -1330.73, 1209.51, 16.9162, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547672, 211428, 870, 6134, 6018, 1, 1, -1266.22, 1207.49, 16.4817, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547673, 211428, 870, 6134, 6004, 1, 1, -1179.75, 1171.91, 20.5059, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547674, 211428, 870, 6134, 6004, 1, 1, -1127.07, 1122.08, 24.1152, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547675, 211428, 870, 6134, 6018, 1, 1, -1098.5, 1200.47, 23.7224, 2.45584, 0, 0, 0, 1,  60, 255, 1),
(547676, 211428, 870, 6134, 6018, 1, 1, -1121.18, 1243.97, 20.6542, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547677, 211428, 870, 6134, 6004, 1, 1, -1037.54, 950.368, 24.2458, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547678, 211428, 870, 6134, 6049, 1, 1, -1107.66, 1048.01, 24.7387, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547679, 211428, 870, 6134, 6014, 1, 1, -1428.12, 977.828, 29.3814, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547680, 211428, 870, 6134, 6014, 1, 1, -1262.81, 962.665, 17.0299, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547681, 211428, 870, 6134, 6014, 1, 1, -1205.89, 956.415, 24.5283, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547682, 211428, 870, 6134, 6004, 1, 1, -1140.26, 904.604, 23.6888, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547683, 211428, 870, 6134, 6004, 1, 1, -1135.09, 956.646, 23.6784, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547684, 211428, 870, 6134, 6004, 1, 1, -1087.6, 907.316, 23.6494, 2.45584, 0, 0, 0, 1,  60, 255, 1),
(547685, 211428, 870, 6134, 6014, 1, 1, -1395.83, 1014.59, 43.6347, 2.45584, 0, 0, 0, 1, 60, 255, 1),
(547686, 211428, 870, 6134, 6004, 1, 1, -1155.24, 668.764, 25.6613, 2.45584, 0, 0, 0, 1, 60, 255, 1);


