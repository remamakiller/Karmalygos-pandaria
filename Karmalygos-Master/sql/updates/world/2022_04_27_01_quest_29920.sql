UPDATE `creature_template` SET `ScriptName` = '' where `entry` IN (56206, 56209, 56210);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (56206, 56209, 56210);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56206, 0, 0, 1, 62, 0, 100, 0, 13225, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Say Text 0'),
(56206, 0, 1, 5, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set Faction 14'),
(56206, 0, 2, 3, 2, 0, 100, 0, 1, 10, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'HP 10% - Set Faction 35'),
(56206, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Say Text 1'),
(56206, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56206, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(56206, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Attack Invoker'),
(56206, 0, 6, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 113504, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56206, 0, 7, 0, 0, 0, 100, 0, 4000, 4000, 4000, 4000, 11, 109497, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56206, 0, 8, 0, 11, 0, 100, 1, 0, 0, 0, 0, 42, 0, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn - Set Invincibility Hp 5%'),
(56210, 0, 0, 1, 62, 0, 100, 0, 13227, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Say Text 0'),
(56210, 0, 1, 5, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set Faction 14'),
(56210, 0, 2, 3, 2, 0, 100, 0, 1, 10, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'HP 10% - Set Faction 35'),
(56210, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Say Text 1'),
(56210, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56210, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(56210, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Attack Invoker'),
(56210, 0, 6, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 105091, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56210, 0, 7, 0, 0, 0, 100, 0, 4000, 4000, 4000, 4000, 11, 104909, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56210, 0, 8, 0, 11, 0, 100, 1, 0, 0, 0, 0, 42, 0, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn - Set Invincibility Hp 5%'),
(56209, 0, 0, 1, 62, 0, 100, 0, 13226, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Say Text 0'),
(56209, 0, 1, 5, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set Faction 14'),
(56209, 0, 2, 3, 2, 0, 100, 0, 1, 10, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'HP 10% - Set Faction 35'),
(56209, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Say Text 1'),
(56209, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56209, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(56209, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Attack Invoker'),
(56209, 0, 6, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 17207, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56209, 0, 7, 0, 0, 0, 100, 0, 4000, 4000, 4000, 4000, 11, 106763, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56209, 0, 8, 0, 11, 0, 100, 1, 0, 0, 0, 0, 42, 0, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn - Set Invincibility Hp 5%');

DELETE FROM `conditions` WHERE `SourceGroup`  IN (13225, 13226, 13227);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 13225, 0, 0, 0, 9, 0, 29920, 0, 0, 0, 0, '', 'Show gossip option if Player has Quest 29920 taken'),
(15, 13226, 0, 0, 0, 9, 0, 29920, 0, 0, 0, 0, '', 'Show gossip option if Player has Quest 29920 taken'),
(15, 13227, 0, 0, 0, 9, 0, 29920, 0, 0, 0, 0, '', 'Show gossip option if Player has Quest 29920 taken');