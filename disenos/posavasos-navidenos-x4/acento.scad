include <comun.scad>
for (i = [0 : 3]) translate([(i % 2) * (d + 6), floor(i / 2) * (d + 6), 0]) incrustado(i);
