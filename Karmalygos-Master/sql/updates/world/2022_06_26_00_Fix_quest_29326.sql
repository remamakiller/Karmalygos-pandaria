DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=12991;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 12991, 0, 0, 0, 9, 0, 29326, 0, 0, 0, 0, 0, '', '');


update `creature_template` set `AIName`= 'SmartAI' where `entry`= 54313;

DELETE FROM `smart_scripts` WHERE `entryorguid`=54313 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54313, 0, 0, 1, 62, 0, 100, 0, 12991, 0, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 5338.04, -3484.76, 1569.77, 6.14916, 'Trall tp '),
(54313, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 54306, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Trall kc mision');
