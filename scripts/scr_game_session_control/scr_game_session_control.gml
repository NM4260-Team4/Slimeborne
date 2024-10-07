function save_game() {

	var _file = file_text_open_write("save.txt");
	file_text_write_real(_file, global.max_hp);
	file_text_close(_file);

}

function load_game() {

}

function init_game() {

}