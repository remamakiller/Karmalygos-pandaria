DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=13468 AND `SourceEntry`=0 AND `SourceId`=0 AND `ElseGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 13468, 0, 0, 0, 9, 0, 30269, 0, 0, 0, 0, 0, '', '');

DELETE FROM `gossip_menu_option` WHERE `Menu_ID`=13468;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `OptionBroadcastTextID`, `BoxBroadcastTextID`) VALUES 
(13468, 0, 0, 'I\'m ready, Koro.', 1, 1, 0, 0, 0, 0, NULL, 57913, 0);

DELETE FROM `waypoints` WHERE `entry`=58547;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 1, -1443.15, 866.02, 17.88, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 2, -1388.03, 891.19, 18.75, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 3, -1313.56, 893.25, 15.51, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 4, -1251.91, 894.61, 17.09, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 5, -1230.98, 941.83, 17.16, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 6, -1222.31, 973.51, 18.75, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 7, -1197.82, 982.56, 20.29, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 8, -1163.64, 1044.76, 21.9, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=58547 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58547, 0, 0, 0, 62, 0, 100, 0, 13468, 0, 0, 0, 12, 58547, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Say text 0'),
(58547, 0, 1, 2, 54, 0, 100, 0, 0, 0, 0, 0, 1, 0, 6500, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Say text 0'),
(58547, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Close gossip'),
(58547, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set flag'),
(58547, 0, 4, 0, 52, 0, 100, 0, 0, 58547, 0, 0, 53, 1, 58547, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'After emote - Start WP'),
(58547, 0, 5, 6, 40, 0, 100, 0, 7, 58547, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP - Say text 1'),
(58547, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 58946, 0, 0, 0, 0, 0, 18, 25, 0, 0, 0, 0, 0, 0, 'Link - Give credit'),
(58547, 0, 7, 0, 40, 0, 100, 0, 8, 58547, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On wp reach - despawn');


update `creature_template` set `npcflag`= 3, `AIName`= 'SmartAI' where `entry` in (58547);

