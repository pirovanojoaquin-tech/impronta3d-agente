// Impronta 3D — Posavasos navideños x4 (diseño propio, 2 colores)
// Cuatro posavasos de 95 mm con un dibujo incrustado al ras (copo, arbolito, estrella y regalo).
// Se imprimen acostados; el dibujo es la segunda pieza de color (AMS).
d = 95; h = 5; prof = 1;
$fn = 96;
function estrella(r, k, n) = [for (i = [0 : 2 * n - 1]) let(a = 90 + i * 180 / n, rr = (i % 2 == 0) ? r : r * k) [rr * cos(a), rr * sin(a)]];
module copo() { for (a = [0 : 60 : 359]) rotate(a) { translate([0, -2]) square([32, 4]); for (p = [14, 22]) translate([p, 0]) for (s = [1, -1]) rotate(s * 45) translate([0, -1.6]) square([9, 3.2]); } circle(r = 6); }
module arbol() { for (i = [0 : 2]) translate([0, -14 + i * 13]) polygon([[-26 + i * 6, 0], [26 - i * 6, 0], [0, 24 - i * 3]]); translate([-4, -24]) square([8, 10]); }
module regalo() { difference() { translate([-22, -22]) square([44, 38]); translate([-3, -23]) square([6, 40]); translate([-23, -6]) square([46, 6]); } translate([-12, 18]) circle(r = 7); translate([12, 18]) circle(r = 7); }
module dibujo(i) { if (i == 0) copo(); else if (i == 1) arbol(); else if (i == 2) polygon(estrella(30, 0.45, 5)); else regalo(); }
module grilla() { for (i = [0 : 3]) translate([(i % 2) * (d + 6), floor(i / 2) * (d + 6), 0]) children(); }
module base(i) { difference() { cylinder(d = d, h = h); translate([0, 0, h - prof]) linear_extrude(prof + 1) offset(r = 0.15) dibujo(i); } }
module incrustado(i) { translate([0, 0, h - prof]) linear_extrude(prof) dibujo(i); }
