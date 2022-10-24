update `creature_template` set `unit_class`= 1 where `entry`= 200000;

update `creature_template` set `npcflag`= npcflag|2 where `entry`in (70100,70552,73318,73335,58507,62540,63359,67414,68084,68538,69741,73136);


DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142026;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142028;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142029;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142030;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142031;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142032;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142033;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142035;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142036;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142037;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142038;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142039;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142041;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142042;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142043;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142044;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142045;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=143899;



