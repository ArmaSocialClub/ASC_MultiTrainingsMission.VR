/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// ein nachjoinender Spieler (= JIP) wird für Zeuse sichtbar gemacht
_player = _this select 0;
_didJIP = _this select 1;
if (_didJIP) then {{_x addCuratorEditableObjects [[_player],true]} count allCurators;};



/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */