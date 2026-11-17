if (!active) exit;

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _margin = 40;
var _box_h = 150;
var _x1 = _margin;
var _y1 = _gui_h - _box_h - _margin;
var _x2 = _gui_w - _margin;
var _y2 = _gui_h - _margin;

// border
draw_set_color(c_white);
draw_rectangle(_x1 - 5, _y1 - 5, _x2 + 5, _y2 + 5, false);

// innards
draw_set_color(c_black);
draw_rectangle(_x1, _y1, _x2, _y2, false);

// text
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _visible_text = string_copy(dialogue_lines[current_line], 1, floor(char_index));
var _text_max_w = (_x2 - _x1) - 48;

draw_text_ext(_x1 + 24, _y1 + 22, _visible_text, 26, _text_max_w);

// E prompt
if (char_index >= string_length(dialogue_lines[current_line])) {
    if ((current_time div 400) mod 2 == 0) {
        draw_set_halign(fa_right);
        draw_text(_x2 - 20, _y2 - 32, "[E] ▼");
        draw_set_halign(fa_left);
    }
}