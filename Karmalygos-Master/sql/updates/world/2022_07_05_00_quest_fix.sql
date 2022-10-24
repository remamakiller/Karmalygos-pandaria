-- 30921
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 61482;

DELETE FROM `smart_scripts` WHERE `entryorguid`=61482 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(61482, 0, 0, 1, 19, 0, 100, 0, 30921, 0, 0, 0, 33, 61400, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61482, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61401, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61482, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61402, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61482, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61403, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 31211
UPDATE `creature_template` SET `ScriptName`= 'npc_xaril_the_poisoned_mind' WHERE `ENTRY` = 62151;

-- 12801

-- 30929
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 61161;

DELETE FROM `smart_scripts` WHERE `entryorguid`=61161 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(61161, 0, 0, 1, 19, 0, 100, 0, 30929, 0, 0, 0, 33, 61606, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61161, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61607, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61161, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61608, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(61161, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 61609, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 29903
UPDATE `creature_template` SET `AIName`= 'SmartAI', `npcflag`= 1, `gossip_menu_id`= 13271 WHERE `ENTRY` = 54959;

DELETE FROM `gossip_menu` WHERE `entry`=13271;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(13271, 18741);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=13271;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`) VALUES 
(13271, 1, 0, 'Toma este libro de rezos de sanación.',         0, 1, 1),
(13271, 2, 0, 'Este bastón de hechicería está hecho para ti.', 0, 1, 1),
(13271, 3, 0, '¿Estas dagas servirán?',                        0, 1, 1),
(13271, 0, 0, 'Puede que necesites este escudo.',              0, 1, 1);

DELETE FROM `creature` WHERE `id`= 54959;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`) VALUES 
(582905, 54959, 870, 5785, 5934, 1, 1, -171.695114135742187, -2652.369384765625, -0.07652175426483154, 3.638177156448364257, 120), -- 54959 (Area: 5934 - Difficulty: 0) (possible waypoints or random movement)
(582906, 54959, 870, 5785, 5934, 1, 1, -121.678817749023437, -2638.873291015625, 1.382007360458374023, 3.485723018646240234, 120), -- 54959 (Area: 5934 - Difficulty: 0) (Auras: 105710 - 105710)
(582907, 54959, 870, 5785, 5935, 1, 1, -267.19964599609375,  -2674.630126953125, -0.25738525390625,    4.597712039947509765, 120), -- 54959 (Area: 5935 - Difficulty: 0) (Auras: 105710 - 105710)
(582908, 54959, 870, 5785, 5935, 1, 1, -277.118072509765625, -2691.100830078125, -0.25736835598945617, 0.767944872379302978, 120), -- 54959 (Area: 5935 - Difficulty: 0) (Auras: 105710 - 105710)
(582909, 54959, 870, 5785, 5935, 1, 1, -266.05902099609375,  -2693.1875,         -0.2573784589767456,  0.672017812728881835, 120), -- 54959 (Area: 5935 - Difficulty: 0)
(582910, 54959, 870, 5785, 5935, 1, 1, -295.90972900390625,  -2676.14404296875,  0.494153022766113281, 6.184039115905761718, 120), -- 54959 (Area: 5935 - Difficulty: 0)
(582911, 54959, 870, 5785, 5935, 1, 1, -293.914947509765625, -2644.51904296875,  -0.0195339024066925,  4.750304222106933593, 120), -- 54959 (Area: 5935 - Difficulty: 0)
(582912, 54959, 870, 5785, 5935, 1, 1, -320.74652099609375,  -2716.220458984375, 0.682672441005706787, 3.226448297500610351, 120), -- 54959 (Area: 5935 - Difficulty: 0)
(582913, 54959, 870, 5785, 5935, 1, 1, -349.12847900390625,  -2753.73095703125,  2.115839481353759765, 4.297636032104492187, 120), -- 54959 (Area: 5935 - Difficulty: 0)
(582914, 54959, 870, 5785, 5935, 1, 1, -431.56597900390625,  -2702.7744140625,   4.603793144226074218, 5.367177009582519531, 120), -- 54959 (Area: 5935 - Difficulty: 0)
(582915, 54959, 870, 5785, 5935, 1, 1, -392.7725830078125,   -2804.513916015625, 10.77663516998291015, 2.094395160675048828, 120), -- 54959 (Area: 5935 - Difficulty: 0)
(582916, 54959, 870, 5785, 5935, 1, 1, -412.015625,          -2825.786376953125, 10.46834182739257812, 1.718021154403686523, 120); -- 54959 (Area: 5935 - Difficulty: 0)

DELETE FROM `smart_scripts` WHERE `entryorguid`=54959 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54959, 0, 0, 4, 62, 0, 100, 0, 13271, 0, 0, 0, 33, 56601, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54959, 0, 1, 4, 62, 0, 100, 0, 13271, 1, 0, 0, 33, 56601, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54959, 0, 2, 4, 62, 0, 100, 0, 13271, 2, 0, 0, 33, 56601, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54959, 0, 3, 4, 62, 0, 100, 0, 13271, 3, 0, 0, 33, 56601, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54959, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 30144


-- 30607
UPDATE `creature_template` SET `faction_A`= 14, `faction_H`= 14 WHERE `ENTRY` = 60090;

-- 30612
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 59452;

DELETE FROM `smart_scripts` WHERE `entryorguid`=59452 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59452, 0, 0, 1, 19, 0, 100, 0, 30612, 0, 0, 0, 33, 59419, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(59452, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 60188, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 30648
UPDATE `creature_template` SET `npcflag`= 3 WHERE `ENTRY` = 59899;

DELETE FROM `smart_scripts` WHERE `entryorguid`=59899 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59899, 0, 0, 1, 62, 0, 100, 0, 13646, 0, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 529.507, -706.552, 247.248, 0.726149, 'Gossip Select - Teleport'),
(59899, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 59692, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak');

-- 30495
UPDATE `creature_template` SET `npcflag`= 1 WHERE `ENTRY` in (59401,59397,59395);

DELETE FROM `smart_scripts` WHERE `entryorguid`=59392 AND `source_type`=0 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59392, 0, 0, 0, 62, 0, 100, 0, 13550, 1, 0, 0, 33, 59392, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kc-on gosip select');


-- 29623
UPDATE `creature_template` SET `AIName`= '' WHERE `ENTRY` = 54917;

DELETE FROM `smart_scripts` WHERE `entryorguid`=54917;

UPDATE `creature_template` SET `flags_extra`= 2 WHERE `ENTRY` in (55184,55183);


UPDATE `gameobject` SET `phaseMask`= 4294967295 WHERE `guid`= 525040;