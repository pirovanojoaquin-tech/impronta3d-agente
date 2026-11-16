// Impronta 3D — Casita farol nevada (diseño propio, 2 colores). Casita hueca con ventanas y puerta caladas:
// con una vela LED adentro, la luz sale por las ventanas. Techo y chimenea nevados en blanco.
// Se imprime parada, sin soportes (techo a 45°, abierta abajo para meter la vela).
w = 74; d = 62; hp = 46; pared = 2.2; $fn = 48;
ht = w / 2;   // alto del techo a 45°
module volumen(o = 0) translate([0, 0, 0]) rotate([90, 0, 0]) translate([0, 0, -d / 2 + o]) linear_extrude(d - 2 * o)
    polygon([[-w / 2 + o, 0], [w / 2 - o, 0], [w / 2 - o, hp], [0, hp + ht - o * 1.41], [-w / 2 + o, hp]]);
module ventana(x, z) translate([x, 0, z]) rotate([90, 0, 0]) linear_extrude(d + 10, center = true) difference() {
    hull() { translate([-6, -8]) square([12, 12]); translate([0, 5]) circle(r = 6); }
    square([1.6, 30], center = true); translate([0, -1]) square([14, 1.6], center = true);
}
module nieve() intersection() {
    translate([0, 0, 0]) rotate([90, 0, 0]) translate([0, 0, -d / 2 - 2]) linear_extrude(d + 4)
        polygon([[-w / 2 - 2, hp - 2], [0, hp + ht + 1.2], [w / 2 + 2, hp - 2], [w / 2 - 1, hp - 2.5], [0, hp + ht - 3.6], [-w / 2 + 1, hp - 2.5]]);
    cube([w + 10, d + 4, 300], center = true);
}
module chimenea() translate([w / 4, 6, hp + ht / 2 - 4]) { cube([11, 11, 24], center = true); }
