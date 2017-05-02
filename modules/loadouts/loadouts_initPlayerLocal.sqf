/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



/* weise dem Spieler entsprechend seiner Rolle ein standardisiertes Loadout zu */
// warte, bis der Spieler initialisiert ist
waitUntil {!isNull player};

// entferne alle eventuell extern zugewiesenen ACE-Medical-Items
player removeItems "FirstAidKit";
player removeItems "Medikit";
player removeItems "ACE_fieldDressing";
player removeItems "ACE_elasticBandage";
player removeItems "ACE_packingBandage";
player removeItems "ACE_quikclot";
player removeItems "ACE_tourniquet";
player removeItems "ACE_bloodIV_250";
player removeItems "ACE_bloodIV_500";
player removeItems "ACE_morphine";
player removeItems "ACE_epinephrine";
player removeItems "ACE_personalAidKit";
player removeItems "ACE_surgicalKit";

if (player getUnitTrait "Medic") then	// Medic-Loadout
{
	if (backpack player isEqualTo "") then {player addBackpack "B_FieldPack_blk"};
	for "_i" from 1 to 20 do {player addItem "ACE_fieldDressing";};
	for "_i" from 1 to 20 do {player addItem "ACE_elasticBandage";};
	for "_i" from 1 to 20 do {player addItem "ACE_packingBandage";};
	for "_i" from 1 to 20 do {player addItem "ACE_quikclot";};
	for "_i" from 1 to 5 do {player addItem "ACE_tourniquet";};
	for "_i" from 1 to 10 do {player addItem "ACE_bloodIV_250";};
	for "_i" from 1 to 10 do {player addItem "ACE_bloodIV_500";};
	for "_i" from 1 to 20 do {player addItem "ACE_morphine";};
	for "_i" from 1 to 20 do {player addItem "ACE_epinephrine";};
	for "_i" from 1 to 5 do {player addItem "ACE_personalAidKit";};
	player addItem "ACE_surgicalKit";
}
else	// Nicht-Medic-Loadout
{
	for "_i" from 1 to 5 do {player addItem "ACE_fieldDressing";};
	for "_i" from 1 to 3 do {player addItem "ACE_elasticBandage";};
	for "_i" from 1 to 3 do {player addItem "ACE_packingBandage";};
	for "_i" from 1 to 2 do {player addItem "ACE_quikclot";};
	for "_i" from 1 to 2 do {player addItem "ACE_morphine";};
};

// weise dem Spieler ACE-Gegenstände zu
//if !("ACE_microDAGR" in (items player)) then {player addItem "ACE_microDAGR";};
if !("ACE_EarPlugs" in (items player)) then {player addItem "ACE_EarPlugs";};

// Spieler respawnen mit dem nun vollständigen gesamten Loadout
Plyr_Ldt = getUnitLoadout player;
Resp_Ldt_EH = player addEventHandler ["Respawn",{(_this select 0) setUnitLoadout [Plyr_Ldt,true];}];



/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */