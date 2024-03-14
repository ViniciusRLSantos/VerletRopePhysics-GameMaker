
///@function Vector2(x, y)
///@param {Real} x
///@param {Real} y
///@description Creates a 2D vector object
function Vector2(_x=0, _y=0) constructor {
    x = _x;
    y = _y;
    
#region Methods

    static Set = function(_x, _y) {
        self.x = _x;
        self.y = _y;
    }

    #region Operations that change the actual vector
        ///@function Add(x, y)
        ///@param {Real} x
        ///@param {Real} y
        ///@description
        static Add = function(_x, _y) {
            self.x += _x;
            self.y += _y;
        }
        
        ///@function Product(scalar)
        ///@param {Real} scalar
        static Product = function(scalar) {
            self.x *= scalar;
            self.y *= scalar;
        }
    #endregion
        
    #region Operations that creates a new Vector2
        ///@function add(x, y)
        ///@param {Real} x
        ///@param {Real} y
        ///@description
        static add = function(_x, _y) {
            var vec2 = new Vector2(self.x + _x, self.y + _y);
            return vec2;
        }
        
        ///@function product(scalar)
        ///@param {Real} scalar
        static product = function(scalar) {
            var vec2 = new Vector2(self.x*scalar, self.y*scalar);
            return vec2;
        }
    #endregion
   
    #region Returns
        ///@function angle()
        ///@returns {Real}
        ///@description Returns Vector angle in radians
        static angle = function() {
            return arctan2(self.y, self.x);
        }
        
        ///@function angle_to(x, y)
        ///@param {Real}x
        ///@param {Real} y
        ///@returns {Real}
        ///@description Returns angle to the given point in radians
        static angle_to = function(_x, _y) {
            return arctan2(_y - self.y, _x - self.x);
        }
        
        ///@function distance_to(Vector2)
        ///@param {Struct.Vector2} Vector2
        ///@returns {Real}
        ///@description Returns distance to given Vector
        static distance_to = function(vec2) {
            return point_distance(x, y, vec2.x, vec2.y);
        }
    #endregion
    
#endregion
}


