// Impronta 3D — Ángel tejido (diseño propio, 2 colores). Vestido acampanado con textura de punto, cabeza lisa;
// alas y aureola doradas. 13 cm. Se imprime parado, sin soportes.
include <tejido.scad>
H = 92;
function forma(z) = let(t = z / H) 30 * pow(1 - t, 0.8) + 9;
tejido(function(z) forma(z), H, nz = 140);
translate([0, 0, H + 13]) sphere(d = 27, $fn = 64);
translate([0, 0, H - 2]) cylinder(d1 = 18, d2 = 10, h = 4, $fn = 48);
