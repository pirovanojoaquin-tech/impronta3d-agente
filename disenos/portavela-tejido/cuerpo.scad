// Impronta 3D — Portavela tejido (diseño propio). Vaso con textura de punto y puño elastizado arriba,
// para una vela de té o una vela LED. Se imprime parado, sin soportes.
include <comun.scad>
alto = 88; radio = 38; puno = 14;
function forma(z) = radio - 1.2 * pow(sin(z / alto * 180), 2);
difference() {
    union() {
        tejido(function(z) forma(z), alto - puno, nz = 90);
        // puño elastizado (cañitos verticales)
        translate([0, 0, alto - puno - 0.01]) for (i = [0:47]) rotate(i * 7.5)
            translate([radio + 0.2, 0, 0]) cylinder(r = 1.6, h = puno, $fn = 12);
        translate([0, 0, alto - puno - 0.01]) cylinder(r = radio + 0.6, h = puno, $fn = 96);
    }
    translate([0, 0, 5]) cylinder(r = radio - 2.6, h = alto, $fn = 96);   // hueco (entra la vela y deja salir la luz)
}
