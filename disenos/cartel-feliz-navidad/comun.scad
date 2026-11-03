// Impronta 3D — Cartel "Feliz Navidad" de mesa (diseño propio, 2 colores)
// Letras paradas sobre una base con forma de colinas nevadas y dos arbolitos. Para la mesa, una repisa o la entrada.
// Se imprime parado tal cual (letras y arbolitos crecen desde la base), sin soportes.
base = [236, 34, 6];
alto_letra = 30;
grosor = 6;
$fn = 64;
module letras() {
    translate([base[0] / 2, base[1] / 2 + grosor / 2, base[2] - 0.5]) rotate([90, 0, 0]) linear_extrude(grosor)
        text("FELIZ NAVIDAD", size = alto_letra * 0.55, font = "Liberation Sans:style=Bold", halign = "center", valign = "baseline");
    for (x = [9, base[0] - 9]) translate([x, base[1] / 2 + grosor / 2, base[2] - 0.5]) rotate([90, 0, 0])
        linear_extrude(grosor) polygon([[-8, 0], [8, 0], [3, 7], [6, 7], [0, 22], [-6, 7], [-3, 7]]);
}
module colinas() {
    hull() for (x = [6, base[0] - 6], y = [6, base[1] - 6]) translate([x, y, 0]) cylinder(r = 6, h = base[2]);
}
