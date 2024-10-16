global.player_state.respawn_x = target_x;
global.player_state.respawn_y = target_y;
save_game(false);
room_goto(target_room);
