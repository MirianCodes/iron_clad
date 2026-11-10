var _w = display_get_gui_width();
var _h = display_get_gui_height();

// bar positioning
var _bar_x = 25;
var _bar_w = 260;
var _bar_h = 25;

// health bar
var _hp_y = 25;
var _hp_pct = max(0, global.player_hp / global.max_hp);

// health bg + border
draw_set_color(c_dkgrey);
draw_rectangle(_bar_x, _hp_y, _bar_x + _bar_w, _hp_y + _bar_h, false);
draw_set_color(c_red);
draw_rectangle(_bar_x, _hp_y, _bar_x + (_bar_w * _hp_pct), _hp_y + _bar_h, false);
draw_set_color(c_white);
draw_rectangle(_bar_x, _hp_y, _bar_x + _bar_w, _hp_y + _bar_h, true);
draw_text(_bar_x + _bar_w + 10, _hp_y - 2, "HP: " + string(global.player_hp) + "/" + string(global.max_hp));


// guilt bar
var _guilt_y = _hp_y+ _bar_h +10;
var _max_guilt = 6; 
var _guilt_pct = clamp(global.guilt / _max_guilt, 0, 1);

// guilt Background + Border
draw_set_color(c_dkgrey);
draw_rectangle(_bar_x, _guilt_y, _bar_x + _bar_w, _guilt_y + _bar_h, false);
draw_set_color(make_color_rgb(128, 0, 128)); // Purple fill
draw_rectangle(_bar_x, _guilt_y, _bar_x + (_bar_w * _guilt_pct), _guilt_y + _bar_h, false);
draw_set_color(c_white);
draw_rectangle(_bar_x, _guilt_y, _bar_x + _bar_w, _guilt_y + _bar_h, true);
draw_text(_bar_x + _bar_w + 10, _guilt_y - 2, "GUILT: " + string(global.guilt));


// guilt visibal overlays
if (global.guilt >= 1) {
    draw_set_alpha(0.2); 
    draw_set_color(c_black); 
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1.0); 
}
if (global.guilt >= 2 && global.guilt <= 3) {
    // medium- make cleaner later
    draw_set_color(c_black);
    draw_set_alpha(0.4);
    draw_circle(0, 0, 180, false);
    draw_circle(_w, _h, 180, false);
    draw_set_alpha(1.0);
} else if (global.guilt >= 4) {
    // high- make cleaner later
    draw_set_color(c_black);
    draw_set_alpha(0.75);
    draw_circle(0, 0, 320, false);
    draw_circle(_w, _h, 320, false);
    draw_circle(_w/2, _h/2, 220, false);
    draw_set_alpha(1.0);
}