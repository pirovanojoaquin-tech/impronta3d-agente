// Alas (atrás, apoyadas en la cama) y aureola detrás de la cabeza, doradas. Todo vertical: sin soportes.
H = 92; $fn = 64;
// ala: contorno con plumas redondeadas (de abajo hacia arriba)
module ala() offset(r = 2) offset(delta = -2) union() {
    hull() { translate([2, 4]) circle(d = 8); translate([14, 60]) circle(d = 20); translate([2, 72]) circle(d = 8); }
    for (i = [0:4]) hull() { translate([4, 10 + i * 13]) circle(d = 8); translate([22 + i * 4, 18 + i * 13]) circle(d = 14 - i); }
    hull() { translate([16, 64]) circle(d = 20); translate([34, 84]) circle(d = 16); translate([8, 82]) circle(d = 10); }
}
for (s = [-1, 1]) translate([0, 16, 0]) rotate([0, 0, s * 18]) rotate([90, 0, 0]) mirror([s < 0 ? 1 : 0, 0, 0]) translate([4, 0, -1.8]) linear_extrude(3.6) ala();
// aureola: aro vertical detrás de la cabeza, unido a ella
translate([0, 9, H + 15]) rotate([90, 0, 0]) difference() { cylinder(r = 19, h = 3, center = true); cylinder(r = 15.5, h = 4, center = true); }
translate([0, 9, H + 2]) cube([3, 3, 9], center = true);
