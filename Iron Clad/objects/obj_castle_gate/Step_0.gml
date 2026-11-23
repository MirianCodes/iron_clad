if (is_open && !fading_out) {
    fading_out = true;
}

if (fading_out) {
    image_alpha -= fade_speed;
    if (image_alpha <= 0) {
        image_alpha = 0;
        instance_destroy();
    }
}