if (waiting_for_dialogue && !instance_exists(obj_dialogue)) {
    waiting_for_dialogue = false;

    if (room_exists(target_room)) {
        global.next_spawn_x = spawn_x;
        global.next_spawn_y = spawn_y;
        room_goto(target_room);
    }

    instance_destroy();
}