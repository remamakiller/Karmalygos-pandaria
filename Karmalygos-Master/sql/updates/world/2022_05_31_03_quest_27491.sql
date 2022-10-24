update `creature_template` set `AIName`= 'SmartAI' where `entry` in (45947,45877);

DELETE FROM `smart_scripts` WHERE `entryorguid`=45947 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(45947, 0, 0, 1, 62, 0, 100, 0, 12067, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Jon-Jon Cuellodúctil  - On gossip option select - Close gossip'),
(45947, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 45902, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Type a script description here.'),
(45947, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 12, 45942, 1, 60000, 0, 0, 0, 8, 0, 0, 0, -4830.15, -4842.72, 197.4, 4.68, 'Invoca 1 wind raider'),
(45947, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 12, 45942, 1, 60000, 0, 0, 0, 8, 0, 0, 0, -4827.96, -4843.52, 197.31, 4.68, 'Invoca 1 wind raider'),
(45947, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 12, 45942, 1, 60000, 0, 0, 0, 8, 0, 0, 0, -4826.17, -4843.97, 197.1, 4.68, 'Invoca 1 wind raider'),
(45947, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 12, 45942, 1, 60000, 0, 0, 0, 8, 0, 0, 0, -4832.66, -4842.42, 197.37, 4.68, 'Invoca 1 wind raider'),
(45947, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 12, 45942, 1, 60000, 0, 0, 0, 8, 0, 0, 0, -4834.46, -4842.79, 197.08, 4.68, 'Invoca 1 wind raider'),

(45947, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 45877, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'hack fix');


DELETE FROM `smart_scripts` WHERE `entryorguid`=45877 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(45877, 0, 0, 0, 10, 0, 100, 0, 1, 10, 1000, 1000, 33, 45877, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Killcredit');

