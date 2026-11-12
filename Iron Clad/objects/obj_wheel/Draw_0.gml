draw_sprite_ext(spr_wheel, 0, x, y, 1, 1, wheel_angle, c_white, 1);
draw_text(x - 50, y + 120, "[ SPIN ]");
draw_text(x + 20, y + 120, "[ SKIP ]");
if (!is_spinning) {
    spin_speed = random_range(25, 35);
    is_spinning = true;
}