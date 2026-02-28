x_spd = 0;
y_spd = 0;

move_speed = 2;
grav = 2;

y_spd += grav;

// Follow player horizontally
if (instance_exists(oBloke)) {

    if (oBloke.x < x) {
        x_spd = -move_speed;
		 image_xscale = -0.1; //faces left
    } else {
        x_spd = move_speed;
		image_xscale = 0.1; //faces right
    }
}

if (place_meeting(x + x_spd, y, oSolid)) {
    while (!place_meeting(x + sign(x_spd), y, oSolid)) {
        x += sign(x_spd);
    }
    x_spd = 0;
}
x += x_spd;


if (place_meeting(x, y + y_spd, oSolid)) {
    while (!place_meeting(x, y + sign(y_spd), oSolid)) {
        y += sign(y_spd);
    }
    y_spd = 0;
}
y += y_spd;

if (on_ground && obj_player.y < y - 32) {
    vsp = -8;
}

if (oBloke.x = x && o.Bloke.y == y)
{
	room_goto(rm_GameOver);
}
