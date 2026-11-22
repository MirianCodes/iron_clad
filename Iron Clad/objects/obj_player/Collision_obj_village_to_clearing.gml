if (!instance_exists(obj_dialogue) && room_exists(rm_cursed_clearing)) {
    if (!variable_instance_exists(id, "portal_cooldown") || portal_cooldown <= 0) {
        portal_cooldown = 25;
        global.next_spawn_x = 2016;
        global.next_spawn_y = 1632;
        room_goto(rm_cursed_clearing);
    }
}