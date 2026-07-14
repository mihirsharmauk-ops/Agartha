x_spd = 0;
y_spd = 0;

move_speed = 2.5;
grav = 0.5;
jump_force = -8;

y_spd += grav;

// Chase player
if (instance_exists(oBloke)) {
    // Horizontal chase
    if (oBloke.x < x - 4) {
        x_spd = -move_speed;
        image_xscale = -0.1;
    } else if (oBloke.x > x + 4) {
        x_spd = move_speed;
        image_xscale = 0.1;
    }

    // Jump when player is above and reachable
    var _on_ground = place_meeting(x, y + 1, oSolid);
    if (_on_ground && oBloke.y < y - 20 && abs(oBloke.x - x) < 160) {
        y_spd = jump_force;
    }
}

// Move horizontally
if (place_meeting(x + x_spd, y, oSolid)) {
    while (!place_meeting(x + sign(x_spd), y, oSolid)) {
        x += sign(x_spd);
    }
    x_spd = 0;
}
x += x_spd;

// Move vertically
if (place_meeting(x, y + y_spd, oSolid)) {
    while (!place_meeting(x, y + sign(y_spd), oSolid)) {
        y += sign(y_spd);
    }
    y_spd = 0;
}
y += y_spd;

// Collision with player ends the game
if (instance_exists(oBloke)) {
    if (place_meeting(x, y, oBloke)) {
        room_goto(GameOver);
    }
}


