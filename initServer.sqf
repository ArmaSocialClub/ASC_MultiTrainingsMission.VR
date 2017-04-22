/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// definiere und publiziere Variable
a_variable = true;
publicVariable "a_variable";

// all Einheiten und Gegenstände werden für Zeuse sichtbar gemacht
{_x addCuratorEditableObjects [allUnits,true]} count allCurators;
{_x addCuratorEditableObjects [vehicles,true]} count allCurators;



/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */