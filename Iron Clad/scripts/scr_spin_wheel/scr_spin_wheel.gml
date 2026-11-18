///@param {Real} outcome
function scr_spin_wheel(outcome) {
    if (outcome == 360) {
        outcome = 0;
    }
    var _roll = outcome div 60;
    var _lines = [];

    switch (_roll + 1) {
        case 1: // King's Blessing
            global.double_damage_timer = 1800;
            _lines = [
                "* KING'S BLESSING!",
                "* Ancient royal fury surges through your blade. Your attacks deal DOUBLE DAMAGE for 30 seconds!"
            ];
            break;
            
        case 2: // Enhanced Armour
            if (global.player_hp < 5) {
                global.player_hp += 1;
                _lines = [
                    "* ENHANCED ARMOUR!",
                    "* Spectral iron reinforces your plating. You recovered 1 HP!"
                ];
            } else {
                _lines = [
                    "* ENHANCED ARMOUR!",
                    "* Spectral iron reinforces your plating, though your health is already at its peak!"
                ];
            }
            break;
            
        case 3: // Flying Feet
            global.speed_boost_timer = 1800; 
            _lines = [
                "* FLYING FEET!",
                "* The weight of your armor vanishes like ash in the wind. Movement speed increased for 30 seconds!"
            ];
            break;
            
        case 4: // Blood Curse
            global.player_hp = max(0, global.player_hp - 1);
            _lines = [
                "* BLOOD CURSE!",
                "* The wheel demands a crimson toll. Pain sears through your chest, you lost 1 HP!"
            ];
            break;
            
        case 5: // Guilt Trip
            global.forced_guilt_timer = 1800; // 30 seconds of extreme guilt overlay
            _lines = [
                "* GUILT TRIP!",
                "* Memories of every fallen soul cloud your sight. Heavy guilt overwhelms your vision for 30 seconds!"
            ];
            break;
            
        case 6: // Extra / Neutral Fate
            _lines = [
                "* FATE'S SILENCE...",
                "* The runes flicker and die out. Neither blessing nor curse claims you today."
            ];
            break;
    }

    // Spawn the dialogue box 
    if (!instance_exists(obj_dialogue)) {
        var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
        _box.dialogue_lines = _lines;
    }

    // delete runstone
    if (instance_exists(id)) {
        instance_destroy();
    }
}