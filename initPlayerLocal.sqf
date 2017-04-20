/* -------------------------- Arma Social Club -------------------------- */
/* --------- initPlayerLocal.sqf Template-Abschnitt --------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// Setzt die maximale Sichtweite auf 5000 Meter
setViewDistance 5000;

// Chatkanäle deaktivieren (Global, Seite, Gruppe, Direkt, Fahrzeug, Kommando)
0 enableChannel [false,false];
1 enableChannel [false,false];
2 enableChannel [false,false];
3 enableChannel [false,false];
4 enableChannel [false,false];
5 enableChannel [false,false];

// Falls der Spieler ein Sanitäter ist, wird ihm ein entsprechendes Loadout zugewiesen
waitUntil {!isNull player};
if (player getUnitTrait "Medic") then
{
	player removeItem "FirstAidKit";
	player removeItem "Medikit";
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 12 do {player addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 12 do {player addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 12 do {player addItemToBackpack "ACE_quikclot";};
	for "_i" from 1 to 5 do {player addItemToBackpack "ACE_tourniquet";};
	for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bloodIV_250";};
	player addItemToBackpack "ACE_bloodIV_500";
	for "_i" from 1 to 8 do {player addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 8 do {player addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 3 do {player addItemToBackpack "ACE_personalAidKit";};
	player addItemToBackpack "ACE_surgicalKit";
};

// Weise dem Spieler ACE-Gegenstände zu
player addItem "ACE_microDAGR";
player addItem "ACE_EarPlugs";

// Spieler respawnen mit dem Loadout, das der Missionsbauer ihnen auch mit dem Virtuellen Arsenal zugewiesen hat
Plyr_Ldt = getUnitLoadout player;
Resp_Ldt_EH = player addEventHandler ["Respawn",{(_this select 0) setUnitLoadout [Plyr_Ldt,true];}];

// Missionsintro
[parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""<br/></t>
%2</t>",toUpper briefingName,"by Arma Social Club"],true,nil,7,0.7,0] spawn BIS_fnc_textTiles;	// zeigt zu Missionsbeginn den Missionsnamen an
0 cutText ["","BLACK IN",5,false];	// blendet zu Missionsbeginn langsam von schwarz ein



/* --------- initPlayerLocal.sqf Template-Abschnitt: Ende --------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */