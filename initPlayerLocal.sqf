/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// setzt die maximale Sichtweite auf 5000 Meter
setViewDistance 5000;

// VOIP/VON in den Chatkanäle deaktivieren (Global, Seite, Gruppe, Direkt, Fahrzeug, Kommando)
0 enableChannel [true,false];
1 enableChannel [true,false];
2 enableChannel [true,false];
3 enableChannel [true,false];
4 enableChannel [true,false];
5 enableChannel [true,false];

// Spieler-Loadout
[] execVM "modules\loadouts\loadouts_initPlayerLocal.sqf";

// Missionsintro
0 cutText ["","BLACK IN",8,false];	// blendet zu Missionsbeginn langsam von schwarz ein
//sleep 7;
[
	[
		["Willkommen,","align = 'center' shadow = '1' size = '1'"],
		[format [" %1 %2!",rank player,name player],"align = 'center' shadow = '1' size = '1'","#aaaaaa"],
		["","<br/>"],
		["Der ArmA Social Club","align = 'center' shadow = '1' size = '1'","#aaaaaa"],
		[" präsentiert:","align = 'center' shadow = '1' size = '1'"],
		["","<br/>"],
		[format ["%1",briefingName],"align = 'center' shadow = '1' size = '1'"]
	]
] spawn BIS_fnc_typeText2;



/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */