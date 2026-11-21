if (!triggered && !instance_exists(obj_dialogue)) {
    triggered = true;
    waiting_for_dialogue = true;

    var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
    _box.dialogue_lines = dialogue_lines;
    _box.current_line = 0;
    _box.char_index = 0;
    _box.active = true;
}