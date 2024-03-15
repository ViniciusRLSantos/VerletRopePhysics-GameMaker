#macro X 0
#macro Y 1

///@function Vector2(x, y)
///@returns {Array}
///@description creates a Vector2 array
function Vector2(_x=0, _y=0) {
    return [_x, _y];
}


///@function vec2_add(v1, v2)
///@returns {Array}
function vec2_add(v1, v2) {
    return [ v1[X]+v2[X], v1[Y]+v2[Y] ];
}

///@function vec2_subtract(v1, v2)
///@returns {Array}
function vec2_subtract(v1, v2) {
    return [ v1[X]-v2[X], v1[Y]-v2[Y] ];
}

///@function vec2_product(vec2, scalar)
///@returns {Array}
function vec2_product(vec2, scalar) {
    return [ vec2[X]*scalar, vec2[Y]*scalar ];
}

///@function vec2_distance(v1, v2)
///@returns {Real}
function vec2_distance(v1, v2) {
    return point_distance(v1[X], v1[Y], v2[X], v2[Y]);
}

///@function vec2_length(vec2)
///@returns {Real}
function vec2_length(vec2) {
    return sqrt(vec2[X]*vec2[X] + vec2[Y]*vec2[Y]);
}
