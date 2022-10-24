DELETE FROM `spell_script_names` WHERE `spell_id`=66914;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (66914, 'spell_gilneas_prison_periodic_dummy');

UPDATE `creature_template` SET `ScriptName` = 'npc_lord_darius_crowley_35077' WHERE `entry` = 35077;
UPDATE `creature_template` SET `ScriptName` = 'npc_tobias_mistmantle_35124' WHERE `entry` = 35124;
UPDATE `creature_template` SET `ScriptName` = 'npc_worgen_runt_35188' WHERE `entry` = 35188;
UPDATE `creature_template` SET `ScriptName` = 'npc_worgen_runt_35456' WHERE `entry` = 35456;
UPDATE `creature_template` SET `ScriptName` = 'npc_worgen_alpha_35170' WHERE `entry` = 35170;
UPDATE `creature_template` SET `ScriptName` = 'npc_worgen_alpha_35167' WHERE `entry` = 35167;
UPDATE `creature_template` SET `ScriptName` = 'npc_king_genn_greymane_35112' WHERE `entry` = 35112;
UPDATE `creature_template` SET `ScriptName` = 'npc_lord_godfrey_35115' WHERE `entry` = 35115;
UPDATE `creature_template` SET `ScriptName` = 'npc_bloodfang_worgen_35118' WHERE `entry` = 35118;