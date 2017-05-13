/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// ein respawnender Spieler wird für Zeuse erneut sichtbar gemacht
_newUnit = _this select 0;
{[_x,[[_newUnit],true]] remoteExec ["addCuratorEditableObjects",2]; nil;} count allCurators;

// Aufwachanimation
if !(handgunWeapon _newUnit isEqualTo "") then
{
	waitUntil {!isNull _newUnit};
	_newUnit switchMove "Acts_UnconsciousStandUp_part1";
	_newUnit playMove "Acts_UnconsciousStandUp_part2";
};


/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */