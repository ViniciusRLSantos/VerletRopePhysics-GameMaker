x += (mouse_x - x)/2;
y += (mouse_y - y)/2;
mouse_rope.endPin = mouse_check_button(mb_right);
if (y < room_height/2) {
	mouse_rope.force.x = wave(-2, -5, 1.1);
	mouse_rope.force.y = wave(-0.5, -0.75, 1.1);
} else {
	mouse_rope.force.x = lerp(mouse_rope.force.x, -0.8, 0.1);
	mouse_rope.force.y = lerp(mouse_rope.force.y, 0, 0.1);
}


mouse_rope.pos[0].Set(x, y);
mouse_rope.update_points();
repeat(80) {
	mouse_rope.constrain_points();
}
var prev_len = len;
len += keyboard_check_pressed(ord("W")) - keyboard_check_pressed(ord("S"));
len = clamp(len, 8, 50);
if (prev_len != len) {
	prev_len = len;
	mouse_rope.resize_rope(len);
}

if (mouse_check_button_pressed(mb_left)) draw_mode = (draw_mode+1) mod 3;