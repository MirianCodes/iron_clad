// Pause entity movement while dialogue is playing
if (instance_exists(obj_dialogue)) {
    speed = 0;
    path_speed = 0;
    exit;
}

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

        if (block_when_spared) {
            is_blocking_path = true;
            solid = true;
        }

        if (!instance_exists(obj_dialogue)) {
            var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
            _box.dialogue_lines = block_when_spared ? [
                "* You lower your blade and offer a quiet mercy.",
                "* The spirit stills in place, barring the passage behind you. Your conscience feels lighter."
            ] : [
                "* You lower your blade and offer a quiet mercy.",
                "* The spirit's hostility fades into peaceful silence. Your conscience feels lighter."
            ];
        }
    }
}

if (is_spared) {
    path_end();
    speed = 0;

    if (is_blocking_path) {
        image_alpha = 1.0;
        exit;
    }

    fade_alpha -= 0.04;
    image_alpha = fade_alpha;
    if (fade_alpha <= 0) instance_destroy();
    exit;
}

switch (state) {
    case "patrol":
        if (path_index == -1) {
            if (my_path != -1 && path_exists(my_path)) {
                path_start(my_path, movement_speed, path_end_mode, false);
                path_position = clamp(saved_path_pos, 0, 1);
            }
        } else {
            var _dir_sign = (path_speed < 0) ? -1 : 1;
            path_speed = _dir_sign * movement_speed;
        }

        if (instance_exists(obj_player) && distance_to_object(obj_player) < aggro_radius) {
            return_x = x;
            return_y = y;
            saved_path_pos = path_position;

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
        move_towards_point(return_x, return_y, return_speed);

        if (point_distance(x, y, return_x, return_y) < 4) {
            speed = 0;
            x = return_x;
            y = return_y;
            state = "patrol";
        }
        break;
}