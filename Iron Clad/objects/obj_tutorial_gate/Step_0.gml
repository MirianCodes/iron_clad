if (is_open) {
    open_alpha = max(0, open_alpha - 0.08); // fade out 
    solid = false;
} else {
    open_alpha = min(1, open_alpha + 0.08); 
    solid = true;
}
image_alpha = open_alpha;