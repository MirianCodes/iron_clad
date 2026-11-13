if (wheel_active) {
	

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1.0);
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 2;
	if(spin_speed <= 0 and is_spinning){
		spin_speed=0;
		outcome = gui_angle;
		scr_spin_wheel(outcome);
		is_spinning=false;
	}
	
	if(!is_spinning){

	
    draw_sprite_ext(spr_colorWheel, 0, cx, cy, 1, 1, gui_angle, c_white, 1);
    draw_sprite_ext(spr_ticker, 0, cx+300, cy, .3, .5, 270, c_red, 1);
	draw_set_halign(fa_left);
	}
	else{
		gui_angle = (spin_speed+gui_angle) mod 360;
		    draw_sprite_ext(spr_colorWheel, 0, cx, cy, 1, 1, gui_angle, c_white, 1);
			draw_sprite_ext(spr_ticker, 0, cx+300, cy, .3, .5, 270, c_red, 1);
			if(spin_speed > 0){
			spin_speed = spin_speed-.05;
			}
	}
	
	offset = 32;
	testing = "10";
	draw_set_color(c_green);
	draw_text(32, offset, "Green: " + testing);
		draw_set_color(c_red);
	draw_text(32, offset+20, "Red: " + testing);
		draw_set_color(c_purple);
	draw_text(32, offset+40, "Purple: " + testing);
		draw_set_color(c_blue);
	draw_text(32, offset+60, "Blue: " + testing);
		draw_set_color(c_yellow);
	draw_text(32, offset+80, "Yellow: " + testing);
		draw_set_color(c_orange);
	draw_text(32, offset+100, "Orange: " + testing);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(cx, cy + 120, "Press [V] to SPIN or [K] to SKIP");
    draw_set_halign(fa_left); 

    if (keyboard_check_pressed(ord("V")) and !is_spinning) {
       spin_speed = random_range(9,10);
        is_spinning = true;
    }
    
    if (keyboard_check_pressed(ord("K"))) {
        wheel_active = false;
    }
}