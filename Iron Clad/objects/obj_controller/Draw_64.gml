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
var _guilt_y = _hp_y + _bar_h + 10;
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

// guilt overlays
if (global.forced_guilt_timer > 0) {
    global.forced_guilt_timer--;
}

var _is_wheel_guilt_trip = (global.forced_guilt_timer > 0);
var _overlay_spr = noone;
var _overlay_alpha = 0;

if (_is_wheel_guilt_trip) {
    // Wheel guilt trip: push into high overlay with pulse
    _overlay_spr = spr_guilt_high;
    var _pulse = 0.06 * sin(current_time * 0.012);
    _overlay_alpha = clamp(0.78 + _pulse, 0.65, 0.90);
} else if (global.guilt >= 5) {
    // High guilt 
    _overlay_spr = spr_guilt_high;
    _overlay_alpha = 0.72;
} else if (global.guilt >= 2) {
    // Medium guilt 
    _overlay_spr = spr_guilt_med;
    _overlay_alpha = clamp(0.45 + (global.guilt - 2) * 0.10, 0.45, 0.65);
} else if (global.guilt == 1) {
    // Low/early guilt 
    _overlay_spr = spr_guilt_med;
    _overlay_alpha = 0.35;
} else {
    // 0 guilt light vignette
    _overlay_spr = spr_guilt_low;
    _overlay_alpha = 0.25;
}

if (_overlay_spr != noone && sprite_exists(_overlay_spr) && _overlay_alpha > 0) {
    draw_sprite_stretched_ext(_overlay_spr, 0, 0, 0, _w, _h, c_white, _overlay_alpha);
}

//redraw health and hp over guilt overlays
draw_set_alpha(1.0);
draw_set_color(c_white);

// health bg + border
draw_set_color(c_dkgrey);
draw_rectangle(_bar_x, _hp_y, _bar_x + _bar_w, _hp_y + _bar_h, false);
draw_set_color(c_red);
draw_rectangle(_bar_x, _hp_y, _bar_x + (_bar_w * _hp_pct), _hp_y + _bar_h, false);
draw_set_color(c_white);
draw_rectangle(_bar_x, _hp_y, _bar_x + _bar_w, _hp_y + _bar_h, true);
draw_text(_bar_x + _bar_w + 10, _hp_y - 2, "HP: " + string(global.player_hp) + "/" + string(global.max_hp));

// guilt Background + Border
draw_set_color(c_dkgrey);
draw_rectangle(_bar_x, _guilt_y, _bar_x + _bar_w, _guilt_y + _bar_h, false);
draw_set_color(make_color_rgb(128, 0, 128)); 
draw_rectangle(_bar_x, _guilt_y, _bar_x + (_bar_w * _guilt_pct), _guilt_y + _bar_h, false);
draw_set_color(c_white);
draw_rectangle(_bar_x, _guilt_y, _bar_x + _bar_w, _guilt_y + _bar_h, true);
draw_text(_bar_x + _bar_w + 10, _guilt_y - 2, "GUILT: " + string(global.guilt));