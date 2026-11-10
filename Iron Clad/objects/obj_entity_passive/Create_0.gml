hp = 3;
hit_cooldown = 0;
is_spared = false;
fade_alpha = 1.0;

movement_speed = global.player_speed;
aggro_radius = 160;
leash_distance = 240;
state = "patrol";

spawn_x = x;
spawn_y = y;

if (asset_get_index("path_entity_tutorial") != -1) {
    path_start(path_entity_tutorial, movement_speed, path_action_continue, true);
}