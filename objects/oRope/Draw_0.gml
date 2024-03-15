draw_set_color(c_lime);
draw_set_alpha(0.125);
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H/2, false);
draw_set_alpha(0.45);
draw_set_color(c_white);
	draw_set_halign(fa_center);
		draw_text(RESOLUTION_W/2, RESOLUTION_H/4, "Wind Area");
	draw_set_halign(fa_left);
draw_set_alpha(1);

switch(draw_mode) {
	case 0:
		draw_set_color(c_black);
		mouse_rope.draw_points_circle(4);
		draw_set_color(c_white);
		mouse_rope.draw_points_circle(2);
	break;
	
	case 1:
		draw_set_color(c_black);
		mouse_rope.draw_points_circle(4);
		mouse_rope.draw_points_line(4);
		draw_set_color(c_white);
		mouse_rope.draw_points_circle(2);
		mouse_rope.draw_points_line(2);
	break;
	
	case 2:
		/*
		draw_set_color(c_black);
		mouse_rope.draw_hair(5, 3);
		draw_set_color(#AC3232);
		mouse_rope.draw_hair(4, 2);
		*/
		mouse_rope.draw_hair_sprite(0.35);
		draw_sprite(sPlayer, 0, x, y-1);
	break;
}
