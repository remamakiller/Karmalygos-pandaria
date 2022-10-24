/*Fix NPC not selectable with imcomplete SAI and aura incorrect*/

UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` IN (16968);

DELETE FROM `creature_template_addon` WHERE `entry` IN (16968);
INSERT INTO `creature_template_addon`(`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(16968, 0, 0, 0, 1, 0, '');

-- Tunneler SAI
SET @ENTRY := 16968;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cast Sandworm Submerge Visual OOC"),
(@ENTRY,0,1,0,1,0,100,1,0,0,0,0,11,33928,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cast Tunnel Bore Passive OOC"),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Set Phase 1 on Aggro"),
(@ENTRY,0,3,0,4,1,100,1,0,0,0,0,28,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,"Remove Sandworm Submerge Visual on Aggro"),
(@ENTRY,0,4,0,4,1,100,1,0,0,0,0,28,33928,0,0,0,0,0,1,0,0,0,0,0,0,0,"Remove Tunnel Bore Passive on Aggro"),
(@ENTRY,0,5,0,4,1,100,1,0,0,0,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cast Poison on Aggro"),
(@ENTRY,0,6,0,4,1,100,1,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,"Change Flag for attack on Aggro"),
(@ENTRY,0,7,0,9,1,100,0,0,50,2100,4500,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cast Poison"),
(@ENTRY,0,8,0,9,1,100,0,0,50,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stop Moving when in Poison Range"),
(@ENTRY,0,9,0,7,1,100,1,0,0,0,0,11,33928,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cast Tunnel Bore Passive on Evade"),
(@ENTRY,0,10,0,7,1,100,1,0,0,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cast Sandworm Submerge Visual on Evade"),
(@ENTRY,0,11,0,7,1,100,1,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,"Change Flag on Evade"),
(@ENTRY,0,12,0,9,1,100,0,0,50,20000,22000,11,32738,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cast Bore on Close"),
(@ENTRY,0,13,0,2,1,100,1,0,30,0,0,11,32714,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cast Enrage at 30% HP");

