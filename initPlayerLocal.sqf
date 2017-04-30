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

// Spieler respawnen mit dem Loadout, das der Missionsbauer ihnen auch mit dem Virtuellen Arsenal zugewiesen hat
Plyr_Ldt = getUnitLoadout player;
Resp_Ldt_EH = player addEventHandler ["Respawn",{(_this select 0) setUnitLoadout [Plyr_Ldt,true];}];

// Missionsintro
0 cutText ["","BLACK IN",8,false];	// blendet zu Missionsbeginn langsam von schwarz ein
[
	[
		["Willkommen,","align = 'center' shadow = '1' size = '1' font='PuristaBold'"],
		[format [" %1 %2!",rank player,name player],"align = 'center' shadow = '1' size = '1' font='PuristaBold'","#aaaaaa"],
		["","<br/>"],
		["Der ArmA Social Club","align = 'center' shadow = '1' size = '1' font='PuristaBold'","#aaaaaa"],
		[" präsentiert:","align = 'center' shadow = '1' size = '1' font='PuristaBold'"],
		["","<br/>"],
		[format ["%1",briefingName],"align = 'center' shadow = '1' size = '2.5' font='PuristaBold'"]
	]
] spawn BIS_fnc_typeText2;



/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */