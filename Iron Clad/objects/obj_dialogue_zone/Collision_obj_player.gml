if (!instance_exists(obj_dialogue)) {
    // Reset stats if this is the exit zone
    global.guilt = 0;
    global.speed_boost_timer = 0;
    
    var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
    _box.dialogue_lines = my_dialogue;
    
    // Uncomment when Wastelands room is made
    // if (room_exists(rm_wastelands_main)) {
    //     room_goto(rm_wastelands_main);
    // }
    
    instance_destroy(); 
}