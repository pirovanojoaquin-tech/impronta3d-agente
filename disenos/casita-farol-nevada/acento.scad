include <comun.scad>
// nieve del techo y de la chimenea, en blanco
difference() { nieve(); translate([w / 4 - 5.5, 0.5, hp]) cube([11, 11, 40]); }
translate([w / 4 - 5.5 - 1, -0.5, hp + ht / 2 + 9]) difference() { cube([13, 13, 5]); translate([3, 3, -1]) cube([7, 7, 7]); }
