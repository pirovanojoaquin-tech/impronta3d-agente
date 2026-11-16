// Negro: galera, ojos y botones
Dc = 84; Dh = 58; zc = Dc / 2 - 6; zh = Dc - 14 + Dh / 2 - 8; $fn = 64;
ztop = zh + Dh / 2 - 9;
translate([0, 0, ztop - 0.5]) { cylinder(r1 = 21, r2 = 24, h = 3); translate([0, 0, 3]) cylinder(r = 15.5, h = 24); }
for (x = [-9, 9]) translate([x, -sqrt(pow(Dh / 2 + 1.2, 2) - 81 - 64), zh + 8]) sphere(d = 6.5, $fn = 24);
for (z = [-8, 8, 22]) translate([0, -sqrt(pow(Dc / 2 + 1.5, 2) - z * z), zc + z]) sphere(d = 7, $fn = 24);
