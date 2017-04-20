/* -------------------------- Arma Social Club -------------------------- */
/* --------- init.sqf Template-Abschnitt --------- */
/* Dieser Bereich beinhaltet alle Must-Have-Konfigurationen für eine Mission des Arma Social Club. VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// setzt die maximale Sichtweite auf 5000 Meter
setViewDistance 5000;

// Chatkanäle deaktivieren (Global, Seite, Gruppe, Direkt, Fahrzeug, Kommando)
0 enableChannel [false,false];
1 enableChannel [false,false];
2 enableChannel [false,false];
3 enableChannel [false,false];
4 enableChannel [false,false];
5 enableChannel [false,false];

// Spieler respawnen mit dem Loadout, das der Missionsbauer ihnen auch mit dem Virtuellen Arsenal zugewiesen hat
Plyr_Ldt = getUnitLoadout player;
Resp_Ldt_EH = player addEventHandler ["Respawn",{(_this select 0) setUnitLoadout [Plyr_Ldt,true];}];

// Missionsintro
[parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""<br/></t>
%2</t>",toUpper briefingName,"by Arma Social Club"],true,nil,7,0.7,0] spawn BIS_fnc_textTiles;	// zeigt zu Missionsbeginn den Missionsnamen an
0 cutText ["","BLACK IN",5,false];	// blendet zu Missionsbeginn langsam von schwarz ein



/* --------- init.sqf Template-Abschnitt: Ende --------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */