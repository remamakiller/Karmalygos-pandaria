/*World of Warcraft Quest Guide Ashyo's Vision  ID 29577*/


UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 56113;
UPDATE `creature_template` SET `gossip_menu_id` = 56113 WHERE `entry` = 56113;


-- Clever Ashyo SAI
SET @ENTRY := 56113;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,56113,0,0,0,33,56113,0,0,0,0,0,7,0,0,0,0,0,0,0,"Kill Credit on Gossip");


DELETE FROM `gossip_menu_option` WHERE `menu_id`=56113;
INSERT INTO `gossip_menu_option`(`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES 
(56113, 0, 0, 'Go ahead and speak with the water Ashyo', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);

DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=56113;
INSERT INTO `locales_gossip_menu_option`(`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `option_text_loc9`, `option_text_loc10`, `option_text_loc11`, `option_text_female_loc1`, `option_text_female_loc2`, `option_text_female_loc3`, `option_text_female_loc4`, `option_text_female_loc5`, `option_text_female_loc6`, `option_text_female_loc7`, `option_text_female_loc8`, `option_text_female_loc9`, `option_text_female_loc10`, `option_text_female_loc11`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`, `box_text_loc9`, `box_text_loc10`, `box_text_loc11`, `box_text_female_loc1`, `box_text_female_loc2`, `box_text_female_loc3`, `box_text_female_loc4`, `box_text_female_loc5`, `box_text_female_loc6`, `box_text_female_loc7`, `box_text_female_loc8`, `box_text_female_loc9`, `box_text_female_loc10`, `box_text_female_loc11`) VALUES 
(56113, 0, NULL, NULL, NULL, NULL, NULL, 'Prosiga y hable con el agua Ashyo', 'Prosiga y hable con el agua Ashyo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=56113 AND `ConditionTypeOrReference`=9;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 56113, 0, 0, 0, 9, 0, 29577, 0, 0, 0, 0, 0, '', 'Only See Gossip on Quest 29577');
