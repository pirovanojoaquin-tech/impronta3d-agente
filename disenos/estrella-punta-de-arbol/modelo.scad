// Impronta 3D — Estrella para la punta del árbol (diseño propio)
// Estrella de 5 puntas con relieve facetado y un tubo atrás que se encastra en la punta del árbol.
// Se imprime acostada (el tubo también queda acostado sobre la cama), sin soportes.

radio      = 62;     // radio de las puntas
interior   = 0.45;   // proporción del radio interior
alto       = 9;      // alto en el centro (facetado)
tubo_ext   = 30;
tubo_int   = 22;     // entra en puntas de árbol de hasta ~2 cm
tubo_largo = 55;
texto      = "IMPRONTA 3D";
$fn = 64;

function estrella(r, k) = [for (i = [0 : 9]) let(a = 90 + i * 36, rr = (i % 2 == 0) ? r : r * k) [rr * cos(a), rr * sin(a)]];

difference() {
    union() {
        // estrella facetada: cada triángulo sube hacia el centro
        linear_extrude(1.2) polygon(estrella(radio, interior));
        translate([0, 0, 1.2]) linear_extrude(alto - 1.2, scale = 0.02) polygon(estrella(radio, interior));
        // tubo hacia abajo, acostado sobre la cama
        translate([0, -radio * interior * 0.8, 0]) rotate([90, 0, 0])
            translate([0, tubo_ext / 2, 0]) difference() {
                cylinder(d = tubo_ext, h = tubo_largo);
                translate([0, 0, -1]) cylinder(d = tubo_int, h = tubo_largo + 2);
            }
    }
    // aplanar abajo para que apoye en la cama
    translate([-200, -200, -50]) cube([400, 400, 50]);
}
