if (!instance_exists(obj_dialogue)) {
    if (variable_instance_exists(id, "is_exit_zone") && is_exit_zone) {
        global.speed_boost_timer = 0;
    }

    var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
    _box.dialogue_lines = my_dialogue;

    instance_destroy();
}