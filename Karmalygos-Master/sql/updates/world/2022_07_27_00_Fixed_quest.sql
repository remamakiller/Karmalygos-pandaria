-- 31091
update `creature_template` set `AIName`= 'SmartAI' where `entry`= 63876;

DELETE FROM `smart_scripts` WHERE `entryorguid`=63876 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(63876, 0, 0, 1, 19, 0, 100, 0, 31091, 0, 0, 0, 33, 64013, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Give credit near player'),
(63876, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 62542, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Give credit near player');

-- 31441 
update `creature_template` set `faction_H`= 14, `faction_A`= 14 where `entry`= 64583;

DELETE FROM `creature_questender` WHERE `id`=64672 AND `quest`=31441;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (64672, 31441);


-- 31378 
DELETE FROM `creature_queststarter` WHERE `id`=64032 AND `quest`=31378;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (64032, 31378);

DELETE FROM `creature_questender` WHERE `id`=60506 AND `quest`=31378;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (60506, 31378);

-- 31606 
update `creature_template` set `npcflag`= 16777216 where `entry` = 62601;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=62601 AND `spell_id`=122171;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(62601, 122171, 1, 0);

-- 29919
DELETE FROM `smart_scripts` WHERE `entryorguid`=56133 AND `source_type`=0 AND `id`=3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56133, 0, 3, 0, 19, 0, 100, 0, 29919, 0, 0, 0, 33, 56571, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');


-- 30627
update `creature_template` set `AIName`= 'SmartAI' where `entry`= 59856;

DELETE FROM `smart_scripts` WHERE `entryorguid`=59856 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59856, 0, 0, 0, 19, 0, 100, 0, 30627, 0, 0, 0, 33, 56703, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

-- 32400 32401
update `creature_template` set `AIName`= 'SmartAI' where `entry`= 68939;

DELETE FROM `smart_scripts` WHERE `entryorguid`=68939 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(68939, 0, 0, 0, 10, 0, 100, 0, 1, 5, 1000, 1000, 33, 68748, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(68939, 0, 1, 2, 19, 0, 100, 0, 32401, 0, 0, 0, 33, 68936, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(68939, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 68873, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

update `creature_template` set `faction_H`= 35, `faction_A`= 35 where `entry`= 68955;



