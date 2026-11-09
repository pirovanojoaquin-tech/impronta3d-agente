// Impronta 3D — textura de tejido (punto jersey: columnas de "V") sobre un sólido de revolución.
// tejido(perfil, alto): perfil(z) = radio a la altura z. Genera un polyhedron con la superficie "tejida".
columnas = 20;      // columnas de puntos alrededor
alto_punto = 6.5;   // alto de cada "V"
relieve = 1.8;      // cuánto sobresale cada punto (mm)
na = columnas * 10; // resolución angular
function _fr(x) = x - floor(x);
function punto(a, z) =
    let(u = _fr(a / 360 * columnas),               // posición dentro de la columna
        pierna = _fr(u * 2),                         // cada columna tiene dos "piernas" inclinadas
        v = _fr(z / alto_punto + abs(u - 0.5) * 0.9),
        surco = pow(sin(180 * pierna), 0.45),
        lomo = pow(sin(180 * v), 0.7))
    relieve * surco * lomo;
module tejido(perfil, alto, nz = 190, tapa_arriba = true) {
    pts = concat(
        [for (i = [0:nz]) let(z = alto * i / nz, r = perfil(z))
            for (j = [0:na - 1]) let(a = 360 * j / na, rr = r > 0.01 ? r + punto(a, z) * min(1, r / 6) : 0.01)
                [rr * cos(a), rr * sin(a), z]],
        [[0, 0, 0], [0, 0, alto]]);
    abajo = (nz + 1) * na; arriba = abajo + 1;
    caras = concat(
        [for (i = [0:nz - 1]) for (j = [0:na - 1])
            let(a = i * na + j, b = i * na + (j + 1) % na, c = (i + 1) * na + (j + 1) % na, d = (i + 1) * na + j)
                each [[a, b, c], [a, c, d]]],
        [for (j = [0:na - 1]) [abajo, (j + 1) % na, j]],
        [for (j = [0:na - 1]) [arriba, nz * na + j, nz * na + (j + 1) % na]]);
    polyhedron(pts, caras, convexity = 6);
}
