-- 31022
UPDATE `gameobject_template` SET `AIName`= 'SmartGameObjectAI' WHERE `ENTRY` = 212933;

DELETE FROM `smart_scripts` WHERE `entryorguid`=212933 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(212933, 1, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 33, 63286, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(212933, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 63287, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_questender` WHERE `id`=62180 AND `quest`=31022;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES 
(62180, 31022);

-- 31260
update `creature_loot_template` set `ChanceOrQuestChance`= -100 where `entry`= 63767 and `item`= 85774;


-- 30128 - 30347
UPDATE `creature` SET `spawntimesecs`= 30 WHERE `guid` = 517863;

UPDATE `creature_template` SET `dmg_multiplier`= 1 WHERE `entry` = 58419;


-- 29984 OscarXXX
UPDATE `gameobject` SET `state`= 1 WHERE `guid` = 512015;

UPDATE `gameobject_template` SET `data2`= 1000 WHERE `entry` = 209993;

UPDATE `gameobject_template` SET `AIName`= 'SmartGameObjectAI' WHERE `ENTRY` = 209993;

DELETE FROM `smart_scripts` WHERE `entryorguid`=209993 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(209993, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56738, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'kc bambu banco');
