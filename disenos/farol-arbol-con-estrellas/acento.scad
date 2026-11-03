include <comun.scad>
translate([0, 0, alto_total - 4]) cylinder(r1 = 5, r2 = 3, h = 10, $fn = 24);
translate([0, 0, alto_total + 14]) rotate([90, 0, 0]) translate([0, 0, -3.5]) linear_extrude(7) estrella(15);
