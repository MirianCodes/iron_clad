hp = 3;
hit_cooldown = 0;
is_spared = false;
fade_alpha = 1.0;

movement_speed = global.player_speed;
aggro_radius = 160;
leash_distance = 240;
state = "patrol";
chase_timer = 0;
spawn_x = x;
spawn_y = y;
return_x = x;
return_y = y;
return_speed = movement_speed * 0.8;
saved_path_pos = 0;

// Defaults for Room1 tutorial overridden in Village Creation Code
my_path = asset_get_index("path_entity_tutorial");
path_end_mode = path_action_continue;
block_when_spared = false;
is_blocking_path = false;