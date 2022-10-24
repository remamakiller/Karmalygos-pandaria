-- 29883 
UPDATE `creature_template` SET `gossip_menu_id`= 13250, `AIName`= 'SmartAI', `ScriptName`= '' WHERE `ENTRY` = 54690;

DELETE FROM `smart_scripts` WHERE `entryorguid`=54960 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54960, 0, 0, 1, 62, 0, 100, 0, 13250, 1, 0, 0, 33, 54960, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54960, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54960, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE `gossip_menu_option` SET `option_id`= 1, `npc_option_npcflag`= 1 WHERE `menu_id` = 13250 and `id`= 1;

-- 29723 
UPDATE `gossip_menu_option` SET `option_id`= 1, `npc_option_npcflag`= 1 WHERE `menu_id` = 13137 and `id`= 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=55368 AND `source_type`=0 AND `id`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=55368 AND `source_type`=0 AND `id`=2;
DELETE FROM `smart_scripts` WHERE `entryorguid`=55368 AND `source_type`=0 AND `id`=3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(55368, 0, 1, 2, 62, 0, 100, 0, 13137, 0, 0, 0, 2, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Jade Witch Quest fix'),
(55368, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Jade Witch Quest fix'),
(55368, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'The Jade Witch Quest fix');


-- 29725 
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 55282;

DELETE FROM `smart_scripts` WHERE `entryorguid`=55282 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(55282, 0, 0, 1, 19, 0, 100, 0, 29725, 0, 0, 0, 33, 55349, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(55282, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 55350, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(55282, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 33, 55351, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(55282, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 55352, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 31130
UPDATE `gameobject_template` SET `AIName`= 'SmartGameObjectAI' WHERE `ENTRY` in ( 213191, 211661, 211659);

DELETE FROM `smart_scripts` WHERE `entryorguid`=213191 AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=211661 AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=211659 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(213191, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 63142, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(211661, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 63141, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(211659, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 63140, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 29890 

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 56287;

DELETE FROM `smart_scripts` WHERE `entryorguid`=56287 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56287, 0, 0, 1, 19, 0, 100, 0, 29890, 0, 0, 0, 33, 56269, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');