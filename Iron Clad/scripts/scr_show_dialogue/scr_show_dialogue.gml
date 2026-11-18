function scr_show_dialogue(_lines) {
    if (!instance_exists(obj_dialogue)) {
        var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
        _box.dialogue_lines = _lines;
    }
}