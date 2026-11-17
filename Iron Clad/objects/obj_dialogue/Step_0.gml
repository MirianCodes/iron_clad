if (!active) exit;

var _full_text = dialogue_lines[current_line];

//characters one by one
if (char_index < string_length(_full_text)) {
    char_index += type_speed;
    
    //  E/ Space to skip typing and show the whole line
    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
        char_index = string_length(_full_text);
    }
} else {
    // Line finished, press E /Space to advance or close
    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
        current_line++;
        char_index = 0;
        
        if (current_line >= array_length(dialogue_lines)) {
            active = false;
            instance_destroy();
        }
    }
}