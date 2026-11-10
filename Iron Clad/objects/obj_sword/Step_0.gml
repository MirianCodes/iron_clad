if (instance_exists(obj_player)) {
    x = obj_player.x + 80;
    y = obj_player.y - 175;
    
    if (keyboard_check_pressed(vk_space) && !is_attacking) {
        is_attacking = true;
        attack_timer = 12;
    }
    
    if (is_attacking) {
        attack_timer--;
        image_angle = -60;
        
        if (attack_timer <= 0) {
            is_attacking = false;
            image_angle = 0;
        }
    } else {
        image_angle = 0;
    }
} else {
    instance_destroy();
}