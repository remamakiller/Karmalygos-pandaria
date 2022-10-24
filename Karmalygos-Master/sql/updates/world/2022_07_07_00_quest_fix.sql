-- 30774
UPDATE `creature_template` SET `AIName`= '' WHERE `ENTRY` = 60899;
UPDATE `gameobject_template` SET `AIName`= '' WHERE `ENTRY` = 211511;


-- 30993
DELETE FROM `smart_scripts` WHERE `entryorguid`=61819 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(61819, 0, 0, 0, 19, 0, 100, 0, 30752, 0, 0, 0, 11, 121187, 16, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ban Bearheart - On Quest 30752 Accept - Cast Spell 121187'),
(61819, 0, 1, 2, 62, 0, 100, 0, 13831, 0, 0, 0, 33, 61819, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - give credit'),
(61819, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 33, 63603, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - give credit'),
(61819, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 3555.8, 2632.07, 755.89, 5.7, 'On gossip select - Tele player');

DELETE FROM `creature` WHERE `guid`=582917;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES 
(582917, 61819, 870, 5841, 6173, 1, 1, 0, 0, 3562.26, 2631.5, 755.782, 4.64966, 300);

-- 30000
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 56784;

DELETE FROM `smart_scripts` WHERE `entryorguid`=56784 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56784, 0, 0, 0, 19, 0, 100, 0, 30000, 0, 0, 0, 33, 57243, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 30144, 30145, 30187
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 58420;

DELETE FROM `smart_scripts` WHERE `entryorguid`=58420 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58420, 0, 0, 0, 19, 0, 100, 0, 30144, 0, 0, 0, 33, 58426, 0, 6, 6, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(58420, 0, 1, 0, 19, 0, 100, 0, 30145, 0, 0, 0, 33, 58444, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(58420, 0, 2, 3, 19, 0, 100, 0, 30187, 0, 0, 0, 33, 58438, 0, 10, 10, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(58420, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 208, 30187, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 30188, 31810, 31811
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 58564;

DELETE FROM `smart_scripts` WHERE `entryorguid`=58564 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58564, 0, 0, 0, 19, 0, 100, 0, 30188, 0, 0, 0, 33, 58594, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(58564, 0, 1, 0, 19, 0, 100, 0, 31810, 0, 0, 0, 33, 58594, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(58564, 0, 2, 0, 19, 0, 100, 0, 31811, 0, 0, 0, 33, 58594, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 29999 Oscar
UPDATE `creature_template` SET `AIName`= 'SmartAI', `npcflag`= 1 WHERE `ENTRY` in (56851,56853,56850,56852);


DELETE FROM `smart_scripts` WHERE `entryorguid`=56850 AND `source_type`=0 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56850, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56860, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kc dragon dorado');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56851 AND `source_type`=0 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56851, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56859, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kc dragon esmeralda');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56853 AND `source_type`=0 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56853, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56856, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kc dragon azur');


DELETE FROM `smart_scripts` WHERE `entryorguid`=56852 AND `source_type`=0 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56852, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56858, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kc dragon carmesi');


-- 31303
UPDATE `creature_template` SET `npcflag`= 1 WHERE `ENTRY` = 64244;

DELETE FROM `smart_scripts` WHERE `entryorguid`=64244 AND `source_type`=0 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(64244, 0, 0, 0, 62, 0, 100, 0, 14381, 0, 0, 0, 80, 6424400, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arch');

DELETE FROM `smart_scripts` WHERE `entryorguid`=6424400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(6424400, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Arch'),
(6424400, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 85, 125374, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Archmage'),
(6424400, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Archma\'');


UPDATE `creature_template` SET `VehicleId`= 2358, `InhabitType`= 4, `spell1`= 125452 WHERE `ENTRY` = 64249;

DELETE FROM `smart_scripts` WHERE `entryorguid`=64249 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(64249, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 85, 46598, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, ''),
(64249, 0, 1, 0, 27, 0, 100, 0, 0, 0, 0, 0, 53, 1, 64249, 0, 31303, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On board - Start WP'),
(64249, 0, 2, 0, 40, 0, 100, 0, 8, 64249, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on wp reached die self');



UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 64269;

DELETE FROM `smart_scripts` WHERE `entryorguid`=64269 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(64269, 0, 0, 0, 8, 0, 100, 0, 125456, 0, 0, 0, 85, 125462, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=125452;


-- 29753
UPDATE `creature_template` SET `KillCredit1`= 55462 WHERE `ENTRY` in (55790,55787);


-- 29894 Oscar
DELETE FROM `smart_scripts` WHERE `entryorguid`=54960 AND `source_type`=0 AND `id` in (3,4,5);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54960, 0, 3, 4, 62, 0, 100, 0, 13250, 0, 0, 0, 33, 54894, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc'),
(54960, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56398, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc'),
(54960, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=13250;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 13250, 0, 0, 0, 9, 0, 29894, 0, 0, 0, 0, 0, '', ''),
(15, 13250, 1, 0, 0, 9, 0, 29883, 0, 0, 0, 0, 0, '', '');

-- 29900
DELETE FROM `gameobject` WHERE `guid`=547648;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(547648, 209582, 870, 5785, 5954, 1, 1, -96.2222213745117187, -3190.654541015625, 93.37520599365234375, 4.79648590087890625, 60, 255, 1);

DELETE FROM `gameobject_loot_template` WHERE `entry`=42317;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(42317, 79875, -99.8885, '', 0, 1, 1);

UPDATE `gameobject_template` SET `data0`= 1691, `data1`= 42317, `data2`= 1, `data14`= 19676, `data17`= 16539, `size`= 4, `displayId`= 10981, `castBarCaption`= 'Collecting' WHERE `ENTRY` = 209582;


UPDATE `gameobject_template_addon` SET `flags`= 2113540 WHERE `ENTRY` = 209582;


-- 30827
UPDATE `creature_template` SET `AIName`= 'SmartAI', `npcflag`= 1 WHERE `ENTRY` in (60933,60990,60991);
UPDATE `creature_template` SET `AIName`= 'SmartAI', `npcflag`= 3 WHERE `ENTRY` in (60864);


DELETE FROM `smart_scripts` WHERE `entryorguid`=60864 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60864, 0, 0, 1, 62, 0, 100, 0, 13739, 2, 0, 0, 33, 65256, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc'),
(60864, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61015, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60933 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60933, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 33, 60933, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc'),
(60933, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60990 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60990, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 33, 60990, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc'),
(60990, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60991 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60991, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 33, 60991, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc'),
(60991, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc');


-- 31077
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 67138;

DELETE FROM `smart_scripts` WHERE `entryorguid`=67138 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(67138, 0, 0, 1, 19, 0, 100, 0, 31077, 0, 0, 0, 33, 65408, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(67138, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 62964, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


UPDATE `creature_template` SET `faction_A`= 1802, `faction_H`= 1802 WHERE `ENTRY` = 68130;
UPDATE `creature_template` SET `faction_A`= 35, `faction_H`= 35 WHERE `ENTRY` = 72536;

 /*
62757
62758
*/