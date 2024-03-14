x = mouse_x;
y = mouse_y;
mouse_rope.endPin = keyboard_check(vk_space);

mouse_rope.pos[0].Set(x, y);
mouse_rope.update_points();
repeat(50) {
	mouse_rope.constrain_points();
}

if (mouse_check_button_pressed(mb_left)) draw_mode = (draw_mode+1) mod 3;