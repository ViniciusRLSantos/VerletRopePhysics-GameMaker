len = 8;
mouse_rope = new VerletRope(
	Vector2(mouse_x, mouse_y),
	len, 1,
	Vector2(0, 0.5),
	0.1, true, false
);
iterations = 5;
max_fps = -1000;
min_fps = infinity;
alarm[0] = room_speed;

draw_mode = 1;