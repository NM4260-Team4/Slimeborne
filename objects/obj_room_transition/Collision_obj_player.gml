global.player_state.respawn_x = target_x;
global.player_state.respawn_y = target_y;
// save_game(false);
// room_goto(target_room);
start_room_transition(target_room, seq_fade_out, seq_fade_in);
