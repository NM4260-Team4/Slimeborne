available_potions = [];
current_potion = 0;

array_push(available_potions, instance_create_layer(0,0, "Instances", obj_hp_potion));
array_push(available_potions, instance_create_layer(0,0, "Instances", obj_speed_potion));

get_next_potion = function() {
	current_potion = (current_potion + 1) % array_length(available_potions);
}