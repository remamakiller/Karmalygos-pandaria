update `creature_template` set `AIName`= 'SmartAI' where `entry` in (63369);

DELETE FROM `smart_scripts` WHERE `entryorguid`=63369 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(63369, 0, 0, 0, 6, 0, 100, 1, 0, 0, 0, 0, 33, 63995, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On death - Give credit');


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=63369 AND `SourceId`=0 AND `ElseGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 63369, 0, 0, 29, 0, 63955, 10, 0, 0, 0, '', 'SAI only if near npc');


DELETE FROM `creature` WHERE `guid`=582640;
DELETE FROM `creature` WHERE `guid`=582641;
DELETE FROM `creature` WHERE `guid`=582642;
DELETE FROM `creature` WHERE `guid`=582643;
DELETE FROM `creature` WHERE `guid`=582644;
DELETE FROM `creature` WHERE `guid`=582645;
DELETE FROM `creature` WHERE `guid`=582646;
DELETE FROM `creature` WHERE `guid`=582647;
DELETE FROM `creature` WHERE `guid`=582648;
DELETE FROM `creature` WHERE `guid`=582649;
DELETE FROM `creature` WHERE `guid`=582650;
DELETE FROM `creature` WHERE `guid`=582651;
DELETE FROM `creature` WHERE `guid`=582652;
DELETE FROM `creature` WHERE `guid`=582653;
DELETE FROM `creature` WHERE `guid`=582654;
DELETE FROM `creature` WHERE `guid`=582655;
DELETE FROM `creature` WHERE `guid`=582656;
DELETE FROM `creature` WHERE `guid`=582657;
DELETE FROM `creature` WHERE `guid`=582658;
DELETE FROM `creature` WHERE `guid`=582659;
DELETE FROM `creature` WHERE `guid`=582660;
DELETE FROM `creature` WHERE `guid`=582662;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(582640, 63369, 870, 6138, 6401, 1, 1, 43189, -1306.99, 3522.19, -40.1086, 3.7861, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582641, 63369, 870, 6138, 6401, 1, 1, 43189, -1267.36, 3523.03, -40.2969, -0.405652, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582642, 63369, 870, 6138, 6401, 1, 1, 43189, -1278.89, 3637.45, -60.4141, 0.237405, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582643, 63369, 870, 6138, 6401, 1, 1, 43189, -1279.15, 3579.35, -41.0015, 4.34105, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582644, 63369, 870, 6138, 6401, 1, 1, 43189, -1310.65, 3751.65, -44.5098, 4.9436, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582645, 63369, 870, 6138, 6401, 1, 1, 43189, -1309.38, 3780.79, -44.3036, 3.01213, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582646, 63369, 870, 6138, 6401, 1, 1, 43189, -1353.52, 3613.96, -42.399, 3.72891, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582647, 63369, 870, 6138, 6401, 1, 1, 43189, -1301.4, 3827.67, -44.7134, 1.36416, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582648, 63369, 870, 6138, 6401, 1, 1, 43189, -1429.68, 3991.91, -42.8744, 6.23429, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582649, 63369, 870, 6138, 6401, 1, 1, 43189, -1378.19, 3915.68, -44.0053, 5.24067, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582650, 63369, 870, 6138, 6401, 1, 1, 43189, -1352.46, 3943.14, -47.5802, 4.93136, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582651, 63369, 870, 6138, 6401, 1, 1, 43189, -1411.88, 3856.76, -46.2289, 4.69782, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582652, 63369, 870, 6138, 6401, 1, 1, 43189, -1330.03, 3885.81, -44.1236, 5.27327, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582653, 63369, 870, 6138, 6401, 1, 1, 43189, -1338.8, 3848.94, -44.6057, 2.05317, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582654, 63369, 870, 6138, 6401, 1, 1, 43189, -1255.39, 3830.66, -48.2098, 1.92998, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582655, 63369, 870, 6138, 6401, 1, 1, 43189, -1148.12, 3796.36, -17.5679, 3.63307, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582656, 63369, 870, 6138, 6401, 1, 1, 43189, -1058.78, 3709.39, -18.2616, 2.87584, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582657, 63369, 870, 6138, 6401, 1, 1, 43189, -1434.29, 4059.5, -45.508, 2.42204, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582658, 63369, 870, 6138, 6401, 1, 1, 43189, -1384.26, 4025.29, -44.6041, 2.53766, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582659, 63369, 870, 6138, 6402, 1, 1, 43189, -1367.06, 3775.25, -46.1958, 5.96329, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582660, 63369, 870, 6138, 6402, 1, 1, 43189, -1389.39, 3714.83, -47.0801, 2.40631, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582662, 63369, 870, 6138, 6402, 1, 1, 43189, -1419.42, 3718.12, -49.5766, -2.0943, 300, 0, 0, 393941, 393941, 0, 0, 0, 0);
