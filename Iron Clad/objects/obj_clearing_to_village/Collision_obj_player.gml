if (!triggered && !instance_exists(obj_dialogue)) {
    triggered = true;
    waiting_for_dialogue = true;

    var _box = instance_create_layer(0, 0, layer, obj_dialogue);
    _box.dialogue_lines = my_dialogue;
}