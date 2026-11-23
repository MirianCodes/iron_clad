if (reset_timer > 0) {
    reset_timer -= 1;
    if (reset_timer <= 0) {
        current_step = 0;
        with (obj_gate_lever) {
            is_pulled = false;
            lever_state = 0; 
            image_index = 0;
            image_blend = c_white;
        }
    }
}