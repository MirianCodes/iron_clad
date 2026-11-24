lever_id = 1;         
is_pulled = false;
lever_state = 0;   
interact_range = 320;

var _sx = (image_xscale != 0) ? image_xscale : 1;
var _sy = (image_yscale != 0) ? image_yscale : 1;
base_xscale = _sx;
base_yscale = _sy;
image_xscale = base_xscale;
image_yscale = base_yscale;

image_speed = 0;
image_index = 0;
image_blend = c_white;