// Four cutscene slides using individual sprites
slides = [
    {
        spr: spr_beginning_cutscene1,
        lines: [
            "Once, the kingdom stood proud beneath golden light, bound by oath and crown.",
            "The king sought to bend fate itself, and I swore to stand at his side."
        ]
    },
    {
        spr: spr_beginning_cutscene2,
        lines: [
            "Deep beneath the halls, the ancient wheel awoke with violent, untamed power.",
            "What we called a triumph tore open a rift no blade could seal."
        ]
    },
    {
        spr: spr_beginning_cutscene3,
        lines: [
            "Fire and shadow swallowed the streets as the curse claimed the land.",
            "Those who once walked in peace were left wandering as hollow ghosts."
        ]
    },
    {
        spr: spr_beginning_cutscene4,
        lines: [
            "I awoke alone in the ash and ruin, carrying the weight of what we broke.",
            "If this curse is to end, I must face the kingdom and my own guilt."
        ]
    }
];

slide_index = 0;

// Visual gliding & fade state for drama
phase = "fade_in"; 
alpha = 0;
fade_speed = 0.025;
room_fade_alpha = 0;

base_x = room_width * 0.5;
base_y = room_height * 0.44;
glide_offset_y = 18;
glide_lerp = 0.08;

spawn_current_slide_dialogue();

function spawn_current_slide_dialogue() {
    if (instance_exists(obj_dialogue)) {
        instance_destroy(obj_dialogue);
    }

    var _slide = slides[slide_index];
    var _inst = instance_create_layer(0, 0, "Instances", obj_dialogue);

    _inst.dialogue_lines = _slide.lines;
    _inst.current_line = 0;
    _inst.char_index = 0;
    _inst.active = true;
}