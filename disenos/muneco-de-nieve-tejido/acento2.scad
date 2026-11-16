// Rojo: bufanda (aro en el cuello + tira que cae) y nariz
Dc = 84; Dh = 58; zc = Dc / 2 - 6; zh = Dc - 14 + Dh / 2 - 8; $fn = 64;
zc2 = Dc - 16;
translate([0, 0, zc2 - 5]) difference() { cylinder(r1 = 27, r2 = 24, h = 11); translate([0, 0, -1]) cylinder(r = 19, h = 13); }
hull() { translate([13, -22, zc2 - 2]) scale([1.3, 0.6, 1]) sphere(d = 11, $fn = 20); translate([17, -39.5, zc2 - 30]) scale([1.3, 0.6, 1]) sphere(d = 11, $fn = 20); }
translate([0, -Dh / 2 + 3, zh - 1]) rotate([90, 0, 0]) cylinder(r1 = 4.2, r2 = 0.8, h = 15, $fn = 24);
