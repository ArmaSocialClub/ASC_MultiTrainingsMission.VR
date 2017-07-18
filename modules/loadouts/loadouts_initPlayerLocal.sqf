/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



/* weise dem Spieler entsprechend seiner Rolle ein standardisiertes Loadout zu */
// warte, bis der Spieler initialisiert ist
waitUntil {!isNull player};

// weise dem Spieler ACE-Gegenstände zu
if !("ACE_EarPlugs" in (items player)) then {player addItem "ACE_EarPlugs";};
if ((leader (group player)) isEqualTo player) then
{
	player addItem "ACE_microDAGR";
	// füge alle Kartenmarker als Wegpunkte dem microDAGR hinzu
	{if !(markerText _x isEqualTo "") then {[markerText _x,getMarkerPos _x] call ACE_microDAGR_fnc_deviceAddWaypoint;};} forEach allMapMarkers;
	player addItem "ACE_MapTools";
};

// entferne alle eventuell extern zugewiesenen ACE-Medical-Items
{player removeItems _x;} forEach
	["FirstAidKit",
	"Medikit",
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_tourniquet",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_morphine",
	"ACE_epinephrine",
	"ACE_personalAidKit",
	"ACE_surgicalKit"];

if (player getUnitTrait "Medic") then	// Medic-Loadout
{
	{for "_i" from 1 to 12 do {player addItem _x;}} forEach ["ACE_elasticBandage","ACE_packingBandage","ACE_fieldDressing","ACE_quikclot"];
	{for "_i" from 1 to 8 do {player addItem _x;}} forEach ["ACE_morphine","ACE_epinephrine"];
	{for "_i" from 1 to 3 do {player addItem _x;}} forEach ["ACE_bloodIV_250","ACE_bloodIV_500"];
	{for "_i" from 1 to 3 do {player addItem _x;}} forEach ["ACE_personalAidKit"];
	{for "_i" from 1 to 3 do {player addItem _x;}} forEach ["ACE_tourniquet"];
	player addItem "ACE_surgicalKit";
	// falls der Medic immer noch Platz hat, füge alles noch einmal hinzu
	{for "_i" from 1 to 12 do {player addItem _x;}} forEach ["ACE_elasticBandage","ACE_packingBandage","ACE_fieldDressing","ACE_quikclot"];
	{for "_i" from 1 to 8 do {player addItem _x;}} forEach ["ACE_morphine","ACE_epinephrine"];
	/*{for "_i" from 1 to 3 do {player addItem _x;}} forEach ["ACE_bloodIV_250","ACE_bloodIV_500"];
	//{for "_i" from 1 to 3 do {player addItem _x;}} forEach ["ACE_personalAidKit"];
	player addItem "ACE_tourniquet";*/
}
else	// Nicht-Medic-Loadout
{
	{for "_i" from 1 to 4 do {player addItem _x;}} forEach ["ACE_elasticBandage","ACE_packingBandage","ACE_fieldDressing","ACE_quikclot"];
	for "_i" from 1 to 2 do {player addItem "ACE_tourniquet"};
	player addItem "ACE_morphine";
};

// Spieler respawnen mit dem nun vollständigen gesamten Loadout
Plyr_Ldt = getUnitLoadout player;
Resp_Ldt_EH = player addEventHandler ["Respawn",{(_this select 0) setUnitLoadout [Plyr_Ldt,true];}];



/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */