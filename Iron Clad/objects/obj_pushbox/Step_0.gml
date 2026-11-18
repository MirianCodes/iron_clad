

if (distance_to_object(obj_player) < 20) {
	    if (keyboard_check_pressed(ord("F"))) {
	if( obj_player.x < x and abs(obj_player.y - y)< abs(obj_player.x - x)){
				push(4); //right
	}
	else if( obj_player.x >x and abs(obj_player.y - y)< abs(obj_player.x - x)){
				push(3); //left
	}
	else if( obj_player.y < y and abs(obj_player.x - x)< abs(obj_player.y - y)){
				push(2); //down
	}
	else if( obj_player.y > y and abs(obj_player.x - x)< abs(obj_player.y - y)){
				push(1); //up
	}
	else{}
		}
}

function push(dir){
	with(underneath){
		
	switch(dir){
		case 1: //push up
		 if(nb_up != noone){
			 other.x = nb_up.x;
			 other.y = nb_up.y;
		 }
		 break;
		 		case 2: //push down
		 if(nb_down != noone){
			 other.x = nb_down.x;
			 other.y = nb_down.y;
		 }
		 break;
		 		case 3: //push left
		 if(nb_left != noone){
			 other.x = nb_left.x;
			 other.y = nb_left.y;
		 }
		 break;
		 case 4: //push right
		 if(nb_right != noone){
			 other.x = nb_right.x;
			 other.y = nb_right.y;
		 }
		 break;
	}
	}
	underneath = instance_position(x, y, obj_boxgrid); 
}

			
