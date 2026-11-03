// Impronta 3D — Farol árbol con estrellas caladas (diseño propio, 2 colores).
// Árbol hueco de 3 pisos con estrellitas caladas: adentro va una vela LED y la luz sale por las estrellas.
// Se imprime parado, sin soportes (paredes a 60°, estrellas chicas que puentean bien).
pisos = [[0, 78, 40, 72], [62, 62, 28, 66], [116, 46, 6, 58]]; // [z, radio abajo, radio arriba, alto]
pared = 2.2;
alto_total = 174;
$fn = 120;
module estrella(r) { polygon([for (i = [0:9]) let(rr = i % 2 == 0 ? r : r * 0.45, a = 90 + 36 * i) [rr * cos(a), rr * sin(a)]]); }
