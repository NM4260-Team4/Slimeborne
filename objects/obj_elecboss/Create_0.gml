event_inherited();
hp = 20;
max_hp = 20;

electric_floor_active = false;

function activate_electric_floor() {
	instance_activate_object(obj_electric);
	electric_floor_active = true;
}

function deactivate_electric_floor() {
	instance_deactivate_object(obj_electric);
	electric_floor_active = false;
}

