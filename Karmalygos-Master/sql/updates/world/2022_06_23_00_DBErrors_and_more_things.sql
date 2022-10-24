-- Table `creature_template` lists creature (Entry: 46416) with disallowed `flags_extra` 1536, removing incorrect flag.
update `creature_template` set `flags_extra`= 0 where `entry`= 46416;

-- Quest 33026 has `ZoneOrSort` = -304 but `RequiredSkillId` does not have a corresponding value (185).
update `quest_template` set `RequiredSkillId`= 185 where `id` in (33026,33021,33020,33022,33024,33027,33107,33139);

-- Spell (id: 114741) have SPELL_EFFECT_QUEST_COMPLETE for quest 30470, but quest not have flag QUEST_SPECIAL_FLAGS_EXPLORATION_OR_EVENT. Quest flags must be fixed, quest modified to enable objective.
update `quest_template` set `SpecialFlags`= 3 where `id` in (30470,32640,32641);


-- Table `creature_queststarter`: Quest 31902 listed for entry 63596 does not exist.
-- A;adir la quest 31902


-- Table `creature_queststarter` has creature entry (64572) for quest 32863, but npcflag does not include UNIT_NPC_FLAG_QUESTGIVER
update `creature_template` set `npcflag`= npcflag | 2 where `entry` in (64572,66352,66412,66436,66442,66452,66478,66512,66515,66518,66520,66550,66551,66552,66553,66635,66636,66638,66639,66815,66819,66822);


-- npc_spellclick_spells: Creature template 69661 has UNIT_NPC_FLAG_SPELLCLICK but no data in spellclick table! Removing flag
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (39140, 73518, 0, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45005, 84071, 0, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (56682, 106614, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (59163, 114878, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69087, 137063, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69327, 136692, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69655, 137622, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69660, 137622, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69661, 137622, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69662, 137622, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69771, 138112, 0, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69774, 138112, 0, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69777, 138112, 0, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (69779, 138112, 0, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (70217, 139287, 1, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (72588, 145591, 0, 0);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (54499, 46598, 1, 0);


-- Table `areatrigger_involvedrelation` has record (id: 5482) for quest 14066, but quest does not have flag QUEST_SPECIAL_FLAGS_EXPLORATION_OR_EVENT. Trigger or quest flags must be fixed, quest modified to require objective.
update `quest_objective` set `objectId`= -1 where `questid` in (14066,27007,27152,29536,29539,13564,869,26512,27610,26930,25621,29415,29392);


-- Spell (Id: 65042, effIndex: 2) listed in `spell_target_position` does not have target TARGET_DEST_DB (17).
DELETE FROM `spell_target_position` WHERE `id` in (65042,100679,49986); 


-- Table 'creature_loot_template' entry 60491 (creature entry) does not exist but used as loot id in DB.
delete from `creature_loot_template` where `entry`= 60491;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 90839, 1,      1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 89317, 99.9727, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 87771, 0.1353, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85397, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85395, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85391, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85389, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85387, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85385, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85382, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85380, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85378, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85376, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85371, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85369, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85366, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85364, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85363, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85361, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85358, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85356, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85352, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85350, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85347, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85345, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85342, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85340, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85337, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85335, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85331, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85330, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85327, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85325, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85322, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85320, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85317, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85315, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85312, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85310, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85308, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85306, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85302, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85300, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85297, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85295, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85292, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85290, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85287, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 85285, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84986, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84985, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84984, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84983, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84982, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84981, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84980, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84979, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84978, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84977, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84976, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84975, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84974, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84973, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84972, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84960, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84959, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84958, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84957, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84956, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84955, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84954, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84953, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84952, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84951, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84950, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84949, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84948, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84947, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84946, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84892, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84891, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84890, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84889, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84888, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84887, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84886, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84847, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84846, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84845, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84844, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84843, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84842, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84841, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84840, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84839, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84838, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84837, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84836, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84835, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84834, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84833, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84832, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84831, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84830, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84829, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84828, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84827, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84826, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84825, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84824, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84823, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84822, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84821, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84820, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84819, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84818, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84817, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84816, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84815, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84814, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84813, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84812, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84811, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84810, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84809, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84808, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84807, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84806, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84805, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84804, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84803, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84802, 15, 1, 0, 1, 1     );
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)VALUES (60491, 84801, 15, 1, 0, 1, 1     );
delete from `creature_loot_template` where `entry`= 62346;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90840, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90456, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90455, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90454, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90453, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90452, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90451, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90450, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90449, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90448, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90447, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90446, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90445, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90444, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90443, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90442, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90441, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90440, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90439, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90438, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90437, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90436, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90435, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90434, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90433, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90432, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90431, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90430, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90429, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90425, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90424, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90423, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90422, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90421, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90420, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90419, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90418, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90417, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90416, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90415, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90414, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90413, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90412, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90411, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90410, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90409, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 90408, 15, 1, 0, 1, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (62346, 89783, 15, 1, 0, 1, 1);

-- Table 'creature_loot_template' entry 3869 isn't creature entry and not referenced from loot, and then useless.
update `creature_template` set `lootid`=  3869 where `entry`=  3869;
update `creature_template` set `lootid`= 35386 where `entry`= 35386;
update `creature_template` set `lootid`= 43687 where `entry`= 43687;
update `creature_template` set `lootid`= 58555 where `entry`= 58555;
update `creature_template` set `lootid`= 58569 where `entry`= 58569;
update `creature_template` set `lootid`= 58590 where `entry`= 58590;
update `creature_template` set `lootid`= 58605 where `entry`= 58605;
update `creature_template` set `lootid`= 58633 where `entry`= 58633;
update `creature_template` set `lootid`= 59746 where `entry`= 59746;
update `creature_template` set `lootid`= 65617 where `entry`= 65617;
update `creature_template` set `lootid`= 67304 where `entry`= 67304;
update `creature_template` set `lootid`= 68313 where `entry`= 68313;
update `creature_template` set `lootid`= 69570 where `entry`= 69570;
update `creature_template` set `lootid`= 70126 where `entry`= 70126;
update `creature_template` set `lootid`= 70246 where `entry`= 70246;
update `creature_template` set `lootid`= 70341 where `entry`= 70341;
update `creature_template` set `lootid`= 70448 where `entry`= 70448;
update `creature_template` set `lootid`= 71770 where `entry`= 71770;
update `creature_template` set `lootid`= 71771 where `entry`= 71771;
update `creature_template` set `lootid`= 71772 where `entry`= 71772;
update `creature_template` set `lootid`= 71773 where `entry`= 71773;
update `creature_template` set `lootid`= 72033 where `entry`= 72033;
update `creature_template` set `lootid`= 72412 where `entry`= 72412;
update `creature_template` set `lootid`= 72744 where `entry`= 72744;
update `creature_template` set `lootid`= 72791 where `entry`= 72791;
update `creature_template` set `lootid`= 72908 where `entry`= 72908;
update `creature_template` set `lootid`= 72929 where `entry`= 72929;
update `creature_template` set `lootid`= 72954 where `entry`= 72954;
update `creature_template` set `lootid`= 73012 where `entry`= 73012;
update `creature_template` set `lootid`= 73188 where `entry`= 73188;
update `creature_template` set `lootid`= 73414 where `entry`= 73414;
update `creature_template` set `lootid`= 73452 where `entry`= 73452;

-- Table `achievement_criteria_data` (Entry: 6803 Type: 0) has data for non-supported data type (12), ignored.
update `achievement_criteria_data` set `type`= 0 where `type`=12 and `criteria_id` in (6803,7315,7318,7319,7320,7361,7363,7579,7583,7587,7593,7598,12752,12976,12993);
update `achievement_criteria_data` set `type`= 28 where `type`=12 and `criteria_id` in (7590,11789);

-- Table gossip_menu_option for menu 12243, id 0 use non-existing action_poi_id   532, ignoring
DELETE FROM `points_of_interest` WHERE `entry`=532;
DELETE FROM `points_of_interest` WHERE `entry`=2518;
DELETE FROM `points_of_interest` WHERE `entry`=5212;
DELETE FROM `points_of_interest` WHERE `entry`=5213;
DELETE FROM `points_of_interest` WHERE `entry`=5214;
DELETE FROM `points_of_interest` WHERE `entry`=5215;
DELETE FROM `points_of_interest` WHERE `entry`=5216;
DELETE FROM `points_of_interest` WHERE `entry`=12517;
DELETE FROM `points_of_interest` WHERE `entry`=15218;
DELETE FROM `points_of_interest` WHERE `entry`=15219;
DELETE FROM `points_of_interest` WHERE `entry`=15220;
DELETE FROM `points_of_interest` WHERE `entry`=15221;
DELETE FROM `points_of_interest` WHERE `entry`=15222;
DELETE FROM `points_of_interest` WHERE `entry`=15223;
DELETE FROM `points_of_interest` WHERE `entry`=15224;
DELETE FROM `points_of_interest` WHERE `entry`=15225;
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (532, -8394.28, 560.927, 7, 99, 0, 'Stormwind Tram');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (2518, -8209.47, 428.528, 7, 99, 0, 'Stormwind Cataclysm Portals');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (5212, -9006.62, 869.36, 7, 99, 0, 'Stormwind Portal to Blasted Lands');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (5213, -9015.66, 874.699, 7, 99, 0, 'Stormwind Portal to Hellfire Peninsula');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (5214, -8198.92, 527.933, 7, 99, 0, 'Stormwind Portal to Paw\'don Village');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (5215, -8640.37, 1327.42, 7, 99, 0, 'Stormwind Ship to Rut\'theran Village');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (5216, -8300.32, 1400.95, 7, 99, 0, 'Stormwind Ship to Valiance Keep');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (12517, 2047.94, -4377.4, 7, 99, 0, 'Orgrimmar Cataclysm Portals');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15218, 1738.75, -4259.86, 7, 99, 0, 'Orgrimmar Zeppelin to Thunder Bluff');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15219, 1760.66, -4281.79, 7, 99, 0, 'Orgrimmar Zeppelin to Borean Tundra');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15220, 1843.47, -4393.98, 7, 99, 0, 'Orgrimmar Zeppelin to Tirisfal Glades');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15221, 1867.04, -4416.05, 7, 99, 0, 'Orgrimmar Zeppelin to Stranglethorn Vale');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15222, 2014.46, -4699.16, 7, 99, 0, 'Orgrimmar Portal to Honeydew Village');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15223, 1763.15, -4295.4, 7, 99, 0, 'Orgrimmar Portal to Dalaran');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15224, 1791.43, -4280.63, 7, 99, 0, 'Orgrimmar Portal to Hellfire Peninsula');
INSERT INTO `points_of_interest` (`entry`, `x`, `y`, `icon`, `flags`, `data`, `icon_name`) VALUES (15225, 1773.77, -4328.87, 7, 99, 0, 'Orgrimmar Portal to Blasted Lands');



-- Table `(game_event_)npc_vendor` for Vendor (Entry: 2795) have in item list non-existed item ( 138383, type 1), ignore
delete from `npc_vendor` where `item` in (147606,147608,147605,147607,
146643,146577,146576,146575,146574,146573,146572,146571,146570,146569,146568,147604,147601,147603,147602,146499,146501,146503,146505,146507,146509,146511,146513,146515,146517,146640,146439,146441,146443,146445,146447,146449,
146451,146453,146455,146457,146639,146499,146501,146503,146505,146507,146509,146511,146513,146515,146517,146640,146439,146441,146443,146445,146447,146449,146451,146453,146455,146457,146639,136377,
138383,138382,138384,138385,122341,122340,122339,122338,150743,150746,151614,151615,122668,122667,122666,122664,122663,122662,122388,122377,122376,122378,122375,122374,122373,122372,122360,122359,122358,122357,122356,122355,
122384,127010,122387,122383,122379,122380,122381,122382,122530,122371,122362,122361,122385,122389,122369,122367,122364,122354,122351,122350,122392,122391,122366,122352,122386,140773,122368,122365,122363,122353,122349,122390,
122341,122340,122339,122338,150744,150745,151614,151615,122662,122663,122664,122666,122667,122668,122355,122358,122359,122357,122372,122373,122374,122375,122376,122377,122378,122356,122360,122388,122379,122380,122382,122384,122383,122381,
122387,127010,122370,122361,122362,122530,122354,122364,122367,122369,122351,122350,122385,122389,122391,122392,122352,122366,122353,122363,122365,122368,122349,122386,140773,122390,136934,136935,136937,136938,138490,141059,
116392,138400,142322,142323,142324,151117,151118,151119,151120,151116,151117,151118,151119,151120,151116,124659,124658,124657,124656,124655,124654,124653,124652,124651,124650,124649,124648,124647,124646,124645,124642,142398,
126931,126930,126929,126928,126927,126926,126925,124674,124671,144410,120150,151117,151118,151119,151120,151116,151117,151118,151119,151120,151116,142322,142323,142324,146588,146589,146590,146591,146592,146593,146594,146595,146596,146597,146642);


-- Table `(game_event_)npc_vendor` have Item (Entry: 51460) with wrong ExtendedCost (5964) for vendor (69971), ignore
update `npc_vendor` set `ExtendedCost`= 0 where `ExtendedCost` in (5964,5963,5962,5966);

-- SmartAIMgr::LoadSmartAIFromDB: Creature entry 55381 has SmartAI scripts, but its AIName is not 'SmartAI'
update `creature_template` set `AIName`= 'SmartAI' where `entry` in (55381,55480,55667,55693,55770,55964,56013,56133,56180,56336,56340,56477,56478,73560,56782,58014,58015,58017,58360,58376,
58410,59138,59296,59395,59397,59401,59846,59899,59921,62261,64244,64249,64360,64362,64363,64364,66654,73556,73559);

DELETE FROM `smart_scripts` WHERE `source_type`=0 and `entryorguid` in (30007,30014,30017,30019,30020,30022,30023,55290,55556,55586,55786,55940,60042,61245,64267,64656,3871204);



delete from `creature` where `guid` in (
 5127632,
 5127633,
 5127634,
13231767,
13231768,
13231771,
13231772,
13231774,
13231777,
13231778,
13231779,
13231780,
13231781,
13231782,
13231783,
13231784,
13231785,
13231786,
13231787,
13231788,
13231789,
13231791,
13231792,
13231797,
13231798,
13231799,
13231800,
13231801,
13231802,
13231803,
13231804,
13231805,
13231806,
13231807,
13231808,
13231809,
13231810,
13231811,
13231812,
13231813,
13231814,
13231815,
13231816,
13231817,
13231818,
13231819,
13231820,
13231821,
13231822,
13231823,
13231824,
13231825,
13231826,
13231827,
13231828,
13231830,
13231831,
13231832,
13231833,
13231838,
13231839,
13231840,
13231841,
13231842,
13231843,
13231844,
13231845,
13231846,
13231847,
13231848,
13231849,
13231850,
13231851,
13231852,
13231853,
13231854,
13231856,
13231857,
13231858,
13231860,
13231861,
13231863,
13231865,
13231866,
13231868,
13231869,
13231870,
13231871,
13231872,
13231873,
13231874,
13231875,
13231876,
13231877,
13231878,
13231879,
13231880,
13231881,
13231882,
13231883,
13231884,
13231885,
13231886,
13231887,
13231888,
13231889,
13231890,
13231891,
13231892,
13231893,
13231894,
13231895,
13231896,
13231897,
13231898,
13231899,
13231900,
13231901,
13231902,
13231904,
13231905,
13231907,
13231908,
13231915,
13231916,
13231917,
13231918,
13231919,
13231920,
13231921,
13231922,
13231923,
13231924,
13231925,
13231926,
13231927,
13231928,
13231929,
13231930,
13231931,
13231932,
13231933,
13231934,
13231935,
13231936,
13231937,
13231938,
13231939,
13231941,
13231944,
13231945,
13231947,
13231948,
13231949,
13231951,
13231952,
13231953,
13231954,
13231955,
13231956,
13231957,
13231958,
13231959,
13231960,
13231961,
13231962,
13231963,
13231964,
13231965,
13231966,
13231967,
13231968,
13231969,
13231970,
13231971,
13231972,
13231973,
13231974,
13231975,
13231976,
13231977,
13231978,
13231979,
13231980,
13231981,
13231982,
13231983,
13231984,
13231985,
13231986,
13231987,
13231988,
13231989,
13231990,
13231991,
13231992,
13231993,
13231994,
13231995,
13231996,
13231997,
13231998,
13231999,
13232000,
13232001,
13232002,
13232003,
13232004,
13232005,
13232006,
13232007,
13232008,
13232009,
13232010,
13232012,
13232013,
13232014,
13232016,
13232017,
13232018,
13232020,
13232021,
13232022,
13232023,
13232024,
13232025,
13232027,
13232028);

set @CGUID := 582666;

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+0  , 64494, 870, 5785, 5876, 1, 1, 0, 0, 756.614, -1873.72, 61.5673, 4.88256, 300, 0, 0, 0, 156000, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+1  , 64493, 870, 5785, 5876, 1, 1, 0, 0, 760.465, -1874.6, 62.079, 4.10501, 300, 0, 0, 0, 156000, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+2  , 64491, 870, 5785, 5876, 1, 1, 0, 0, 762.159, -1881.31, 61.2975, 3.79085, 300, 0, 0, 0, 156000, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+3  , 57284, 870, 5805, 5992, 1, 1, 0, 0, 269.76, 681.798, 160.497, 2.44044, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+4  , 57284, 870, 5805, 5992, 1, 1, 0, 0, 274.584, 687.061, 160.511, 2.4208, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+5  , 57284, 870, 5805, 5992, 1, 1, 0, 0, 280.656, 692.359, 160.655, 2.52683, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+6  , 57284, 870, 5805, 5992, 1, 1, 0, 0, 289.282, 691.696, 160.585, 2.52683, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+7  , 57284, 870, 5805, 5992, 1, 1, 0, 0, 284.487, 686.264, 160.821, 2.63286, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+8  , 57284, 870, 5805, 5992, 1, 1, 0, 0, 279.144, 680.442, 160.695, 2.63852, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+9  , 57284, 870, 5805, 5992, 1, 1, 0, 0, 275.072, 676.863, 160.516, 2.58747, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+10 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 280.48, 671.054, 160.5, 2.46965, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+11 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 284.905, 675.277, 160.518, 2.45002, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+12 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 289.048, 680.812, 160.574, 2.42646, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+13 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 294.428, 686.821, 160.503, 2.5207, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+14 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 301.434, 687.632, 160.502, 2.8977, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+15 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 306.075, 680.885, 160.501, 3.49068, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+16 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 305.6, 672.896, 160.499, 3.58774, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+17 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 305.68, 665.963, 160.498, 3.05366, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+18 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 297.452, 666.394, 160.5, 2.95549, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+19 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 298.808, 672.838, 160.5, 3.10079, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+20 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 299.713, 679.815, 160.5, 2.82983, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+21 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 293.781, 676.159, 160.5, 2.81412, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+22 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 290.968, 668.199, 160.5, 2.60992, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+23 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 323.441, 678.494, 160.51, 0.238009, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+24 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 326.86, 679.33, 160.499, 0.198739, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+25 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 330.517, 679.812, 160.545, 0.253716, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+26 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 329.92, 682.656, 160.514, 3.34426, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+27 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 326.533, 682.301, 160.504, 3.32855, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+28 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 322.993, 681.349, 160.5, 3.37568, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+29 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 322.783, 684.231, 160.534, 0.198739, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+30 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 326.285, 685.068, 160.568, 0.183031, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+31 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 329.522, 685.531, 160.586, 0.183031, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+32 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 328.284, 688.205, 160.728, 3.40316, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+33 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 324.928, 687.786, 160.728, 3.40316, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+34 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 321.486, 686.911, 160.655, 3.39531, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+35 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 337.931, 686.759, 160.492, 6.03818, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+36 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 338.01, 684.165, 160.495, 0.615006, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+37 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 340.294, 681.706, 160.504, 0.834917, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+38 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 338.386, 681.576, 160.499, 0.650347, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+39 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 339.682, 680.322, 160.522, 0.964507, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+40 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 341.105, 680.195, 160.553, 0.937018, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+41 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 342.917, 680.205, 160.551, 0.925237, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+42 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 344.059, 680.522, 160.571, 2.29968, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+43 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 343.354, 681.772, 160.5, 2.16617, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+44 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 341.969, 681.402, 160.533, 2.09941, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+45 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 340.825, 682.58, 160.5, 2.21329, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+46 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 342.413, 683.439, 160.499, 2.31539, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+47 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 341.163, 685.092, 160.488, 2.18973, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+48 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 339.828, 684.141, 160.493, 2.18973, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+49 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 339.06, 685.506, 160.491, 2.11904, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+50 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 339.156, 687.549, 160.481, 2.02479, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+51 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 340.496, 686.25, 160.481, 5.54338, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+52 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 344.992, 684.577, 160.497, 0.654275, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+53 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 346.035, 683.293, 160.504, 0.273357, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+54 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 345.086, 681.98, 160.536, 4.45167, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+55 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 346.077, 685.535, 160.495, 2.45676, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+56 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 344.734, 687.17, 160.488, 2.69238, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+57 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 342.629, 687.954, 160.463, 2.928, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+58 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 340.037, 688.866, 160.453, 3.37175, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+59 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 353.746, 697.634, 162.071, 1.11765, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+60 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 361.064, 698.595, 161.462, 0.52468, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+61 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 360.917, 694.304, 161.646, 5.39021, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+62 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 360.2, 689.017, 162.216, 0.457883, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+63 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 366.714, 683.237, 161.628, 0.929112, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+64 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 370.329, 692.333, 161.817, 1.39642, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+65 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 366.982, 700.236, 161.804, 3.9529, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+66 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 372.733, 697.424, 162.136, 4.30241, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+67 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 370.959, 708.022, 162.139, 1.9737, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+68 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 376.654, 709.916, 161.883, 0.552126, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+69 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 364.577, 715.931, 162.135, 2.99079, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+70 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 371.446, 719.425, 161.529, 0.0573252, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+71 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 374.059, 722.933, 162.108, 5.84572, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+72 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 364.657, 730.524, 160.765, 1.72238, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+73 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 369.21, 732.471, 160.891, 2.02868, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+74 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 374.363, 733.824, 160.677, 1.97763, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+75 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 373.269, 738.674, 160.611, 2.07973, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+76 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 368.336, 736.507, 160.499, 3.57984, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+77 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 363.361, 734.581, 160.594, 3.53665, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+78 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 362.532, 738.82, 160.846, 0.505214, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+79 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 367.269, 740.866, 160.651, 0.465944, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+80 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 372.213, 742.249, 160.627, 0.336354, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+81 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 369.623, 745.751, 160.807, 3.36872, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+82 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 364.765, 744.401, 161.026, 3.53088, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+83 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 360.005, 742.394, 160.621, 3.60942, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+84 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 347.385, 757.927, 162.318, 3.09498, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+85 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 343.654, 763.815, 162.398, 2.83187, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+86 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 357.345, 765.824, 162.268, 5.97739, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+87 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 354.93, 771.838, 161.923, 2.05826, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+88 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 351.335, 772.215, 161.712, 3.01644, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+89 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 353.148, 776.304, 161.699, 3.0243, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+90 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 348.241, 778.981, 162.831, 3.22457, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+91 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 348.044, 784.82, 162.504, 2.49808, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+92 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 346.461, 791.082, 161.701, 2.78082, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+93 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 343.198, 786.766, 162.655, 1.85405, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+94 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 340.355, 793.048, 163.058, 1.67734, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+95 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 334.069, 794.742, 162.194, 1.95615, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+96 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 337.24, 798.975, 162.208, 2.03469, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+97 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 333.411, 798.844, 161.61, 4.47309, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+98 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 328.253, 795.832, 161.649, 4.06861, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+99 , 57284, 870, 5805, 5992, 1, 1, 0, 0, 327.6, 800.861, 162.06, 2.27005, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+100, 57284, 870, 5805, 5992, 1, 1, 0, 0, 321.522, 800.852, 162.594, 2.16009, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+101, 57284, 870, 5805, 5992, 1, 1, 0, 0, 326.131, 805.776, 163.074, 5.78863, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+102, 57284, 870, 5805, 5992, 1, 1, 0, 0, 329.937, 810.666, 162.498, 5.54909, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+103, 57284, 870, 5805, 6096, 1, 1, 0, 0, 333.649, 804.477, 162.959, 5.29384, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+104, 57284, 870, 5805, 5992, 1, 1, 0, 0, 338.449, 765.489, 162.275, 3.82907, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+105, 57284, 870, 5805, 5992, 1, 1, 0, 0, 340.04, 770.329, 162.369, 4.53201, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+106, 57284, 870, 5805, 5992, 1, 1, 0, 0, 335.073, 773.935, 162.509, 3.31464, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+107, 57284, 870, 5805, 5992, 1, 1, 0, 0, 328.734, 773.425, 163.05, 1.64959, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+108, 57284, 870, 5805, 5992, 1, 1, 0, 0, 321.966, 775.735, 162.155, 2.09334, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+109, 57284, 870, 5805, 5992, 1, 1, 0, 0, 325.974, 778.318, 161.587, 1.29224, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+110, 57284, 870, 5805, 5992, 1, 1, 0, 0, 322.092, 782.271, 162.442, 3.22432, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+111, 57284, 870, 5805, 5992, 1, 1, 0, 0, 316.167, 775.658, 162.434, 2.36823, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+112, 57284, 870, 5805, 5992, 1, 1, 0, 0, 318.199, 785.749, 161.706, 1.87343, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+113, 57284, 870, 5805, 5992, 1, 1, 0, 0, 314.459, 783.847, 161.925, 2.8434, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+114, 57284, 870, 5805, 5992, 1, 1, 0, 0, 315.162, 789.178, 162.834, 3.30286, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+115, 57284, 870, 5805, 5992, 1, 1, 0, 0, 311.103, 777.452, 162.491, 4.42989, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+116, 57284, 870, 5805, 5992, 1, 1, 0, 0, 305.638, 775.156, 162.173, 4.47309, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+117, 57284, 870, 5805, 5992, 1, 1, 0, 0, 303.026, 771.273, 161.595, 4.68122, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+118, 57284, 870, 5805, 5992, 1, 1, 0, 0, 298.641, 790.095, 160.441, 2.39178, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+119, 57284, 870, 5805, 5992, 1, 1, 0, 0, 301.668, 797.37, 160.163, 3.0135, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+120, 57284, 870, 5805, 5992, 1, 1, 0, 0, 297.78, 799.364, 159.628, 2.75825, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+121, 57284, 870, 5805, 5992, 1, 1, 0, 0, 296.07, 801.556, 159.223, 3.66931, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+122, 57284, 870, 5805, 5992, 1, 1, 0, 0, 293.482, 801.491, 159.222, 4.43902, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+123, 57284, 870, 5805, 5992, 1, 1, 0, 0, 288.547, 796.709, 160.153, 4.12485, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+124, 57284, 870, 5805, 5992, 1, 1, 0, 0, 294.361, 793.144, 160.279, 5.88414, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+125, 57284, 870, 5805, 5992, 1, 1, 0, 0, 285.134, 790.27, 160.095, 4.117, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+126, 57284, 870, 5805, 5992, 1, 1, 0, 0, 290.863, 787.869, 159.223, 5.21263, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+127, 57284, 870, 5805, 5992, 1, 1, 0, 0, 291.116, 784.988, 159.546, 4.83564, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+128, 57284, 870, 5805, 5992, 1, 1, 0, 0, 294.939, 783.732, 159.727, 5.99017, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+129, 57284, 870, 5805, 5992, 1, 1, 0, 0, 288.959, 777.851, 159.629, 3.86567, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+130, 57284, 870, 5805, 5992, 1, 1, 0, 0, 283.999, 781.715, 160.135, 6.11976, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+131, 57284, 870, 5805, 5992, 1, 1, 0, 0, 277.885, 786.536, 159.637, 2.66401, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+132, 57284, 870, 5805, 5992, 1, 1, 0, 0, 273.615, 780.508, 159.936, 4.15626, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+133, 57284, 870, 5805, 5992, 1, 1, 0, 0, 278.095, 776.792, 160.278, 5.59354, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+134, 57284, 870, 5805, 5992, 1, 1, 0, 0, 285.761, 772.935, 160.158, 5.76633, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+135, 57284, 870, 5805, 5992, 1, 1, 0, 0, 278.971, 766.256, 160.34, 3.95206, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+136, 57284, 870, 5805, 5992, 1, 1, 0, 0, 273.981, 770.406, 160.28, 2.3145, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+137, 57284, 870, 5805, 5992, 1, 1, 0, 0, 268.303, 775.816, 160.154, 2.35377, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+138, 57284, 870, 5805, 5992, 1, 1, 0, 0, 263.706, 769.873, 159.629, 4.19946, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+139, 57284, 870, 5805, 5992, 1, 1, 0, 0, 268.931, 765.662, 159.996, 5.64851, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+140, 57284, 870, 5805, 5992, 1, 1, 0, 0, 273.732, 762.411, 160.117, 5.18514, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+141, 57284, 870, 5805, 5992, 1, 1, 0, 0, 243.542, 794.581, 161.75, 3.01351, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+142, 57284, 870, 5805, 5992, 1, 1, 0, 0, 243.134, 799.078, 160.281, 6.15903, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+143, 57284, 870, 5805, 5992, 1, 1, 0, 0, 243.713, 810.712, 162.762, 1.38773, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+144, 57284, 870, 5805, 5992, 1, 1, 0, 0, 247.687, 816.378, 160.777, 0.559136, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+145, 57284, 870, 5805, 5992, 1, 1, 0, 0, 254.928, 823.359, 162.593, 0.555209, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+146, 57284, 870, 5805, 5992, 1, 1, 0, 0, 254.561, 811.817, 159.819, 4.73353, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+147, 57284, 870, 5805, 5992, 1, 1, 0, 0, 253.679, 807.339, 161.549, 4.83563, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+148, 57284, 870, 5805, 5992, 1, 1, 0, 0, 250.542, 802.627, 160.443, 4.89061, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+149, 57284, 870, 5805, 5992, 1, 1, 0, 0, 259.754, 732.182, 161.155, 4.21513, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+150, 57284, 870, 5805, 5992, 1, 1, 0, 0, 269.61, 728.576, 160.5, 0.197806, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+151, 57284, 870, 5805, 5992, 1, 1, 0, 0, 268.002, 744.481, 160.508, 1.60367, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+152, 57284, 870, 5805, 5992, 1, 1, 0, 0, 257.518, 743.784, 160.516, 5.7113, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+153, 57284, 870, 5805, 5992, 1, 1, 0, 0, 250.845, 723.219, 160.727, 3.62215, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+154, 57284, 870, 5805, 5992, 1, 1, 0, 0, 246.956, 717.326, 160.505, 3.60644, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+155, 57284, 870, 5805, 5992, 1, 1, 0, 0, 248.114, 713.142, 160.623, 3.41402, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+156, 57284, 870, 5805, 5992, 1, 1, 0, 0, 243.726, 720.544, 160.501, 0.519824, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+157, 57284, 870, 5805, 5992, 1, 1, 0, 0, 254.375, 715.711, 160.72, 5.80163, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+158, 57284, 870, 5805, 5992, 1, 1, 0, 0, 235.329, 725.034, 160.526, 1.33271, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+159, 57284, 870, 5805, 5992, 1, 1, 0, 0, 239.153, 725.997, 160.499, 0.786862, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+160, 57284, 870, 5805, 5992, 1, 1, 0, 0, 242.072, 728.148, 160.499, 1.80003, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+161, 57284, 870, 5805, 5992, 1, 1, 0, 0, 236.322, 729.641, 160.499, 2.06706, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+162, 57284, 870, 5805, 5992, 1, 1, 0, 0, 238.132, 735.653, 160.499, 1.56441, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+163, 57284, 870, 5805, 5992, 1, 1, 0, 0, 240.476, 737.872, 160.501, 1.48979, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+164, 57284, 870, 5805, 5992, 1, 1, 0, 0, 240.609, 741.317, 160.618, 2.00816, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+165, 57284, 870, 5805, 5992, 1, 1, 0, 0, 236.927, 740.551, 160.499, 1.79217, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+166, 57284, 870, 5805, 5992, 1, 1, 0, 0, 235.786, 743.949, 160.499, 1.08924, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+167, 57284, 870, 5805, 5992, 1, 1, 0, 0, 239.654, 745.521, 160.633, 1.20312, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+168, 57284, 870, 5805, 5992, 1, 1, 0, 0, 240.483, 749.881, 160.795, 1.66651, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+169, 57284, 870, 5805, 5992, 1, 1, 0, 0, 236.038, 750.038, 160.5, 2.44798, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+170, 57284, 870, 5805, 5992, 1, 1, 0, 0, 230.795, 748.171, 160.5, 2.26734, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+171, 57284, 870, 5805, 5992, 1, 1, 0, 0, 226.384, 751.362, 160.5, 1.66258, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+172, 57284, 870, 5805, 5992, 1, 1, 0, 0, 231.029, 754.754, 160.5, 0.511973, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+173, 57284, 870, 5805, 5992, 1, 1, 0, 0, 237.822, 755.329, 160.663, 0.244937, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+174, 57284, 870, 5805, 5992, 1, 1, 0, 0, 236.438, 760.315, 160.631, 1.7529, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+175, 57284, 870, 5805, 5992, 1, 1, 0, 0, 235.068, 763.69, 160.685, 2.5383, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+176, 57284, 870, 5805, 5992, 1, 1, 0, 0, 233.994, 767.669, 160.916, 2.57757, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+177, 57284, 870, 5805, 5992, 1, 1, 0, 0, 230.394, 769.592, 160.513, 2.9899, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+178, 57284, 870, 5805, 5992, 1, 1, 0, 0, 227.318, 773.131, 160.502, 3.1195, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+179, 57284, 870, 5805, 5992, 1, 1, 0, 0, 224.753, 769.673, 160.5, 4.64316, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+180, 57284, 870, 5805, 5992, 1, 1, 0, 0, 229.237, 765.226, 160.5, 5.09476, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+181, 57284, 870, 5805, 5992, 1, 1, 0, 0, 226.471, 761.464, 160.5, 4.50179, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+182, 57284, 870, 5805, 5992, 1, 1, 0, 0, 223.902, 758.609, 160.5, 3.91274, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+183, 57284, 870, 5805, 5992, 1, 1, 0, 0, 217.341, 760.254, 160.592, 3.3237, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+184, 57284, 870, 5805, 5992, 1, 1, 0, 0, 225.176, 764.673, 160.499, 5.37359, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+185, 57284, 870, 5805, 5992, 1, 1, 0, 0, 233.318, 757.154, 160.499, 5.15369, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+186, 57284, 870, 5805, 5992, 1, 1, 0, 0, 322.963, 667.563, 160.526, 5.76236, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+187, 57284, 870, 5805, 5992, 1, 1, 0, 0, 323.26, 663.374, 160.56, 5.62098, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+188, 57284, 870, 5805, 5992, 1, 1, 0, 0, 327.226, 661.25, 160.448, 6.02153, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+189, 57284, 870, 5805, 5992, 1, 1, 0, 0, 345.202, 664.608, 160.299, 0.288122, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+190, 57284, 870, 5805, 5992, 1, 1, 0, 0, 350.845, 668.199, 160.504, 0.877171, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+191, 57284, 870, 5805, 5992, 1, 1, 0, 0, 350.564, 672.242, 160.517, 0.480545, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+192, 57284, 870, 5805, 5992, 1, 1, 0, 0, 353.005, 675.5, 160.547, 0.205656, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+193, 57284, 870, 5805, 5992, 1, 1, 0, 0, 356.235, 673.15, 160.499, 4.99266, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+194, 57284, 870, 5805, 5992, 1, 1, 0, 0, 355.917, 668.493, 160.499, 4.46253, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+195, 57284, 870, 5805, 5992, 1, 1, 0, 0, 272.964, 800.87, 155.233, 1.31308, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+196, 57284, 870, 5805, 5992, 1, 1, 0, 0, 269.923, 808.216, 155.217, 1.25418, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+197, 57284, 870, 5805, 5992, 1, 1, 0, 0, 275.203, 805.485, 155.257, 5.27542, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+198, 57284, 870, 5805, 5992, 1, 1, 0, 0, 280.243, 803.838, 155.316, 1.04211, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+199, 57284, 870, 5805, 5992, 1, 1, 0, 0, 282.26, 809.247, 155.218, 2.18879, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+200, 57284, 870, 5805, 5992, 1, 1, 0, 0, 276.938, 811.526, 155.31, 2.95848, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+201, 57284, 870, 5805, 5992, 1, 1, 0, 0, 271.927, 813.202, 155.292, 2.66789, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+202, 57284, 870, 5805, 5992, 1, 1, 0, 0, 274.385, 819.456, 155.227, 1.16777, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+203, 57284, 870, 5805, 5992, 1, 1, 0, 0, 279.753, 816.9, 155.217, 5.90766, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+204, 57284, 870, 5805, 5992, 1, 1, 0, 0, 285.267, 814.382, 155.217, 5.8998, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+205, 57284, 870, 5805, 5992, 1, 1, 0, 0, 287.251, 820.635, 155.217, 1.2149, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+206, 57284, 870, 5805, 5992, 1, 1, 0, 0, 281.452, 821.709, 155.217, 2.98205, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+207, 57284, 870, 5805, 5992, 1, 1, 0, 0, 275.393, 823.819, 155.217, 2.80926, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+208, 57284, 870, 5805, 5992, 1, 1, 0, 0, 273.103, 830.589, 155.225, 6.0137, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+209, 57284, 870, 5805, 5992, 1, 1, 0, 0, 277.65, 829.11, 155.216, 5.97443, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+210, 57284, 870, 5805, 5992, 1, 1, 0, 0, 283.89, 827.412, 155.216, 6.00978, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+211, 57284, 870, 5805, 5992, 1, 1, 0, 0, 289.75, 825.467, 155.216, 6.07653, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+212, 57284, 870, 5805, 5992, 1, 1, 0, 0, 294.406, 824.485, 155.32, 6.10402, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+213, 57284, 870, 5805, 5992, 1, 1, 0, 0, 294.797, 830.354, 155.216, 2.87604, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+214, 57284, 870, 5805, 5992, 1, 1, 0, 0, 290.484, 830.889, 155.216, 3.00956, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+215, 57284, 870, 5805, 5992, 1, 1, 0, 0, 284.638, 832.716, 155.216, 2.85248, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+216, 57284, 870, 5805, 5992, 1, 1, 0, 0, 278.959, 834.703, 155.216, 2.86426, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+217, 57284, 870, 5805, 5992, 1, 1, 0, 0, 273.773, 836.078, 155.217, 2.86033, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+218, 57284, 870, 5805, 5992, 1, 1, 0, 0, 275.374, 841.765, 155.217, 5.87626, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+219, 57284, 870, 5805, 5992, 1, 1, 0, 0, 280.945, 839.855, 155.217, 6.00193, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+220, 57284, 870, 5805, 5992, 1, 1, 0, 0, 286.137, 838.085, 155.217, 5.93517, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+221, 57284, 870, 5805, 5992, 1, 1, 0, 0, 292.245, 836.6, 155.217, 6.06083, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+222, 57284, 870, 5805, 5992, 1, 1, 0, 0, 287.742, 844.079, 155.216, 2.83285, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+223, 57284, 870, 5805, 5992, 1, 1, 0, 0, 282.526, 846.025, 155.216, 2.85248, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+224, 57284, 870, 5805, 5992, 1, 1, 0, 0, 277.02, 847.487, 155.3, 2.83677, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+225, 57284, 870, 5805, 5992, 1, 1, 0, 0, 279.273, 853.427, 155.218, 5.93125, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+226, 57284, 870, 5805, 5992, 1, 1, 0, 0, 284.829, 851.463, 155.216, 5.89591, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (@CGUID+227, 57284, 870, 5805, 5992, 1, 1, 0, 0, 290.093, 849.332, 155.296, 5.95874, 300, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);


