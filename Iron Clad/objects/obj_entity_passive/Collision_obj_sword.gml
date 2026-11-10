if (hit_cooldown == 0 && !is_spared) {
    hp--;
    hit_cooldown = 30;
    
    if (hp <= 0) {
        instance_destroy();
    }
}