// Impronta 3D — Galletita de jengibre con nombre (diseño propio, 2 colores)
// Adorno colgante con "glaseado" blanco (borde, botones, cara) y el nombre. Se imprime acostado, sin soportes.
nombre = "SOFI";
esp = 4.5;
$fn = 64;
module silueta() {
    translate([0, 50]) circle(r = 17);                       // cabeza
    hull() { translate([0, 25]) circle(r = 17); translate([0, -5]) circle(r = 19); }   // cuerpo
    for (s = [1, -1]) hull() { translate([0, 22]) circle(r = 9); translate([s * 34, 26]) circle(r = 8.5); }   // brazos
    for (s = [1, -1]) hull() { translate([s * 6, -6]) circle(r = 10); translate([s * 20, -40]) circle(r = 10); } // piernas
}
module galleta() {
    difference() {
        linear_extrude(esp) silueta();
        translate([0, 59, -1]) cylinder(d = 4.5, h = esp + 2);    // para colgar
    }
}
module glaseado() {
    translate([0, 0, esp]) linear_extrude(0.9) {
        difference() { offset(r = -2.2) silueta(); offset(r = -3.6) silueta(); }   // borde ondulado de glaseado
        for (p = [[-6, 54], [6, 54]]) translate(p) circle(r = 2.2);                // ojos
        translate([0, 45]) difference() { circle(r = 7); translate([-8, 0]) square([16, 8]); circle(r = 5.4); }  // sonrisa
        for (y = [30, 18]) translate([0, y]) circle(r = 2.6);                      // botones
        translate([0, 3]) resize([30, 0], auto = true) text(nombre, size = 8, font = "Liberation Sans:style=Bold", halign = "center", valign = "center");
    }
}
