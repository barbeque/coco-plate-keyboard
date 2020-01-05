switch_base_size = 1.4;
wall_thickness = 0.1;
switch_spacing = 0.6;

keyboard_width = 33;
keyboard_height = 15;

row_height = ((switch_spacing + wall_thickness) * 3);

module spacebar_hole() {
    // this one's funky according to cherry, since it needs a stab
    // TODO: do this
    cube([ 1.75 * switch_base_size, switch_base_size, switch_base_size ], center = false);
}

module switch_hole() {
    // TODO: shift, ctrl, return key stabs
    cube(switch_base_size, center = false);
}

module switch_row(count) {
    for(i = [0 : count - 1]) {
        translate([i * (switch_base_size + wall_thickness * 2 + switch_spacing), 0, 0]) {
            switch_hole();
        }
    }
}

module switch_holes() {
    // 13 keys top row
    // 14 keys 2nd row
    // 13 keys 3rd row
    // 12 keys 4th row
    // just spacebar last row
    
    // translate to top left of keyboard
    translate([2.0, keyboard_height - 3, 0]) {
        switch_row(13);
        
        translate([-0.7, -row_height, 0]) {
            switch_row(14);
            
            translate([0.7, -row_height, 0]) {
                switch_row(13);
                
                translate([0.7, -row_height, 0]) {
                    switch_row(12);
                    
                    // back to x-origin
                    translate([-2.7, -row_height, 0]) {
                        
                        translate([ (keyboard_width - (1.75 * switch_base_size)) / 2, 0, 0 ]) {
                            spacebar_hole();
                        }
                    }
                }
            }
        }
    }
    
}

// define the plate base
difference() {
    cube([keyboard_width, keyboard_height, 1], center = false);
    switch_holes();
}