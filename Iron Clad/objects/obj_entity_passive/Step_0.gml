if (hit_cooldown > 0) {
    hit_cooldown--;
}

if (keyboard_check_pressed(ord("E"))) {
    if (distance_to_object(obj_player) < 56) {
        is_spared = true;
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

if (path_index == -1) {
    if (asset_get_index("path_entity_tutorial") != -1) {
        path_start(path_entity_tutorial, movement_speed, path_action_continue, true);
    }
}