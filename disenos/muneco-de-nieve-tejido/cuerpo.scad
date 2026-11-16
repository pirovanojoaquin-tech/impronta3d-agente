// Impronta 3D — Muñeco de nieve tejido (diseño propio, 3 colores). Cuerpo y cabeza con textura de punto;
// galera, ojos y botones en negro; bufanda y nariz en rojo. 14 cm. Se imprime parado, sin soportes.
include <tejido.scad>
Dc = 84; Dh = 58; zc = Dc / 2 - 6; zh = Dc - 14 + Dh / 2 - 8;   // cuerpo y cabeza (esferas encimadas)
function cuerpo(z) = let(c = z - zc) sqrt(max(0, (Dc / 2) * (Dc / 2) - c * c));
function cabeza(z) = let(c = z - zh) sqrt(max(0, (Dh / 2) * (Dh / 2) - c * c));
function forma(z) = max(cuerpo(z), cabeza(z), z < 4 ? 26 : 0, 14);
tejido(function(z) forma(z), zh + Dh / 2 - 9, nz = 200);
