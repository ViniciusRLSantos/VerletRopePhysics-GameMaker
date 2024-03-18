///@function VerletRope(start_position, ropeLength, constrain, gravity_vector, dampening, pin_start, pin_end)
///@param {Array} initial_position
///@param {Real} rope_length
///@param {Real} constrain
///@param {Array} gravity
///@param {Real} dampening
///@param {Bool} start_pin
///@param {Bool} end_pin
///@description Creates a rope object using verlet integration
function VerletRope(
	_pos=Vector2(), _ropeLength=30, _constrain=1, _gravity=Vector2(0, 0.5), _dampening=0.9, _startPin=true, _endPin=true
) constructor {
	ropeLength = _ropeLength;
	constrain = _constrain;
	grav = _gravity;
	force = Vector2();
	dampening = _dampening;
	startPin = _startPin;
	endPin = _endPin;
	
	position = _pos;
	pointCount = ceil(ropeLength/constrain);
    for (var i=0; i<pointCount; i++) {
        pos[i] = vec2_add(position, Vector2(constrain*i, 0));
        pos_previous[i] = vec2_add(position, Vector2(constrain*i, 0));
    }
    
    static resize_rope = function(_newLength) {
		ropeLength = _newLength;
		pointCount = ceil(ropeLength/constrain);
	    pos[pointCount-1] = vec2_add(pos[pointCount-2], Vector2(constrain*pointCount-1, constrain*pointCount-1));
	    pos_previous[pointCount-1] = vec2_add(pos[pointCount-2], Vector2(constrain*pointCount-1, constrain*pointCount-1));
	}
	
    static update_points = function() {
        for (var i=0; i<pointCount; i++) {
            if (i!=0 && i!=pointCount-1)
            || (i==0 && !startPin)
            || (i==pointCount-1 && !endPin) {
                var vel = Vector2((pos[i][X] - pos_previous[i][X])*dampening, (pos[i][Y] - pos_previous[i][Y])*dampening);
				
				var temp = Vector2(pos[i][X], pos[i][Y]);
				pos[i] = vec2_add(pos[i], Vector2(vel[X] + grav[X] + force[X], vel[Y] + grav[Y] + force[Y]));
                pos_previous[i] = temp;
            }
        }
    }
    
    static constrain_points = function() {
        for (var i=0; i<pointCount; i++) {
            if (i == pointCount-1) continue;
            
            var distance = vec2_distance(pos[i], pos[i+1]);
            var diff = constrain - distance;
            var percent = diff/distance;
            var vec2 = vec2_subtract(pos[i+1], pos[i]);
            
            if (i==0) {
                if (startPin) {
                    pos[i+1] = vec2_add(pos[i+1], Vector2(vec2[X]*percent, vec2[Y]*percent));
                } else {
                    pos[i] = vec2_subtract(pos[i], Vector2(vec2[X]*percent/2, vec2[Y]*percent/2));
                    pos[i+1] = vec2_add(pos[i+1], Vector2(vec2[X]*percent/2, vec2[Y]*percent/2));
                }
            } else if (i == pointCount-1) {
                continue;
            } else {
                if ((i+1) == pointCount-1 && endPin) {
                	pos[i] = vec2_subtract(pos[i], Vector2(vec2[X]*percent, vec2[Y]*percent));
                } else {
                    pos[i] = vec2_subtract(pos[i], Vector2(vec2[X]*percent/2, vec2[Y]*percent/2));
                    pos[i+1] = vec2_add(pos[i+1], Vector2(vec2[X]*percent/2, vec2[Y]*percent/2))
                }
            }
        }
    }
	
	static draw_points_line = function(radius=pointCount) {
	    for (var i=0; i<pointCount-1; i++) {
			draw_line_width(pos[i][X], pos[i][Y], pos[i+1][X], pos[i+1][Y], radius);
	    }
	}
	
	static draw_points_circle = function(radius=pointCount) {
	    for (var i=0; i<pointCount; i++) {
	        draw_circle(pos[i][X], pos[i][Y], (radius)/2, false);
	    }
	}
	
	static draw_hair = function(radius=10, min_radius=-1) {
		if (min_radius == -1) {
			min_radius = radius/2;
		}
		
		for (var i=0; i<pointCount; i++) {
			var dist = min(ropeLength, pos[i].distance_to(pos[0]))
			var percent = (ropeLength-dist)/ropeLength;
			var r = max(min_radius, floor(percent*radius))
	        draw_circle(pos[i][X], pos[i][Y], (r), false);
	    }
	}
	
	static draw_hair_sprite = function(min_scale = 0.5) {
		
		var _hair_surf = -1;
		if (!surface_exists(_hair_surf)) {
			_hair_surf = surface_create(room_width, room_height);
		}
		
		surface_set_target(_hair_surf);
		draw_clear_alpha(c_black, 0.0);
			for (var i=pointCount-1; i>=0; i--) {
				var len = ropeLength*2;
				var dist = min(len, vec2_distance(pos[i], pos[0]));
				var percent = (len-dist)/len;
				var _scale = max(min_scale, percent);
				draw_sprite_ext(sHairBall, sign(i), pos[i][X], pos[i][Y], _scale, _scale, 0, c_white, 1);
			}
		surface_reset_target();
		
		outline_begin(surface_get_width(_hair_surf), surface_get_height(_hair_surf));
			draw_surface(_hair_surf, 0, 0);
		outline_end();
		surface_free(_hair_surf);
	}
	
}