// Impronta 3D — Arbolito tejido (diseño propio). Árbol cónico con textura de punto, como de lana.
// Se imprime parado, sin soportes (el cono sube a ~60°). Va en crema, blanco o verde; la estrella en dorado.
include <comun.scad>
alto = 190; radio = 62;
function forma(z) = let(t = z / alto) radio * (1 - t) * (0.92 + 0.08 * cos(t * 180)) + 2.5 * (1 - t);
tejido(function(z) forma(z), alto - 2);
