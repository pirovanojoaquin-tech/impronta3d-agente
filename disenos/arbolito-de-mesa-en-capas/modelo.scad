// Impronta 3D — Arbolito de mesa en capas (diseño propio)
// Árbol de Navidad de capas estrelladas que van girando y achicándose hacia arriba, con estrella en la punta.
// Centro de mesa o adorno de escritorio. Se imprime parado, sin soportes (cada capa es más chica que la de abajo).

capas     = 9;
base_r    = 58;
alto_capa = 11;
puntas    = 8;
giro      = 14;     // grados que gira cada capa
tronco    = [16, 10];
$fn = 48;

function estrella(r, k, n) = [for (i = [0 : 2 * n - 1]) let(a = i * 180 / n, rr = (i % 2 == 0) ? r : r * k) [rr * cos(a), rr * sin(a)]];

union() {
    cylinder(d = tronco[0], h = tronco[1]);   // tronco
    for (i = [0 : capas - 1]) {
        r = base_r * (1 - i / (capas + 1.5));
        translate([0, 0, tronco[1] + i * alto_capa * 0.82]) rotate(i * giro)
            linear_extrude(alto_capa, scale = 0.72) polygon(estrella(r, 0.62, puntas));
    }
    // estrella en la punta (parada)
    translate([0, 0, tronco[1] + capas * alto_capa * 0.82 + 8]) rotate([90, 0, 0])
        linear_extrude(4, center = true) polygon(estrella(11, 0.45, 5));
}
