/* -------------------------- Arma Social Club -------------------------- */
/* ------------------------- Template-Abschnitt ------------------------- */
/* Dieser Bereich beinhaltet Must-Have-Konfigurationen für eine Mission des Arma Social Club. */
/* VERÄNDERE KEINEN CODE IN DIESEM ABSCHNITT! DIE MISSION KANN DADURCH UNSPIELBAR WERDEN! */



// erstelle einen Tagebucheintrag mit einer Übersicht über alle Spielergruppen
{
	if (isPlayer leader _x) then
	{
		player createDiarySubject ["Kommandostruktur","Kommandostruktur"];
		player createDiaryRecord
		[
			"Kommandostruktur",
			[
				str(_x) select [2],
				"<br/><font color='#107b1b'>Befehlshaber:</font color> " + rank leader _x + " " + name leader _x +
				"<br/><font color='#107b1b'>Anfängliche Mannstärke gesamt:</font color> " + str(count (units  _x))
			]
		];
	};
	nil;
} count allGroups;



/* ------------------------- Template-Abschnitt: Ende ------------------------- */
/* Ab dieser Zeile kannst du deinen eigenen, missionsspezifischen Code unterhalb einfügen */