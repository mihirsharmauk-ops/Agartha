x_speed = 0;
y_speed = 0;

walk_speed = 4;
grav = 0.5;

y_speed += grav;

if keyboard_check(vk_right) {
    x_speed = walk_speed;
    image_xscale = 0.1;
} else if keyboard_check(vk_left) {
    x_speed = -walk_speed;
    image_xscale = -0.1;
}

//CHECK IF ON GROUND
if (place_meeting(x, y + 1, oSolid)) {
    if (keyboard_check_pressed(vk_up)) {
        y_speed = -10;
    } else {
        y_speed = 0;
    }
}

//MOVE HORIZONTALLY
if (place_meeting(x + x_speed, y, oSolid)) {
    while (!place_meeting(x + sign(x_speed), y, oSolid)) {
        x += sign(x_speed);
    }
    x_speed = 0;
}
x += x_speed;

//MOVE VERTICALLY
if (place_meeting(x, y + y_speed, oSolid)) {
    while (!place_meeting(x, y + sign(y_speed), oSolid)) {
        y += sign(y_speed);
    }
    y_speed = 0;
}
y += y_speed;

if (place_meeting(x, y, oSpikes)) {
    room_goto(GameOver);
}
