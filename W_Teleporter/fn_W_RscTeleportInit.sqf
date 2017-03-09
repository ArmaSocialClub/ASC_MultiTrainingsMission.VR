#define leader_pic				"W_Teleporter\data\isLeader.paa"
#define vehicle_pic 			"W_Teleporter\data\isInVehicle.paa"
#define leader_vehicle_pic 		"W_Teleporter\data\isCombined.paa"

disableSerialization;
_display = _this select 0;
_ok = _display displayCtrl 1;
_cancel = _display displayCtrl 2;
_lb = _display displayCtrl 1500;
uinamespace setVariable ["rscTeleportList",[]];

// set the ui event handlers
{
	_x ctrlAddEventhandler ["checkBoxesSelChanged",{
		_cb = _this select 0;

		if (ctrlChecked _cb) then {
			_display = ctrlParent _cb;
			_lb = _display displayCtrl 1500;
			_lb_1 = _display displayCtrl 1501;
			lbClear _lb;
			lbClear _lb_1;

			_cbs = [_display displayCtrl 2500,_display displayCtrl 2501,_display displayCtrl 2502,_display displayCtrl 2503];
			_cbs = _cbs - [_cb];

			{
				_x ctrlSetChecked false;
			} forEach _cbs;

			switch true do {
				case (ctrlChecked (_display displayCtrl 2500)) : {
					_list = [];
					{
						if (side _x == west) then {
							_lb_index = _lb lbAdd (name _x);
							_lb lbSetValue [_lb_index,_lb_index];
							_list set [_lb_index,_x];
						if (leader _x == _x) then {
								if (vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,leader_pic];
								} else {
									_lb lbSetPicture [_lb_index,leader_vehicle_pic];
								};
							} else {
								if !(vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,vehicle_pic];
								};
							};
						};
					} forEach (playableunits + switchableunits);
					lbSort _lb;
					uinamespace setvariable ["rscTeleportList",_list];
				};
				case (ctrlChecked (_display displayCtrl 2501)) : {
					_list = [];
					{
						if (side _x == independent) then {
							_lb_index = _lb lbAdd (name _x);
							_lb lbSetValue [_lb_index,_lb_index];
							_list set [_lb_index,_x];
						if (leader _x == _x) then {
								if (vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,leader_pic];
								} else {
									_lb lbSetPicture [_lb_index,leader_vehicle_pic];
								};
							} else {
								if !(vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,vehicle_pic];
								};
							};
						};
					} forEach (playableunits + switchableunits);
					lbSort _lb;
					uinamespace setvariable ["rscTeleportList",_list];
				};
				case (ctrlChecked (_display displayCtrl 2502)) : {
					_list = [];
					{
						if (side _x == east) then {
							_lb_index = _lb lbAdd (name _x);
							_lb lbSetValue [_lb_index,_lb_index];
							_list set [_lb_index,_x];
							if (leader _x == _x) then {
								if (vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,leader_pic];
								} else {
									_lb lbSetPicture [_lb_index,leader_vehicle_pic];
								};
							} else {
								if !(vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,vehicle_pic];
								};
							};
						};
					} forEach (playableunits + switchableunits);
					lbSort _lb;
					uinamespace setvariable ["rscTeleportList",_list];
				};
				case (ctrlChecked (_display displayCtrl 2503)) : {
					_list = [];
					{
						if (side _x == civilian) then {
							_lb_index = _lb lbAdd (name _x);
							_lb lbSetValue [_lb_index,_lb_index];
							_list set [_lb_index,_x];
							if (leader _x == _x) then {
								if (vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,leader_pic];
								} else {
									_lb lbSetPicture [_lb_index,leader_vehicle_pic];
								};
							} else {
								if !(vehicle _x == _x) then {
									_lb lbSetPicture [_lb_index,vehicle_pic];
								};
							};
						};
					} forEach (playableunits + switchableunits);
					lbSort _lb;
					uinamespace setvariable ["rscTeleportList",_list];
				};
			};
		};
	}];
} forEach [_display displayCtrl 2500,_display displayCtrl 2501,_display displayCtrl 2502,_display displayCtrl 2503];

_lb ctrlAddEventHandler ["lbSelChanged",{
	_lb = _this select 0;
	_index = lbCurSel _lb;
	_display = ctrlParent _lb;
	_lb_1 = _display displayCtrl 1501;
	_list = uinamespace getvariable "rscTeleportList";
	_target = _list select _index;
	_vehicle = vehicle _target;

	lbClear _lb_1;
	if (_vehicle == _target) then {
		_lb_index = _lb_1 lbAdd "Soldier";
		_lb_1 lbSetData [_lb_index,"direct"];
	} else {
		_roles = [_vehicle] call BIS_fnc_vehicleRoles;
		_cargoSize = 0;
		{
			if (_x select 0 == "Cargo") then {
				_cargoSize = _cargoSize + 1;
				_roles = _roles - [_x];
			};
		} forEach _roles;

		{
			_vehicleRole = assignedVehicleRole _x;
			switch (_vehicleRole select 0) do {
				case "Driver" : {
					_roles = _roles - [["Driver",[]]];
				};
				case "Turret" : {
					_roles = _roles - [_vehicleRole];
				};
				case "Cargo" : {
					_cargoSize = _cargoSize - 1;
				};
			};
		} forEach (crew _vehicle);

		if (_cargoSize > 0) then {
			_lb_index = _lb_1 lbAdd "Passenger";
			_lb_1 lbSetData [_lb_index,"cargo"];
		};

		uinamespace setvariable ["teleport_turrets",nil];
		{
			switch (_x select 0) do {
				case "Driver" : {
					_lb_index = _lb_1 lbAdd "Driver";
					_lb_1 lbSetData [_lb_index,"driver"];
				};
				case "Turret" : {
					_path = _x select 1;

					_cfg = configfile >> "CfgVehicles" >> (typeOf _vehicle);
					{
						_cfg = (_cfg >> "Turrets") select _x;
					} forEach _path;
					_display_name = getText (_cfg >> "gunnerName");

					_lb_index = _lb_1 lbAdd _display_name;
					_lb_1 lbSetData [_lb_index,"turret"];

					_array = uinamespace getvariable ["teleport_turrets",[]];
					_array set [_lb_index,(_x select 1)];
					uinamespace setvariable ["teleport_turrets",_array];
				};
			};
		} forEach _roles;

		_lb_index = _lb_1 lbAdd "in the vicinity";
		_lb_1 lbSetData [_lb_index,"near"];

	};
}];

_ok ctrlAddEventHandler ["buttonclick",{
	_display = ctrlParent (_this select 0);
	_lb = _display displayCtrl 1500;
	_lb_1 = _display displayCtrl 1501;

	_index = lbCurSel _lb;
	_index_1 = lbCurSel _lb_1;
	if (_index < 0) exitWith {
		hintC "Kein Spieler ausgewählt!";
		createDialog "W_RscTeleportDialog";
		uinamespace setVariable ["rscTeleportList",nil];
		uinamespace setVariable ["teleport_turrets",nil];
	};
	if (_index_1 < 0) exitWith {
		hintC "Kein Teleport ausgewählt!";
		createDialog "W_RscTeleportDialog";
		uinamespace setVariable ["rscTeleportList",nil];
		uinamespace setVariable ["teleport_turrets",nil];
	};

	_list = uinamespace getVariable "rscTeleportList";
	_target = vehicle (_list select (_lb lbValue _index));

	if (isNil {_target}) exitWith {
		hintC "Spieler nicht mehr verfügbar!";
		createDialog "W_RscTeleportDialog";
		uinamespace setVariable ["rscTeleportList",nil];
		uinamespace setVariable ["teleport_turrets",nil];
	};

	_teleport = _lb_1 lbData _index_1;
	switch _teleport do {
		case "direct" : {
			_pos = _target modelToWorld [0,-2,0];
			player setpos _pos;
		};
		case "near" : {
			if (damage _target > 0.9) then {
				hintC "Spieler nicht mehr verfügbar!";
				createDialog "W_RscTeleportDialog";
				uinamespace setVariable ["rscTeleportList",nil];
				uinamespace setVariable ["teleport_turrets",nil];
			} else {
				_pos = _target modelToWorld [-5,-5,0];
				_pos = [_pos select 0,_pos select 1,0];
				player setpos _pos;
			};
		};
		case "cargo" : {
			if (damage _target > 0.9) then {
				hintC "Spieler nicht mehr verfügbar!";
				createDialog "W_RscTeleportDialog";
				uinamespace setVariable ["rscTeleportList",nil];
				uinamespace setVariable ["teleport_turrets",nil];
			} else {
				player moveInCargo _target;
			};
		};
		case "turret" : {
			if (damage _target > 0.9) then {
				hintC "Spieler nicht mehr verfügbar!";
				createDialog "W_RscTeleportDialog";
				uinamespace setVariable ["rscTeleportList",nil];
				uinamespace setVariable ["teleport_turrets",nil];
			} else {
				player moveInTurret [_target,((uinamespace getvariable "teleport_turrets") select _index_1)];
			};
		};
		case "driver" : {
			if (damage _target > 0.9) then {
				hintC "Spieler nicht mehr verfügbar!";
				createDialog "W_RscTeleportDialog";
				uinamespace setVariable ["rscTeleportList",nil];
				uinamespace setVariable ["teleport_turrets",nil];
			} else {
				player moveInDriver _target;
			};
		};
	};

	uinamespace setVariable ["rscTeleportList",nil];
	uinamespace setVariable ["teleport_turrets",nil];
}];

_cancel ctrlAddEventhandler ["buttonclick",{
	uinamespace setVariable ["rscTeleportList",nil];
	uinamespace setVariable ["teleport_turrets",nil];
}];