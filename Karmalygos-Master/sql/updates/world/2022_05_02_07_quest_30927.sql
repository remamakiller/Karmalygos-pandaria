DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=62276;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (62276, 118952, 3, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid`=62276;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(62276, 0, 0, 1, 73, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spell Click - Set Flag'),
(62276, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

UPDATE `creature_template` SET `npcflag` = 16777216, `unit_flags` = 537166336, `unit_flags2` = 2049, `AIName` = 'SmartAI' WHERE `entry` = 62276;