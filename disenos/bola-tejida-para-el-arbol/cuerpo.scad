// Impronta 3D — Bola tejida para el árbol (diseño propio, 2 colores). Esfera de 8 cm con textura de punto,
// como un adorno de lana, y capuchón dorado con argolla. Se imprime parada sobre una base chica, sin soportes
// (la parte de abajo de la esfera arranca en una base plana de 30 mm).
include <tejido.scad>
D = 80;
function forma(z) = let(c = z - D / 2 + 3) sqrt(max(0, (D / 2) * (D / 2) - c * c));
tejido(function(z) max(forma(z), 15), D - 6, nz = 120);
