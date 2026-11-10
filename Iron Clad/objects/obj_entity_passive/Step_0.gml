if (hit_cooldown > 0) {
    hit_cooldown--;
}
if (hit_cooldown > 30 - 12) {
    image_blend = c_red;
} else {
    image_blend = c_white;
}

if (keyboard_check_pressed(ord("E"))) {
    if (distance_to_object(obj_player) < 56 && !is_spared) {
        is_spared = true;
        global.guilt = max(0, global.guilt - 1);
    }
}

if (is_spared) {
    path_end();
    speed = 0;
    fade_alpha -= 0.04;
    image_alpha = fade_alpha;
    if (fade_alpha <= 0) instance_destroy();
    exit;
}

switch (state) {
    case "patrol":
        if (path_index == -1) {
            if (asset_get_index("path_entity_tutorial") != -1) {
                path_start(path_entity_tutorial, movement_speed, path_action_continue, true);
            }
        }
        
        if (instance_exists(obj_player) && distance_to_object(obj_player) < aggro_radius) {
            path_end();
            state = "chase";
            chase_timer = 180;
        }
        break;
        
    case "chase":
        if (instance_exists(obj_player)) {
            move_towards_point(obj_player.x, obj_player.y, movement_speed);
        }
        
        chase_timer--;
        
        if (chase_timer <= 0 || (instance_exists(obj_player) && distance_to_object(obj_player) > leash_distance)) {
            speed = 0;
            state = "returning";
        }
        break;
        
    case "returning":
        // fixes the snap back
        move_towards_point(spawn_x, spawn_y, return_speed);
        
        if (point_distance(x, y, spawn_x, spawn_y) < 4) {
            speed = 0;
            x = spawn_x;
            y = spawn_y;
            state = "patrol";
        }
        break;
}