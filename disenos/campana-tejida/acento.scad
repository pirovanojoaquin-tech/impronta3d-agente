// Badajo (asoma por la boca) y argolla dorados
H = 92; $fn = 48;
translate([0, 0, 5]) sphere(d = 18);
translate([0, 0, 5]) cylinder(d = 5, h = H - 20);
translate([0, 0, H - 2]) rotate([90, 0, 0]) rotate_extrude($fn = 32) translate([6, 0]) circle(d = 3.5, $fn = 16);
