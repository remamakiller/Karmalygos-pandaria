DELETE FROM `conditions` WHERE `SourceEntry`=56464;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 56464, 0, 0, 9, 0, 29929, 0, 0, 0, 0, '', 'SAI if have Quest 29929');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56464;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56464, 0, 0, 1, 64, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On GossipHello - Talk'),
(56464, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56464, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Talk - Kcredit'),
(56464, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 15, 211771, 5, 0, 0, 0, 0, 0, 'On Kc - Act GOB'),
(56464, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Act GOB - Despawn');

DELETE FROM `creature_text` WHERE `Entry`=56464;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `text_female`, `TextRange`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `comment`) VALUES 
(56464, 0, 3, 'Woah... get away from me, crazy... spider-thing!', '', 0, 12, 0, 100, 0, 0, 0, 55141, ''),
(56464, 0, 2, 'Oh, I was just resting... I rest sometimes... under rocks...', '', 0, 12, 0, 100, 0, 0, 0, 55186, ''),
(56464, 0, 1, 'Much obliged, stranger.', '', 0, 12, 0, 100, 0, 0, 0, 55181, ''),
(56464, 0, 0, 'Ahh, get these things away from me!', '', 0, 12, 0, 100, 0, 0, 0, 55144, ''),
(56464, 0, 4, 'Oof, that\'s better... How\'s my hair?', '', 0, 12, 0, 100, 0, 0, 0, 55182, '');

