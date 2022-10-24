-- 30682​
UPDATE `creature_template` SET `AIName`= 'SmartAI', `ScriptName`= '' WHERE `ENTRY` in (60178,60187,60190,60189,60236,60229,60235,60234);

UPDATE `gossip_menu_option` SET `option_id`= 1, `npc_option_npcflag`= 1 WHERE `menu_id` in (13678,13681,13680) and `id`= 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=60178 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60178, 0, 0, 0, 19, 0, 100, 0, 30682, 0, 0, 0, 85, 116151, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'QAdd - InvCast');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60236 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60236, 0, 0, 1, 54, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'JustSum - SayText'),
(60236, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 60178, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'JustSum - KillCredit'),
(60236, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60187 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60187, 0, 0, 1, 62, 0, 100, 0, 13678, 0, 0, 0, 85, 116145, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'GossipSelect - InvCast'),
(60187, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'GossipSelect - CloseGossip');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60229 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60229, 0, 0, 1, 54, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'JustSum - SayText'),
(60229, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 60187, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'JustSum - KillCredit'),
(60229, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60190 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60190, 0, 0, 1, 62, 0, 100, 0, 13681, 0, 0, 0, 85, 116149, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'GossipSelect - InvCast'),
(60190, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'GossipSelect - CloseGossip');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60235 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60235, 0, 0, 1, 54, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'JustSum - SayText'),
(60235, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 60190, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'JustSum - KillCredit'),
(60235, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60189 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60189, 0, 0, 1, 62, 0, 100, 0, 13680, 0, 0, 0, 85, 116147, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'GossipSelect - InvCast'),
(60189, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'GossipSelect - CloseGossip');

DELETE FROM `smart_scripts` WHERE `entryorguid`=60234 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(60234, 0, 0, 1, 54, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'JustSum - SayText'),
(60234, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 60189, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'JustSum - KillCredit'),
(60234, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');



-- 30690
DELETE FROM `spell_script_names` WHERE `spell_id`=118938;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (118938, 'spell_blind_rage_trap');


-- 30082
UPDATE `creature_template` SET `npcflag`= 3, `gossip_menu_id`= 13353 WHERE `ENTRY` = 58376;

DELETE FROM `smart_scripts` WHERE `entryorguid`=58376 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58376, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 33, 57745, 0, 0, 0, 0, 0, 18, 15, 0, 0, 0, 0, 0, 0, 'On update - Give credit'),
(58376, 0, 1, 2, 62, 0, 100, 0, 13353, 0, 0, 0, 33, 57310, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Give credit'),
(58376, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Close gossip');

-- 30661



-- npc 64518
UPDATE `gossip_menu_option` SET `option_id`= 3, `npc_option_npcflag`= 128 WHERE `menu_id` = 14528 and `id`= 0;

-- 30795
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `ENTRY` = 56287;

DELETE FROM `smart_scripts` WHERE `entryorguid`=61297 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(61297, 0, 0, 0, 60, 0, 100, 0, 1000, 1000, 1000, 1000, 33, 61166, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'On summon - Give quest credit');