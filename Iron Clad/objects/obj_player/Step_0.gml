// Pause player movement while dialogue is open
if (instance_exists(obj_dialogue)) exit;

// --- Speed (with boost) ---
var current_speed = variable_global_exists("player_speed") ? global.player_speed : 3;
if (global.speed_boost_timer > 0) {
    global.speed_boost_timer--;
    current_speed *= 1.5;
}

// --- Input ---
var _hmove = (keyboard_check(ord("D")) || keyboard_check(vk_right)) - (keyboard_check(ord("A")) || keyboard_check(vk_left));
var _vmove = (keyboard_check(ord("S")) || keyboard_check(vk_down)) - (keyboard_check(ord("W")) || keyboard_check(vk_up));

if (_hmove != 0 || _vmove != 0) {
    var _dir = point_direction(0, 0, _hmove, _vmove);
    var _xspd = lengthdir_x(current_speed, _dir);
    var _yspd = lengthdir_y(current_speed, _dir);

    // --- Horizontal movement & Rock Pushing ---
    var _rock_h = instance_place(x + _xspd, y, obj_pushable_rock);
    if (_rock_h != noone) {
        var _push_x = sign(_xspd) * _rock_h.push_speed;
        var _rock_gate_h = instance_place(_rock_h.x + _push_x, _rock_h.y, obj_tutorial_gate);
        if (!place_meeting(_rock_h.x + _push_x, _rock_h.y, obj_wall) && 
            (_rock_gate_h == noone || _rock_gate_h.is_open)) {
            _rock_h.x += _push_x;
            _xspd = _push_x; // Match player speed to the heavy push speed
        } else {
            _xspd = 0; // Rock is blocked by wall/gate, stop player
        }
    }

    var _gate_h = instance_place(x + _xspd, y, obj_tutorial_gate);
    if (!place_meeting(x + _xspd, y, obj_wall) && (_gate_h == noone || _gate_h.is_open)) {
        x += _xspd;
    } else {
        while (!place_meeting(x + sign(_xspd), y, obj_wall)) {
            var _step_gate_h = instance_place(x + sign(_xspd), y, obj_tutorial_gate);
            if (_step_gate_h != noone && !_step_gate_h.is_open) break;
            x += sign(_xspd);
        }
    }

    // --- Vertical movement & Rock Pushing ---
    var _rock_v = instance_place(x, y + _yspd, obj_pushable_rock);
    if (_rock_v != noone) {
        var _push_y = sign(_yspd) * _rock_v.push_speed;
        var _rock_gate_v = instance_place(_rock_v.x, _rock_v.y + _push_y, obj_tutorial_gate);
        if (!place_meeting(_rock_v.x, _rock_v.y + _push_y, obj_wall) && 
            (_rock_gate_v == noone || _rock_gate_v.is_open)) {
            _rock_v.y += _push_y;
            _yspd = _push_y; // Match player speed to the heavy push speed
        } else {
            _yspd = 0; // Rock is blocked by wall/gate, stop player
        }
    }

    var _gate_v = instance_place(x, y + _yspd, obj_tutorial_gate);
    if (!place_meeting(x, y + _yspd, obj_wall) && (_gate_v == noone || _gate_v.is_open)) {
        y += _yspd;
    } else {
        while (!place_meeting(x, y + sign(_yspd), obj_wall)) {
            var _step_gate_v = instance_place(x, y + sign(_yspd), obj_tutorial_gate);
            if (_step_gate_v != noone && !_step_gate_v.is_open) break;
            y += sign(_yspd);
        }
    }

    // --- Animation ---
    image_speed = current_speed / 3;   // 1 normally, 1.5 with speed boost

    if (_hmove != 0) {
        // sprite_index = spr_sidewalk;   // add when I have it
        image_xscale = abs(image_yscale) * sign(_hmove) * -1;   // remove the * -1 if the sprite faces right
    }
    else if (_vmove > 0) {
        sprite_index = spr_frontwalk;
        image_xscale = abs(image_yscale);
    }
    else if (_vmove < 0) {
        // sprite_index = spr_backwalk;   // add when I have it
        image_xscale = abs(image_yscale);
    }
} else {
    image_speed = 0;
    image_index = 0;
}

// --- Sword ---
if (keyboard_check_pressed(vk_space)) {
    with (obj_sword) {
        image_angle += 45;
    }
}

// --- Hit cooldown / flash ---
if (player_hit_cooldown > 0) {
    player_hit_cooldown--;
}
if (player_hit_cooldown > 120 - 12) {
    image_blend = c_red;
} else {
    image_blend = c_white;
}

if (!variable_instance_exists(id, "portal_cooldown")) {
    portal_cooldown = 0;
}
if (portal_cooldown > 0) {
    portal_cooldown--;
}