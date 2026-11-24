var _overlay_col = c_white;
var _overlay_alpha = 0;

if (lever_state == 1) {
    _overlay_col = c_lime;
    _overlay_alpha = 0.35;
} else if (lever_state == 2) {
    _overlay_col = c_red;
    _overlay_alpha = 0.40;
}

//base lever with current horizontal mirror
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

//green or red overlay on top
if (_overlay_alpha > 0) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _overlay_col, _overlay_alpha);
}