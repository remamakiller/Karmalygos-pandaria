delete from `creature` where `id` in (47427,51552,47422);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName`= '' WHERE `entry` in (47427);
UPDATE `creature_template` SET `AIName` = '', `ScriptName`= 'npc_baited_black_drake_spellclick' WHERE `entry`= 47422;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`= 'npc_baited_black_drake_vehicle' WHERE `entry`= 51552;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=47422;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(47422, 95722, 1, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid`=47427 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(47427, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 11, 88463, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '');

