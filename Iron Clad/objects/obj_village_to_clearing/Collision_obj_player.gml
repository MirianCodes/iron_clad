show_debug_message("VILLAGE RETURN TRIGGER HIT | cooldown=" + string(cooldown));

if (cooldown <= 0 && !instance_exists(obj_dialogue)) {
    if (room_exists(target_room)) {
        global.next_spawn_x = spawn_x;
        global.next_spawn_y = spawn_y;
        room_goto(target_room);
    } else {
        show_debug_message("ERROR: target_room does not exist!");
    }
}