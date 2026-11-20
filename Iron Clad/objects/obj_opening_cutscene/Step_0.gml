// Optional quick-skip to tutorial with Escape
if (keyboard_check_pressed(vk_escape) && phase != "room_fade" && phase != "done") {
    if (instance_exists(obj_dialogue)) {
        instance_destroy(obj_dialogue);
    }
    phase = "room_fade";
}

switch (phase) {
    case "fade_in":
        alpha = min(1, alpha + fade_speed);
        glide_offset_y = lerp(glide_offset_y, 0, glide_lerp);

        if (alpha >= 1 && abs(glide_offset_y) < 0.2) {
            alpha = 1;
            glide_offset_y = 0;
            phase = "active";
        }
        break;

    case "active":
        // Gentle continued upward drift while reading both lines
        glide_offset_y = max(-10, glide_offset_y - 0.08);

        // obj_dialogue advances line 1 -> line 2 on E, then destroys itself after line 2
        if (!instance_exists(obj_dialogue)) {
            phase = "fade_out";
        }
        break;

    case "fade_out":
        alpha = max(0, alpha - fade_speed);
        glide_offset_y -= 0.35;

        if (alpha <= 0) {
            alpha = 0;
            slide_index++;

            if (slide_index < array_length(slides)) {
                glide_offset_y = 18;
                phase = "fade_in";
                spawn_current_slide_dialogue();
            } else {
                phase = "room_fade";
            }
        }
        break;

    case "room_fade":
        room_fade_alpha = min(1, room_fade_alpha + 0.03);
        if (room_fade_alpha >= 1) {
            room_fade_alpha = 1;
            phase = "done";
            room_goto(Room1);
        }
        break;
}