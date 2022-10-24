-- 30078
update `creature_template` set `faction_H`= 14, `faction_A`= 14 where `entry`= 58017;

update `creature_template` set `npcflag`= 3 where `entry`= 61371;

-- 30944 
update `creature_template` set `npcflag`= 3 where `entry`= 61417;
update `creature_template` set `npcflag`= 1, `AIName`= 'SmartAI', `gossip_menu_id`= 14305 where `entry` in (61381,61417,61554);

DELETE FROM `smart_scripts` WHERE `entryorguid` in (61554,61381,61417) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(61554, 0, 0, 0, 62, 0, 100, 1, 14305, 0, 0, 0, 80, 6155400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Run Script'),
(61381, 0, 0, 0, 62, 0, 100, 1, 14305, 0, 0, 0, 80, 6155400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Run Script'),
(61417, 0, 0, 0, 62, 0, 100, 1, 14305, 0, 0, 0, 80, 6155400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Run Script');

DELETE FROM `smart_scripts` WHERE `entryorguid`=6155400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(6155400, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Set Npc Flag 0'),
(6155400, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Gossip Close'),
(6155400, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 33, 61381, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(6155400, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Talk Random Text'),
(6155400, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 4000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

-- 31011 
DELETE FROM `creature_questender` WHERE `id`=61371 AND `quest`=31011;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES 
(61371, 31011);

-- 30148 
update `creature_template` set `AIName`= 'SmartAI' where `entry`= 58416;

DELETE FROM `smart_scripts` WHERE `entryorguid`=58416 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58416, 0, 0, 2, 8, 0, 100, 0, 102694, 0, 0, 0, 33, 58417, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On spellhit - Give credit'),
(58416, 0, 1, 2, 8, 0, 100, 0, 102695, 0, 0, 0, 33, 58417, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On spellhit - Give credit'),
(58416, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

-- 30240 30242 
update `creature_template` set `AIName`= 'SmartAI' where `entry`= 58743;

DELETE FROM `smart_scripts` WHERE `entryorguid`=58743 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58743, 0, 0, 0, 19, 0, 100, 0, 30240, 0, 0, 0, 33, 58967, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(58743, 0, 1, 0, 19, 0, 100, 0, 30242, 0, 0, 0, 33, 64895, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 31709
update `creature_template` set `AIName`= '' where `entry`= 58508;

-- 31078
update `creature_template` set `npcflag`= 1, `AIName`= 'SmartAI' where `entry`= 62776;

DELETE FROM `smart_scripts` WHERE `entryorguid`=62776 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(62776, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 33, 62776, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(62776, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');