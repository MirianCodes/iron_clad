function scr_spin_wheel() {
    var _roll = irandom_range(1, 5);

    switch (_roll) {
        case 1: // Kings blessing
            global.double_damage_timer = 1800; 
            break;
            
        case 2: // Enhanced Armour
            if (global.player_hp < 5) {
                global.player_hp += 1;
            }
            break;
            
        case 3: // Flying Feet
            global.speed_boost_timer = 1800; // 30 seconds at 60 FPS
            //add some dialogue
            break;
            
        case 4: // Blood Curse
            global.player_hp = max(0, global.player_hp - 1);
            //add dialogiue
            break;
            
        case 5: // Guilt trip
            global.forced_guilt_timer = 1800; // 30 seconds of extreme guilt overlay
            //add dialogue
            break;
    }
}