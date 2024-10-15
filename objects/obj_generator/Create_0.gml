event_inherited();
enabled = false;

function hit() {
	enabled = !enabled;
	if (enabled) {
		sprite_index = spr_generator_on;
	} else {
		sprite_index = spr_generator_off;
	}
}