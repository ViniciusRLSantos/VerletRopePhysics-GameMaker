var mx = window_view_mouse_get_x(view_camera[0]),
my = window_view_mouse_get_y(view_camera[0]);

x += (mouse_x - x)/2;
y += (mouse_y - y)/2;
mouse_rope.endPin = mouse_check_button(mb_right);
if (y < room_height/2) {
	mouse_rope.force[X] = wave(2, 5, 1.1);
	mouse_rope.force[Y] = wave(-1, 0.5, 0.5);
} else {
	mouse_rope.force[X] = lerp(mouse_rope.force[X], -0.35*(draw_mode==2), 0.1);
	mouse_rope.force[Y] = lerp(mouse_rope.force[Y], 0, 0.1);
}


mouse_rope.pos[0] = Vector2(x, y);
mouse_rope.update_points();
repeat(iterations) {
	mouse_rope.constrain_points();
}
var prev_len = len;
len += keyboard_check_pressed(ord("W")) - keyboard_check_pressed(ord("S"));
len = clamp(len, 5, 50);
if (prev_len != len) {
	prev_len = len;
	mouse_rope.resize_rope(len);
}

iterations = clamp(iterations+(mouse_wheel_up() - mouse_wheel_down()), 1, 80);

if (fps_real > max_fps) max_fps = fps_real;
if (mouse_check_button_pressed(mb_left)) draw_mode = (draw_mode+1) mod 3;