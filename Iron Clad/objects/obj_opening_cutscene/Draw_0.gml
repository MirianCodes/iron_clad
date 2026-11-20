//background
draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, room_width, room_height, false);

// Draw current cutscene sprite (frame 0) with upward glide and fade
if (slide_index < array_length(slides) && alpha > 0) {
    var _slide = slides[slide_index];
    draw_sprite_ext(
        _slide.spr,
        0,
        base_x,
        base_y + glide_offset_y,
        1,
        1,
        0,
        c_white,
        alpha
    );
}

// Smooth black transition into the tutorial room
if (room_fade_alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(room_fade_alpha);
    draw_rectangle(0, 0, room_width, room_height, false);
}

draw_set_alpha(1);
draw_set_color(c_white);