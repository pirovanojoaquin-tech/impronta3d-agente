// Impronta 3D — Porta pan dulce "traje de Papá Noel" (diseño propio, 4 colores con AMS).
// El pan dulce de 500 g (o un panettone de 15 cm) entra adentro y queda "vestido" de Papá Noel:
// saco rojo, cinturón negro con hebilla dorada, borde de piel blanco arriba y al frente, y las botas.
// Se imprime parado, sin soportes. Las piezas no se pisan entre sí (cada color es un volumen aparte).
ri = 80.5;        // radio interior (entra un pan dulce de hasta 16 cm)
re = 84;          // radio exterior del saco
alto = 80;
cint = [34, 46];  // cinturón: de z a z
piel = 66;        // desde acá arriba, borde de piel
$fn = 160;
module anillo(r1, r2, z1, z2) translate([0, 0, z1]) difference() { cylinder(r = r2, h = z2 - z1); translate([0, 0, -1]) cylinder(r = r1, h = z2 - z1 + 2); }
module bota(lado) rotate(-90 + lado * 13) {
    // caña pegada al saco y punta hacia afuera, apoyadas en la cama
    hull() { translate([re - 4, 0, 0]) cylinder(r = 11, h = 20, $fn = 48); translate([re + 12, 0, 0]) cylinder(r = 9, h = 9, $fn = 48); }
}
module botas() difference() { union() { bota(-1); bota(1); } translate([0, 0, -1]) cylinder(r = re - 0.01, h = 40); }
module tira() rotate(-90) translate([re - 0.01, -10, 20]) cube([2.6, 20, piel - 20]);  // franja de piel al frente
module hebilla() rotate(-90) translate([re + 1.2, 0, (cint[0] + cint[1]) / 2]) rotate([0, 90, 0]) difference() {
    translate([-9, -11, 0]) cube([18, 22, 2.2]); translate([-5.5, -7.5, -1]) cube([11, 15, 5]); }
