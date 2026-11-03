include <comun.scad>
// saco rojo: piso de 3 mm con agujerito para airear, paredes, sin el cinturón ni la piel
difference() {
    union() { anillo(ri, re, 0, piel); cylinder(r = re, h = 3); }
    anillo(ri - 1, re + 1, cint[0], cint[1]);
    translate([0, 0, -1]) cylinder(r = 50, h = 5);   // aro de base (ahorra plástico)
}
