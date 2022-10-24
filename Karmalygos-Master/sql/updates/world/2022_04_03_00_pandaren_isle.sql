-- exploit dmg
update `creature_template` set `mindmg`= 5, `maxdmg`= 10, `attackpower`= 0 where `entry`= 65468;

update `creature_template` set `ScriptName`= '' where `entry`in ( 
55685,55744,56159,57748,53565,65469,54587,54586,65471,65470,54611,54855,54785,54943,54135);

update `creature_template` set `AIName`= '' where `entry`in (56661,55786,55586,55940,60042);
