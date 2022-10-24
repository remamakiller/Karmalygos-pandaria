update `creature_template` set `AIName`= 'SmartAI' where `entry` in (59392,57242);
update `creature_template` set `npcflag`= 1 where `entry` in (59392);


DELETE FROM `smart_scripts` WHERE `entryorguid`=57242 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(57242, 0, 0, 1, 62, 0, 100, 0, 13324, 0, 0, 0, 33, 57290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Give quest credit'),
(57242, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 920.04, -2613.55, 185.12, 4.5, 'Link - tele invoker');

DELETE FROM `smart_scripts` WHERE `entryorguid`=59392 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59392, 0, 0, 0, 62, 0, 100, 0, 13550, 1, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1001.24, -2388.14, 168.59, 5.7, 'On gossip select - tele invoker');


delete from `gossip_menu_option` where `Menu_ID` in (13324);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `OptionBroadcastTextID`, `BoxBroadcastTextID`) VALUES 
(13324, 0, 0, 'I have a message for the Jade Serpent.', 1, 1, 0, 0, 0, 0, NULL, 56092, 0);

