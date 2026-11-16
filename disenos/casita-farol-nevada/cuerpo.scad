include <comun.scad>
difference() {
    union() { volumen(); translate([w / 4 - 5.5, 0.5, hp + 2]) cube([11, 11, 26]); }
    difference() { translate([0, 0, -0.01]) volumen(pared); translate([0, 0, hp + ht - 12]) cube([w, d, 30], center = true); }
    ventana(-18, 22); ventana(18, 22);
    // puerta al frente y ventanas a los costados
    translate([0, -d / 2, 0]) rotate([90, 0, 0]) linear_extrude(12, center = true) hull() { translate([-7, -1]) square([14, 20]); translate([0, 19]) circle(r = 7); }
    for (y = [-14, 14]) translate([0, y, 24]) rotate([90, 0, 90]) linear_extrude(w + 10, center = true) difference() { square([11, 15], center = true); square([1.6, 20], center = true); square([14, 1.6], center = true); }
    nieve();
    translate([w / 4 - 5.5 - 1, -0.5, hp + ht / 2 + 9]) cube([13, 13, 10]);
}
