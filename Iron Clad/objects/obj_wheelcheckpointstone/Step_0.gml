if (distance_to_object(obj_player) < 48) {
    if (keyboard_check_pressed(ord("E"))) {
        wheel_active = !wheel_active; 
    }
} else {
    wheel_active = false;
}