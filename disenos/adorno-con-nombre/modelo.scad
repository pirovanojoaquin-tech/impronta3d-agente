// Impronta 3D — Adorno de árbol con nombre (diseño propio)
// Esfera plana con el nombre en relieve y un copo calado arriba. Se imprime acostado, sin soportes.
// Para personalizar: cambiá `nombre` (hasta ~9 letras queda bien).

nombre   = "MARTINA";
diametro = 76;
espesor  = 4;
relieve  = 1.6;
borde    = 3;
agujero  = 4;      // para la cinta o el ganchito
$fn = 120;

module copo(r) {
    for (a = [0 : 60 : 359]) rotate(a) {
        translate([0, -0.9]) square([r, 1.8]);
        translate([r * 0.55, 0]) rotate(45) translate([0, -0.8]) square([r * 0.3, 1.6]);
        translate([r * 0.55, 0]) rotate(-45) translate([0, -0.8]) square([r * 0.3, 1.6]);
    }
}

union() {
    difference() {
        union() {
            cylinder(d = diametro, h = espesor);
            // argolla de arriba
            translate([0, diametro / 2 + 2, 0]) cylinder(d = 12, h = espesor);
        }
        translate([0, diametro / 2 + 2, -1]) cylinder(d = agujero, h = espesor + 2);
        // copo calado arriba del nombre
        translate([0, diametro * 0.24, -1]) linear_extrude(espesor + 2) copo(9);
    }
    // borde en relieve
    translate([0, 0, espesor]) difference() {
        cylinder(d = diametro, h = relieve);
        translate([0, 0, -1]) cylinder(d = diametro - 2 * borde, h = relieve + 2);
    }
    // nombre en relieve
    translate([0, -diametro * 0.06, espesor]) linear_extrude(relieve)
        resize([min(diametro - 16, len(nombre) * 9), 0], auto = true)
            text(nombre, size = 12, font = "Liberation Sans:style=Bold", halign = "center", valign = "center");
    // fecha chiquita abajo
    translate([0, -diametro * 0.3, espesor]) linear_extrude(relieve)
        text("2026", size = 6, font = "Liberation Sans:style=Bold", halign = "center", valign = "center");
}
