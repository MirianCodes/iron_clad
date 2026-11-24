//cheat codes for testing
// Ctrl + C -> Jump to clearing
if (keyboard_check_pressed(ord("C"))) {
        if (room_exists(rm_cursed_clearing)) {
            room_goto(rm_cursed_clearing);
        }
    }

    // Ctrl + V -> Jump to Village 
    if (keyboard_check_pressed(ord("V"))) {
        if (room_exists(Village)) {
            room_goto(Village);
        }
    }