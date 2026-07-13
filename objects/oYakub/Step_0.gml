x_spd = 0;
y_spd = 0;

move_speed = 2.5;
grav = 2;
jump_force = -10;

y_spd += grav;

// Follow player
if (instance_exists(oBloke)) {
    var _dist = point_distance(x, y, oBloke.x, oBloke.y);

    // Horizontal chase
    if (oBloke.x < x) {
        x_spd = -move_speed;
        image_xscale = -0.1;
    } else {
        x_spd = move_speed;
        image_xscale = 0.1;
    }

    // Jump when player is above and we're on the ground
    var _on_ground = place_meeting(x, y + 1, oSolid);
    if (_on_ground && oBloke.y < y - 16 && abs(oBloke.x - x) < 120) {
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
    if (distance_to_object(oBloke) < 16) {
        room_goto(GameOver);
    }
}

// Collides with spikes
if (place_meeting(x, y, oSpikes)) {
    room_goto(GameOver);
}
