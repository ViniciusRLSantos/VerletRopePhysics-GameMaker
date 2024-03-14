///@function VerletRope(start_position, ropeLength, constrain, gravity_vector, dampening, pin_start, pin_end)
///@description Creates a rope object using verlet integration
function VerletRope(
	_pos=new Vector2(), _ropeLength=30, _constrain=1, _gravity=new Vector2(0, 0.5), _dampening=0.9, _startPin=true, _endPin=true
) constructor {
	ropeLength = _ropeLength;
	constrain = _constrain;
	gravity = _gravity;
	force = new Vector2(0, 0);
	dampening = _dampening;
	startPin = _startPin;
	endPin = _endPin;
	
	position = _pos;
	pointCount = ceil(ropeLength/constrain);
    for (var i=0; i<pointCount; i++) {
        pos[i] = position.add(constrain*i, 0);
        pos_previous[i] = position.add(constrain*i, 0);
    }
    
    deltaTime = 0.0;
    stepTime = 0.01;
    maxStep = 0.1;
    iterations = 5;
    
    static process_step = function() {
    	deltaTime += delta_time/1000000;
    	deltaTime = min(deltaTime, maxStep);
    	while(deltaTime >= stepTime) {
    		update_points();
    		
    		repeat(iterations) {
    			constrain_points();
    		}
    		
    		deltaTime -= stepTime;
    	}
    	
    }
    
    static update_points = function() {
        for (var i=0; i<pointCount; i++) {
            if (i!=0 && i!=pointCount-1)
            || (i==0 && !startPin)
            || (i==pointCount-1 && !endPin) {
                var vel = new Vector2((pos[i].x - pos_previous[i].x)*dampening, (pos[i].y - pos_previous[i].y)*dampening);
				
				var temp = { x: pos[i].x, y: pos[i].y };
				pos[i].Add(vel.x + gravity.x + force.x, vel.y + gravity.y + force.y);
                pos_previous[i].Set(temp.x, temp.y);
            }
        }
    }
    
    static constrain_points = function() {
        for (var i=0; i<pointCount; i++) {
            if (i == pointCount-1) continue;
            
            var distance = pos[i].distance_to(pos[i+1]);
            var diff = constrain - distance;
            var percent = diff/distance;
            var vec2 = pos[i+1].add(-pos[i].x, -pos[i].y)
            
            if (i==0) {
                if (startPin) {
                    pos[i+1].Add(vec2.x*percent, vec2.y*percent);
                } else {
                    pos[i].Add(-vec2.x*percent/2, -vec2.y*percent/2);
                    pos[i+1].Add(vec2.x*percent/2, vec2.y*percent/2);
                }
            } else if (i == pointCount-1) {
                continue;
            } else {
                if ((i+1) == pointCount-1 && endPin) {
                    pos[i].Add(-vec2.x*percent, -vec2.y*percent);
                } else {
                    pos[i].Add(-vec2.x*percent/2, -vec2.y*percent/2);
                    pos[i+1].Add(vec2.x*percent/2, vec2.y*percent/2);
                }
            }
        }
    }
	
	static draw_points_line = function(radius=pointCount) {
	    for (var i=0; i<pointCount-1; i++) {
			draw_line_width(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y, radius);
	        //draw_circle(pos[i].x, pos[i].y, 2, false);
	    }
	}
	
	static draw_points_circle = function(radius=pointCount) {
	    for (var i=0; i<pointCount; i++) {
	        draw_circle(pos[i].x, pos[i].y, (radius)/2, false);
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
	        draw_circle(pos[i].x, pos[i].y, (r), false);
	    }
	}
	
}