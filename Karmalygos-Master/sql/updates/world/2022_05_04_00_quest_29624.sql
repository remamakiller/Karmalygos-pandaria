UPDATE `creature_template_addon` SET `auras` = '103079' WHERE `entry` IN (55183, 55184);
UPDATE `creature_template` SET `ScriptName` = 'npc_instructor_xann' WHERE `entry` = 54917;
UPDATE `creature_template` SET `ScriptName` = 'npc_bag_training_55183', `unit_flags` = 4, `unit_flags2` = 0 WHERE `entry` = 55183;
UPDATE `creature_template` SET `ScriptName` = 'npc_bag_training_55184' WHERE `entry` = 55184;
UPDATE `creature` SET `position_x` = 2332.83, `position_y` = -1453.62, `position_z` = 362.261, `orientation` = 0.19124 WHERE `id` = 54917;    

DELETE FROM `creature_text` WHERE `entry`=54917 AND `groupid` >= 1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(54917, 1, 0, 'LEFT!', '', 0, 42, 0, 100, 0, 0, 0, 53511, ''),
(54917, 2, 0, 'RIGHT!', '', 0, 42, 0, 100, 0, 0, 0, 53512, ''),
(54917, 3, 0, 'I will yell out commands for "Left" and "Right". Pay close attention', '', 0, 12, 0, 100, 0, 0, 0, 53582, '');