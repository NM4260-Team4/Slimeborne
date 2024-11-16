event_inherited();
hp = 30;
max_hp = 30;

electric_floor_active = false;

function activate_electric_floor() {
	instance_activate_object(obj_electric);
	electric_floor_active = true;
}

function deactivate_electric_floor() {
	instance_deactivate_object(obj_electric);
	electric_floor_active = false;
}

