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
		mouse_rope.draw_hair_sprite(0.4);
		draw_sprite(sPlayer, 0, x, y-1);
	break;
}
draw_set_color(c_white);
draw_set_font(fntMain);
var modes = ["Dots", "Round Line", "Hair"];
draw_text(4, 4, $"{modes[draw_mode]} mode");
