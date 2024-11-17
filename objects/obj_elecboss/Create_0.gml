event_inherited();
hp = 35;
max_hp = 35;

electric_floor_active = false;

function activate_electric_floor() {
	instance_activate_object(obj_electric);
	electric_floor_active = true;
}

function deactivate_electric_floor() {
	instance_deactivate_object(obj_electric);
	electric_floor_active = false;
}

weakness = obj_battery_attach;
weak_sequence = -1;
weakness_layer = layer_create(depth - 3, "Weakness Layer");