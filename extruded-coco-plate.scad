hole_depth = 1.5;
base_plate_width = 306;
base_plate_depth = 250;
base_plate_fudge_x = 0;
base_plate_fudge_y = 0;

module keyboard_holes() {
    difference() {
        translate([0, 0, -(hole_depth / 2)]) {
            cube([290, 125, hole_depth]);
        }
        translate([-10, -10, 0]) {
            linear_extrude(height = 1.6, center = true, convexity = 5)
                import(file = "coco-keyboard-plate-with-20mm-padding.dxf");
        }
    }
}

difference() {
    cube([base_plate_width, base_plate_depth, 0.5]); 
    keyboard_holes();
}