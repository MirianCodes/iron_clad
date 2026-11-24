if (instance_exists(obj_dialogue)) exit;
if (!instance_exists(obj_lever_controller)) exit;
if (obj_lever_controller.puzzle_solved || obj_lever_controller.reset_timer > 0) exit;
image_yscale = base_yscale;

var _in_range = true;
if (instance_exists(obj_player)) {
    _in_range = (point_distance(obj_player.x, obj_player.y, x, y) <= interact_range);
}
//On click
if (_in_range && !is_pulled && mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    is_pulled = true;
    image_xscale = -base_xscale; // Flip horizontally to the opposite side

    var _ctrl = obj_lever_controller;
    var _expected = _ctrl.target_sequence[_ctrl.current_step];

    if (lever_id == _expected) {
        lever_state = 1;
        _ctrl.current_step += 1;

        if (_ctrl.current_step >= array_length(_ctrl.target_sequence)) {
            _ctrl.puzzle_solved = true;
            with (obj_castle_gate) is_open = true;

            var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
            _box.dialogue_lines = [
                "* All five levers lock into place with a deep resonant chime.",
                "* The wards binding the castle gate dissolve—the way forward is open!"
            ];
        } else {
            var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
            _box.dialogue_lines = [
                "* The lever locks in with a soft emerald glow."
            ];
        }
    } else {
        lever_state = 2;
        _ctrl.reset_timer = _ctrl.reset_delay;

        var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
        _box.dialogue_lines = [
            "* A harsh metallic grind echoes through the ruins—the lever flashes crimson!",
            "* All five levers snap back into place."
        ];
    }
}
var _desired_xscale = is_pulled ? -base_xscale : base_xscale;
image_xscale = _desired_xscale;
image_yscale = base_yscale;

