var _hmove = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left));
var _vmove = (keyboard_check(ord("S")) || keyboard_check(vk_down)) - (keyboard_check(ord("W")) || keyboard_check(vk_up));

if (_hmove != 0 || _vmove != 0) {
    var _dir = point_direction(0, 0, _hmove, _vmove);
    var _spd = variable_global_exists("player_speed") ? global.player_speed : 3;
    
    var _xspd = lengthdir_x(_spd, _dir);
    var _yspd = lengthdir_y(_spd, _dir);
    
    // Horizontal movement
    if (!place_meeting(x + _xspd, y, obj_wall)) {
        x += _xspd;
    } else {
        while (!place_meeting(x + sign(_xspd), y, obj_wall)) {
            x += sign(_xspd);
        }
    }
    
    // Vertical movement
    if (!place_meeting(x, y + _yspd, obj_wall)) {
        y += _yspd;
    } else {
        while (!place_meeting(x, y + sign(_yspd), obj_wall)) {
            y += sign(_yspd);
        }
    }
}
if (keyboard_check_pressed(vk_space)) {
    with (obj_sword) {
        image_angle += 45;
    }
}
if (player_hit_cooldown > 0) {
    player_hit_cooldown--;
}
if (player_hit_cooldown > 0) {
    player_hit_cooldown--;
}
if (player_hit_cooldown > 120 - 12) {
    image_blend = c_red;
} else {
    image_blend = c_white;
}
var current_speed = global.player_speed;
if (global.speed_boost_timer > 0) {
    global.speed_boost_timer--;
    current_speed *= 1.5; // 50% speed increase for wheel
}