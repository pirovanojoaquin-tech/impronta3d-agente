// Impronta 3D — Gorro de Papá Noel para botella (diseño propio, 3 colores... 2 piezas: gorro rojo tejido y
// borde + pompón blancos). Se calza en el pico de una botella de vino o sidra (Ø interior 33 mm) para la mesa
// o para regalar. Se imprime parado, sin soportes (cono hueco que sube a más de 60°).
include <tejido.scad>
H = 110; bordez = 16;
function forma(z) = let(t = z / H) 26 * (1 - t) + 3.5 * t + 3 * sin(t * 180);
difference() {
    translate([0, 0, bordez - 1]) tejido(function(z) forma(z + bordez), H - bordez, nz = 160);
    translate([0, 0, -0.01]) cylinder(d1 = 34, d2 = 26, h = 60, $fn = 64);   // entra el pico de la botella
}
