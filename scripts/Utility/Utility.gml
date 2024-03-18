// Utility functions
function wave(from, to, duration, offset=0){
	a4 = (to - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;
}

function outline_begin(width, height, color=[0.0, 0.0, 0.0], thickness=1) {
	shader_set(shdOutline);
	var _color = shader_get_uniform(shdOutline, "outlineColor");
	shader_set_uniform_f(_color, color[0], color[1], color[2]);
	
	var _width = shader_get_uniform(shdOutline, "outlineW");
	shader_set_uniform_f(_width, thickness/(width));
	var _height = shader_get_uniform(shdOutline, "outlineH");
	shader_set_uniform_f(_height, thickness/height);
}

function outline_end() {
	shader_reset(); 
}