update `creature_template` set `VehicleId`= 0, `npcflag`= 0 where `entry` in (63796);

DELETE FROM `creature` WHERE `guid`=517838;
