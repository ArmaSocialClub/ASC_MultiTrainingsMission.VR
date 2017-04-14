/* -------------------------- Arma Social Club -------------------------- */
/* --------- init.sqf Template-Abschnitt --------- */
/* Dieser Bereich beinhaltet alle Must-Have-Konfigurationen für eine Mission des Arma Social Club. VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */


setViewDistance 5000;	// setzt die maximale Sichtweite auf 5000 Meter

// Chatkanäle deaktivieren (Global, Seite, Gruppe, Direkt, Fahrzeug, Kommando)
0 enableChannel [false,false];
1 enableChannel [false,false];
2 enableChannel [false,false];
3 enableChannel [false,false];
4 enableChannel [false,false];
5 enableChannel [false,false];

// Missionsintro
[parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""<br/></t>
%2</t>",toUpper briefingName,"by Arma Social Club"],true,nil,7,0.7,0] spawn BIS_fnc_textTiles;	// zeigt zu Missionsbeginn den Missionsnamen an
0 cutText ["","BLACK IN",5,false];	// blendet zu Missionsbeginn langsam von schwarz ein


/* --------- init.sqf Template-Abschnitt: Ende --------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */