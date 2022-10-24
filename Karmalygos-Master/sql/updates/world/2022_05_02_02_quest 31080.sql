DELETE FROM `smart_scripts` WHERE `entryorguid`=62764 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=6276400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(62764, 0, 0, 1, 73, 0, 100, 1, 0, 0, 0, 0, 89, 20, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On spellclick - Random move'),
(62764, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 6000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');
