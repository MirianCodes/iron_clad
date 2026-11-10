if (!is_spared) {
    if (obj_player.player_hit_cooldown == 0) {
        if (global.player_hp > 0) {
            global.player_hp -= 1;
        }
        obj_player.player_hit_cooldown = 120; //prevent health plummeting
    }
}