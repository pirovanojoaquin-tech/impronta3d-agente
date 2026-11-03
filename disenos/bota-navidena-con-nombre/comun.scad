// Impronta 3D — Bota navideña con nombre (diseño propio, 2 colores)
// Adorno para el árbol con puño "de peluche" blanco, pompón, copo y el nombre. Se imprime acostada.
nombre = "TOMI";
esp = 4.5;
$fn = 64;
module bota() {
    hull() { translate([-14, 30]) square([30, 40]); translate([-14, 0]) circle(r = 1); translate([16, 0]) circle(r = 1); }
    hull() { translate([-14, 0]) square([30, 30]); translate([-30, 6]) circle(r = 12); translate([-36, 2]) circle(r = 8); }
    translate([-14, 70]) square([30, 6]);
}
module cuerpo() {
    difference() {
        linear_extrude(esp) bota();
        translate([10, 82, -1]) cylinder(d = 4.5, h = esp + 2);
    }
    translate([10, 82, 0]) difference() { cylinder(d = 11, h = esp); translate([0, 0, -1]) cylinder(d = 4.5, h = esp + 2); }
}
module acento() {
    translate([0, 0, esp]) linear_extrude(1) {
        translate([-17, 62]) square([36, 14], center = false);          // puño
        translate([-17, 69]) circle(r = 7);                             // pompón
        translate([1, 40]) resize([26, 0], auto = true) text(nombre, size = 8, font = "Liberation Sans:style=Bold", halign = "center", valign = "center");
        translate([-24, 6]) for (a = [0 : 60 : 359]) rotate(a) translate([0, -0.8]) square([6, 1.6]);  // copo en la punta
    }
}
