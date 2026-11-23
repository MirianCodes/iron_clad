if (my_path != -1 && path_exists(my_path)) {
    path_start(my_path, movement_speed, path_end_mode, false);
    spawn_x = x;
    spawn_y = y;
    return_x = x;
    return_y = y;
}