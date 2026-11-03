include <comun.scad>
// blanco: borde de piel arriba (abultado) y franja al frente
difference() {
    union() {
        translate([0, 0, piel]) cylinder(r1 = re, r2 = re + 4, h = 4);
        translate([0, 0, piel + 4]) cylinder(r = re + 4, h = alto - piel - 6);
        translate([0, 0, alto - 2]) cylinder(r1 = re + 4, r2 = re + 2, h = 2);
        for (i = [0:89], f = [0:1]) rotate(i * 4 + f * 2) translate([re + 3.4, 0, piel + 5 + f * 4.5 + (i % 3) * 0.8]) scale([0.7, 1, 1.2]) sphere(r = 3.2, $fn = 14);
    }
    translate([0, 0, piel - 1]) cylinder(r = ri, h = alto);
}
difference() { tira(); translate([0, 0, cint[0]]) cylinder(r = re + 5, h = cint[1] - cint[0]); }
