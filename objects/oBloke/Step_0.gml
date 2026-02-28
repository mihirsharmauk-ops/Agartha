x_speed = 0;
y_speed = 0;
walk_speed = 4;
 
x_speed = 0;
y_speed += 2
if keyboard_check(vk_right) 
{
	x_speed = walk_speed;
}
else if keyboard_check(vk_left)
{
	x_speed = -walk_speed;
}
 
//CHECK IF ON GROUND
if (place_meeting(x, y + 1, oSolid)) { 

    if (keyboard_check_pressed(vk_up)) {

        y_speed = -60;

    } else { 

        y_speed = 0; 

    }

}

//MOVE HORIZONTALLY
move_and_collide(x_speed, 0, oSolid);
 
//MOVE VERTICALLY
move_and_collide(0, y_speed, oSolid);



if (place_meeting(x, y, oSpikes)) { //collides with spikes

    room_restart() // restart the level

}

if keyboard_check(vk_right) {

    x_speed = walk_speed; 

    image_xscale = 0.1; //faces right

} else if keyboard_check(vk_left) {

    x_speed = -walk_speed; 

    image_xscale = -0.1; //faces left

}