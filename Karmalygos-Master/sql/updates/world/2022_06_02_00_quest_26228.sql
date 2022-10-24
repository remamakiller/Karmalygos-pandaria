DELETE FROM `smart_scripts` WHERE `entryorguid`=42492 AND `source_type`=0;


update `creature_template` set `ScriptName`= 'npc_crate_mine' where `entry`= 42500;

update `creature_template` set `AIName`= '' where `entry`in (42492,34867);


DELETE FROM `creature_text` WHERE `entry`=42492;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(42492, 0, 0, 'What little human want? Why you call Glubtok?           ', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42492, 1, 0, 'Glubtok crash you!                                      ', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42492, 2, 0, 'What is option two.                                     ', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42492, 3, 0, 'So Glubtok have two choices die or be rich and powerful?', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42492, 4, 0, 'Glubtok take choice two.                                ', '', 0, 12, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_text` WHERE `entry`=42515;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(42515, 0, 0, 'Sad... Is this the life that you had hoped for, Glubtok? Running two bit extortion operations out of a cave?', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42515, 1, 0, 'Oh will you? Do you dare cross that line and risk your life?                                                ', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42515, 2, 0, 'You may attempt to kill me - and fail - or you make take option two.                                        ', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42515, 3, 0, 'You join me and I shower wealth and power upon you.                                                         ', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42515, 4, 0, 'I thought you\'d see it my way.                                                                              ', '', 0, 12, 0, 0, 0, 0, 0, 0, ''),
(42515, 5, 0, 'I will call you when the dawning is upon us.                                                                ', '', 0, 12, 0, 0, 0, 0, 0, 0, '');

