include <comun.scad>
module piso(p, d = 0) translate([0, 0, p[0]]) cylinder(r1 = p[1] - d, r2 = p[2] - d, h = p[3]);
// radio exterior del piso k a la altura z
function radio_en(k, z) = let(p = pisos[k]) p[1] + (p[2] - p[1]) * (z - p[0]) / p[3];
// alero de cada piso con la cara de abajo a 45° (así no hacen falta soportes)
module alero(k, d = 0) let(p = pisos[k], rl = radio_en(k - 1, p[0]), h = p[1] - rl)
    translate([0, 0, p[0] - h]) cylinder(r1 = rl - d, r2 = p[1] - d, h = h + 0.01);
difference() {
    union() { for (p = pisos) piso(p); for (k = [1:2]) alero(k); }
    // hueco interior (cada piso por dentro) y entrada de la vela por abajo
    for (p = pisos) translate([0, 0, -0.01]) piso([p[0], p[1], p[2], p[3]], pared / cos(30));
    for (k = [1:2]) alero(k, pared * 1.42);
    translate([0, 0, -1]) cylinder(r = 72, h = 1.2);
    // estrellas caladas en cada piso, en filas alternadas
    for (k = [0:2]) let(p = pisos[k]) for (f = [0:1]) let(t = 0.3 + 0.38 * f, z = p[0] + p[3] * t,
            r = p[1] + (p[2] - p[1]) * t, n = floor(2 * PI * r / 34))
        for (i = [0:n - 1]) rotate(360 * i / n + f * 180 / n + k * 11) translate([r, 0, z])
            rotate([0, 90 - atan((p[1] - p[2]) / p[3]), 0]) rotate([0, 0, 90]) translate([0, 0, -6])
                linear_extrude(12) estrella(6.5 - k * 0.6);
}
