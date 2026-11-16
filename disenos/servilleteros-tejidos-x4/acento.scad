// Estrella dorada al frente
H = 30; R = 25;
translate([0, -R - 2.2, H / 2]) rotate([90, 0, 0]) translate([0, 0, -2.5]) linear_extrude(4)
    polygon([for (i = [0:9]) let(r = i % 2 == 0 ? 11 : 4.8, a = 90 + 36 * i) [r * cos(a), r * sin(a)]]);
