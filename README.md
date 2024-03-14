# Rope physics in GML
My implementation of rope physics in GML.

Contains an example usage in oRope.

the pixel-perfect camera object I got (stole) from YellowAfterlife

## How to use
 - Create a VerletRope object in create event (contains default values)
 - run the update_points method once in step event
 - run the constrain_points method after as many times as you want (the more you run this method, the less "elastic" the rope will become)
 - (optional) The verlet rope object contains 3 drawing methods: 2 mainly for debugging and one as a test I made to try to recreate Madeline's hair from Celeste

