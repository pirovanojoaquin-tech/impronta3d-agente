// Impronta 3D — Arbolito tejido (diseño propio). Árbol cónico con textura de punto, como de lana.
// Hueco por dentro (pared de 3 mm + textura) para que sea liviano. Se imprime parado, sin soportes.
include <comun.scad>
alto = 190; radio = 62;
function forma(z) = let(t = z / alto) radio * (1 - t) * (0.92 + 0.08 * cos(t * 180)) + 2.5 * (1 - t);
difference() {
    tejido(function(z) forma(z), alto - 2);
    // hueco: misma forma 3 mm más adentro, abierto abajo, hasta donde el árbol se pone finito
    translate([0, 0, -0.01]) rotate_extrude($fn = 120)
        polygon(concat([[0, 0]], [for (z = [0:5:150]) [max(forma(z) - 3, 0.5), z]], [[0, 150]]));
}
