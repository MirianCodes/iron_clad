if (distance_to_object(obj_player) < 48) {
    if (keyboard_check_pressed(ord("F"))) {
        wheel_active = !wheel_active; 
		is_spinning = false;
    }
} else {
    wheel_active = false;
}