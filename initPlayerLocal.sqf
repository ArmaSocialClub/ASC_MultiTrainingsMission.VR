/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// setzt die maximale Sichtweite auf 5000 Meter
setViewDistance 5000;

// VOIP/VON in den Chatkanälen deaktivieren (Global, Seite, Gruppe, Direkt, Fahrzeug, Kommando)
0 enableChannel [true,false];
1 enableChannel [true,false];
2 enableChannel [true,false];
3 enableChannel [true,false];
4 enableChannel [true,false];
5 enableChannel [true,false];

// Spieler-Loadout
[] execVM "modules\Loadouts\Loadouts_initPlayerLocal.sqf";

// zusätzliche Briefingeinträge
[] execVM "modules\Briefing\Briefing_initPlayerLocal.sqf";

// von Zeus gesetzte Einheiten werden auch für andere Zeus sichtbar gemacht
if (typeOf player in Curators) then
{
	// SilentSpike: getAssignedCuratorLogic command will return objNull if used immediately after the curator logic is assigned to the unit in question (this includes at mission time 0). To avoid problems use the following beforehand
	waitUntil {!isNull (getAssignedCuratorLogic player)};
	COP_EH = (getAssignedCuratorLogic player) addEventHandler [
		"CuratorObjectPlaced",
		{
			private _entity = _this select 1;
			{[_x,[[_entity],true]] remoteExec ["addCuratorEditableObjects",2]; nil;} count (allCurators - [getAssignedCuratorLogic player]);
		}
	];
};

// Missionsintro
if (isMultiplayer) then
{
	waitUntil {!(player call BIS_fnc_isLoading)};
	if !(typeOf player in ["VirtualCurator_F","B_VirtualCurator_F","C_VirtualCurator_F","I_VirtualCurator_F","O_VirtualCurator_F","VirtualSpectator_F"]) then
	{
		[player,"Standort: " + worldName + ", Ziel: " + rank player + " " + name player + ", Gruppe: " + (str(group player) select [2]),50] call BIS_fnc_establishingShot;
	};
	0 cutText ["","BLACK IN",8,false];	// blendet zu Missionsbeginn langsam von schwarz ein
	[
		[
			["Der ArmA Social Club","align = 'center' shadow = '1' size = '1'","#aaaaaa"],
			[" präsentiert:","align = 'center' shadow = '1' size = '1'"],
			["","<br/>"],
			[format ["%1",briefingName],"align = 'center' shadow = '1' size = '1'"]
		]
	] spawn BIS_fnc_typeText2;
};


/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */