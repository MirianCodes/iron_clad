if (other.is_attacking && hit_cooldown == 0 && !is_spared) {
    hp--;
    hit_cooldown = 30;
    
    if (hp <= 0) {
        global.guilt += 1;
        instance_destroy();
    }
}