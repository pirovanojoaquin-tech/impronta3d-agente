// Impronta 3D — Servilleteros tejidos x4 (diseño propio, 2 colores). Aro con textura de punto y una estrella
// dorada al frente. Se imprime parado, sin soportes. El pack trae 4.
include <tejido.scad>
H = 30; R = 25;
difference() {
    tejido(function(z) R + 1.2 * sin(z / H * 180), H, nz = 60);
    translate([0, 0, -1]) cylinder(r = R - 3.4, h = H + 2, $fn = 96);
}
