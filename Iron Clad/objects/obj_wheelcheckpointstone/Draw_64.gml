if (wheel_active) {
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1.0);
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
    
    draw_sprite(spr_wheel, 0, cx, cy);
    
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(cx, cy + 120, "Press [V] to SPIN or [K] to SKIP");
    draw_set_halign(fa_left); 
    

    if (keyboard_check_pressed(ord("V"))) {
        spin_speed = random_range(25, 35);
        is_spinning = true;
    }
    
    if (keyboard_check_pressed(ord("K"))) {
        scr_spin_wheel();
        wheel_active = false;
    }
}