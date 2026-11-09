// Borde de piel (abultado) y pompón, en blanco
H = 110; bordez = 16; $fn = 64;
difference() {
    union() {
        cylinder(r1 = 26, r2 = 29, h = 3);
        translate([0, 0, 3]) cylinder(r = 29, h = bordez - 6);
        translate([0, 0, bordez - 3]) cylinder(r1 = 29, r2 = 25, h = 3);
        for (i = [0:35], f = [0:1]) rotate(i * 10 + f * 5) translate([28.4, 0, 4 + f * 5]) scale([0.7, 1, 1.2]) sphere(r = 3, $fn = 12);
    }
    translate([0, 0, -0.01]) cylinder(d1 = 34, d2 = 32, h = bordez + 1);
}
translate([0, 0, H + 4]) sphere(d = 22);
