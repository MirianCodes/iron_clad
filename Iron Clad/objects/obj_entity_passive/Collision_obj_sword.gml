if (other.is_attacking && hit_cooldown == 0 && !is_spared) {
    hp--;
    hit_cooldown = 30;
    
    if (hp <= 0) {
        global.guilt += 1;
        
        // Trigger the kill dialogue box
        if (!instance_exists(obj_dialogue)) {
            var _box = instance_create_layer(0, 0, "Instances", obj_dialogue);
            _box.dialogue_lines = [
                "* The spirit shatters into cold, fading embers.",
                "* You struck it down without mercy. Your guilt grows heavier."
            ];
        }
        
        instance_destroy();
    }
}