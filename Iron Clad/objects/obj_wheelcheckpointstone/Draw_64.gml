if (wheel_active) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _cx = _gui_w / 2;
    var _cy = _gui_h / 2;

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1.0);

    if (is_spinning) {
        gui_angle = (spin_speed + gui_angle) mod 360;
        if (spin_speed > 0) {
            spin_speed = spin_speed - random_range(0.2, 0.5);
        }

        if (spin_speed <= 0) {
            spin_speed = 0;
            outcome = gui_angle;

            if (save_checkpoint && instance_exists(obj_player)) {
                global.checkpoint_room = room;
                global.checkpoint_x = obj_player.x;
                global.checkpoint_y = obj_player.y;
            }

            scr_spin_wheel(outcome); 
            exit;
        }
    }

    // Draw wheel and ticker
    draw_sprite_ext(spr_colorWheel, 0, _cx, _cy, 1, 1, gui_angle, c_white, 1);
    draw_sprite_ext(spr_ticker, 0, _cx + 300, _cy, 0.3, 0.5, 270, c_red, 1);
    draw_set_halign(fa_left);

    offset = 32;
    testing = "10";
    draw_set_color(c_green);
    draw_text(32, offset, "Green: " + testing);
    draw_set_color(c_red);
    draw_text(32, offset + 20, "Red: " + testing);
    draw_set_color(c_purple);
    draw_text(32, offset + 40, "Purple: " + testing);
    draw_set_color(c_blue);
    draw_text(32, offset + 60, "Blue: " + testing);
    draw_set_color(c_yellow);
    draw_text(32, offset + 80, "Yellow: " + testing);
    draw_set_color(c_orange);
    draw_text(32, offset + 100, "Orange: " + testing);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(_cx, _cy + 120, "Press [V] to SPIN or [K] to SKIP");
    draw_set_halign(fa_left);

    if (keyboard_check_pressed(ord("V")) && !is_spinning && !spun) {
        spin_speed = random_range(5, 100);
        is_spinning = true;
        spun = true;
    }

    if (keyboard_check_pressed(ord("K"))) {
        wheel_active = false;
    }
}