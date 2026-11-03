// Estrella de la punta (dorada, se imprime con el AMS en el mismo trabajo)
include <comun.scad>
alto = 190;
translate([0, 0, alto - 6]) rotate([90, 0, 0]) translate([0, 14, -4]) linear_extrude(8, center = false)
    polygon([for (i = [0:9]) let(r = i % 2 == 0 ? 17 : 7.5, a = 90 + 36 * i) [r * cos(a), r * sin(a)]]);
translate([0, 0, alto - 9]) cylinder(r1 = 4, r2 = 3, h = 12, $fn = 24);
