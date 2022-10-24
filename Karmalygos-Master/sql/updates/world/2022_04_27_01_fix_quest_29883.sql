DELETE FROM `gossip_menu_option` WHERE `menu_id` in (13250,13281,13510,13509);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`) VALUES
(13250, 0, 0, 'He traído los objetos para la ceremonia.', 55031, 1, 1),
(13250, 1, 0, 'Vengo de la Alianza. Queremos ser sus aliados, no sus enemigos.', 58051, 1, 1),
(13510, 0, 0, 'Mis amigos y yo venimos en son de paz.', 58050, 1, 1),
(13281, 0, 1, 'Deja que eche un vistazo a tus mercancías.', 67573, 3, 128),
(13281, 1, 0, '¿Qué estás haciendo?', 58049, 1, 1),
(13509, 0, 0, 'Danos una oportunidad para demostrar nuestra amistad. No les deseamos ningún mal.', 58048, 1, 1);

DELETE FROM `gossip_menu` WHERE `entry` in (13250,13281,13510,13509);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(13250, 19305), -- 54960
(13250, 19280), -- 54960
(13250, 18684), -- 54960
(13281, 18777), -- 56693
(13510, 19255), -- 56690
(13509, 19924); -- 59058


update `creature_template` set `gossip_menu_id`= 13250, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 54960;
update `creature_template` set `gossip_menu_id`= 13510, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 56690;
update `creature_template` set `gossip_menu_id`= 13281, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 56693;
update `creature_template` set `gossip_menu_id`= 13509, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 59058;

DELETE FROM `smart_scripts` WHERE `entryorguid`=54960 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54960, 0, 0, 1, 62, 0, 100, 0, 13250, 1, 0, 0, 33, 54960, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54960, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54960, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56690 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56690, 0, 0, 1, 62, 0, 100, 0, 13510, 0, 0, 0, 33, 56690, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56690, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56690, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56693 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56693, 0, 0, 1, 62, 0, 100, 0, 13281, 1, 0, 0, 33, 56693, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56693, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56693, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=59058 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59058, 0, 0, 1, 62, 0, 100, 0, 13509, 0, 0, 0, 33, 59058, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(59058, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(59058, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_text` WHERE `Entry`=56693;
DELETE FROM `creature_text` WHERE `Entry`=59058;
DELETE FROM `creature_text` WHERE `Entry`=56690;
DELETE FROM `creature_text` WHERE `Entry`=54960;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `comment`) VALUES 
(56693, 0, 0, 'Ah, you must be the outsider. Sadly, I am making weapons for war. Once, not long ago, I made instruments for prayer and celebration. It is this war that makes everyone stand on edge.', 12, 0, 100, 0, 0, 0, 58057, 'От-Теммдо to Player'),
(59058, 0, 0, 'You brought back the instruments just in time, $n. The Elder is ready to perform the waterspeaking ceremony.', 12, 0, 100, 0, 0, 0, 58104, 'Хранитель жемчужин Фуцзинь to Player'),
(59058, 1, 0, 'No harm? Pah! Many thousand years ago, the Pearlfin Tribe stood on the throne of all Pandaria. Now, this village is all that is left of our people, all because we trusted a tribe of outsiders... the hozen.', 12, 0, 100, 0, 0, 0, 58055, 'Хранитель жемчужин Фуцзинь to Player'),
(56690, 0, 0, 'Action speaks louder than intent, stranger. My warriors intend to seek retribution, but only practice will make it so. Now go away. We are busy.', 12, 0, 100, 0, 0, 0, 58063, 'Инструктор Острый Гребень to Player'),
(56690, 1, 0, 'STRIKE!', 14, 0, 100, 36, 0, 0, 55609, 'Инструктор Острый Гребень'),
(54960, 0, 0, 'Stranger, have you ever seen a stone fall into a calm lake? Every action creates a ripple, even accepting a pledge of friendship. I shall think upon your request.', 12, 0, 100, 0, 0, 0, 58066, 'Старейшина Лушань to Player'),
(54960, 1, 0, 'Today, our friendship is cemented with the Alliance! Today, we go forth as brothers and sisters. To our new future!', 12, 0, 100, 0, 0, 0, 58231, 'Старейшина Лушань to Player');
