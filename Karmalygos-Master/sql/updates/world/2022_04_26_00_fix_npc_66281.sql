-- Fixxul Lonelyheart
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=66281;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(66281,0,0,0,0,0,100,0,0,0,3400,4700,11,12471,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(66281,0,1,0,0,0,100,1,1000,1000,1000,1000,11,131488,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Summon Imp');

