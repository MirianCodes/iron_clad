if (instance_exists(obj_player)) {
    x = obj_player.x + 80;
    y = obj_player.y - 175;
} else {
    instance_destroy();
}