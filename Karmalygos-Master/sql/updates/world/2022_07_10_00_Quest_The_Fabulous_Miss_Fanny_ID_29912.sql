/*World of Warcraft Quest Guide The Fabulous Miss Fanny  ID 29912*/
/*
ID - 105511 Lanzar naba
ID - 105513 Lanzar naba

ID - 105519 Lanzar sandía
ID - 105301 Lanzar sandía

ID - 105503 Lanzar tofu hiperpicante
ID - 105504 Lanzar tofu hiperpicante
ID - 105471 Lanzar tofu hiperpicante

ID - 105508 Invocar a la señorita Fanny*/

-- Pang Thunderfoot SAI
SET @ENTRY := 56204;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,29912,0,0,0,12,56192,2,300000,0,0,0,8,0,0,0,532.49,-579.96,258.38,4.23,"Summon Miss Fanny On QuestAccept 29912");

-- Miss Fanny SAI
SET @ENTRY := 56192;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,56192,0,0,0,33,56230,0,0,0,0,0,21,10,0,0,0,0,0,0,"Naba KillCredit On Gossip"),
(@ENTRY,0,1,0,62,0,100,0,56192,1,0,0,33,56229,0,0,0,0,0,21,10,0,0,0,0,0,0,"Watermelon KillCredit On Gossip"),
(@ENTRY,0,2,0,62,0,100,0,56192,2,0,0,33,55375,0,0,0,0,0,21,10,0,0,0,0,0,0,"Tofu KillCredit On Gossip");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=56192 AND `ConditionTypeOrReference`=2;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 56192, 0, 0, 0, 2, 0, 75259, 1, 0, 0, 0, 0, '', 'Only See Gossip on Take Item 1 Quest 29912'),
(15, 56192, 1, 0, 0, 2, 0, 75258, 1, 0, 0, 0, 0, '', 'Only See Gossip on Take Item 2 Quest 29912'),
(15, 56192, 2, 0, 0, 2, 0, 75256, 1, 0, 0, 0, 0, '', 'Only See Gossip on Take Item 3 Quest 29912');

UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 56192;
UPDATE `creature_template` SET `gossip_menu_id` = 56192 WHERE `entry` = 56192;
UPDATE `creature_template` SET `unit_flags` = 262148 WHERE `entry` = 56192;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=56192;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES 
(56192, 0, 0, 'Le Gustaria que la Señorita Fanny lance una Naba', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0),
(56192, 1, 0, 'Le Gustaria que la Señorita Fanny lance una Sandia', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0),
(56192, 2, 0, 'Le Gustaria que la Señorita Fanny lance Tofu Hiperpicante', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);






