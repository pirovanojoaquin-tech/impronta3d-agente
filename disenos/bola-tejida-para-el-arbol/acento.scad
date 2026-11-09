// Capuchón dorado con argolla
D = 80; $fn = 64;
translate([0, 0, D - 7]) { cylinder(d1 = 22, d2 = 16, h = 9); translate([0, 0, 9]) rotate([90, 0, 0]) rotate_extrude($fn = 32) translate([5, 0]) circle(d = 3, $fn = 16); }
