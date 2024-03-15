draw_set_color(c_white);
draw_set_font(fntMain);
var modes = ["Dots", "Round Line", "Hair"];
draw_text(4, 4, $"{modes[draw_mode]} mode\nConstrain Steps: {iterations}");


draw_set_valign(fa_bottom);
draw_text(4, RESOLUTION_H-4, $"Fps: {fps_real}\nMin Fps: {min_fps}\nMax Fps: {max_fps}");

draw_set_halign(fa_right);
var info = $"Gravity Vector: ({mouse_rope.grav[X]}, {mouse_rope.grav[Y]})\nForce Vector: ({mouse_rope.force[X]}, {mouse_rope.force[Y]})"
	draw_text(RESOLUTION_W-4, RESOLUTION_H-4, info);
draw_set_valign(fa_top);
	draw_text(RESOLUTION_W-4, 4, $"VM compiler");

draw_set_halign(fa_left);

