// Impronta 3D — Campana tejida (diseño propio, 2 colores). Campana de 10 cm con textura de punto y borde
// acampanado, badajo y moño dorados. Hueca, se imprime boca abajo... no: se imprime parada sobre la boca
// (la pared sube a más de 45°), sin soportes.
include <tejido.scad>
H = 92;
function forma(z) = let(t = z / H) 44 - 30 * pow(t, 0.9) + 8 * pow(1 - t, 6) - 8 * pow(max(0, t - 0.82) / 0.18, 2);
difference() {
    tejido(function(z) forma(z), H, nz = 140);
    translate([0, 0, -0.01]) rotate_extrude($fn = 96) polygon(concat([[0, 0]], [for (z = [0:4:H - 12]) [max(forma(z) - 2.8, 1), z]], [[0, H - 12]]));
}
