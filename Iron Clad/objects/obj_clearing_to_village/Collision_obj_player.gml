if (!triggered && !instance_exists(obj_dialogue)) {
    triggered = true;

    //first visit five dialogue, then no dialogue
    if (!global.village_intro_seen) {
        global.village_intro_seen = true;
        waiting_for_dialogue = true;

        var _box = instance_create_layer(0, 0, layer, obj_dialogue);
        _box.dialogue_lines = my_dialogue;
    } 
    else if (room_exists(target_room)) {
        global.next_spawn_x = spawn_x;
        global.next_spawn_y = spawn_y;
        room_goto(target_room);
    }
}