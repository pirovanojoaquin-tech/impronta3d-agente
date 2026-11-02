// Impronta 3D — Copo de nieve colgante (diseño propio)
// Copo de 6 brazos con ramas y centro calado. Se imprime acostado, sin soportes. Se pueden hacer varios y armar una guirnalda.

diametro = 84;
espesor  = 3;
brazo    = 4.2;
agujero  = 3.5;
$fn = 64;

r = diametro / 2;
module brazo() {
    translate([0, -brazo / 2]) square([r - 4, brazo]);
    translate([r - 4, 0]) circle(d = brazo + 2);
    for (p = [0.35, 0.62]) translate([r * p, 0]) for (s = [1, -1]) rotate(s * 50) translate([0, -brazo * 0.4]) square([r * (0.42 - p * 0.35), brazo * 0.8]);
}

difference() {
    linear_extrude(espesor) union() {
        for (a = [0 : 60 : 359]) rotate(a) brazo();
        circle(r = r * 0.24, $fn = 6);
    }
    translate([0, 0, -1]) linear_extrude(espesor + 2) circle(r = r * 0.12, $fn = 6);   // centro calado
    // agujero para colgar en la punta de un brazo
    translate([0, r - 4, -1]) cylinder(d = agujero, h = espesor + 2);
}
