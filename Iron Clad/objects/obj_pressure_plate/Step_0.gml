is_pressed = place_meeting(x, y, obj_tutorial_challenge) || place_meeting(x, y, obj_player);

// Trigger gate state change only when pressure changes
if (is_pressed != was_pressed) {
    if (instance_exists(target_gate)) {
        target_gate.is_open = is_pressed;
    }
    was_pressed = is_pressed;
}