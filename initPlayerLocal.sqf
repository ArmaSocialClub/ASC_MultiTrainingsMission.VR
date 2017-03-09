// by Quentin


/* Teleport section */
FETT_fnc_W_addTeleport = compile preprocessFileLineNumbers "W_Teleporter\fn_W_addTeleport.sqf";
_Tp_Obj = [flag_hq,flag_tfar,flag_cqb,flag_med,flag_sr];
{[_x] call FETT_fnc_W_addTeleport; nil} count _Tp_Obj;
/* Teleport section finished */

/* Insignia section */
/*[player,"ASCInsignia"] remoteExec [BIS_fnc_setUnitInsignia,0,true];	// give player ASC insignia
addMissionEventHandler ["EachFrame",{[player,"ASCInsignia"] remoteExec [BIS_fnc_setUnitInsignia,0,true];};}];	// add persistent MEH to maintain insignia after respawn / opening virtual arsenal / taking off clothes and back on again
/* Insignia section finished */