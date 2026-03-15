// LDRC (1:28) — базовый корпус хэтчбек (body shell)
// Тонкостенная оболочка, открытая снизу.
// Без декоративных деталей — только форма кузова.
// Крепится клипсами на 4 стойки шасси (body posts).
// Все размеры в мм.

/* ======== ПАРАМЕТРЫ ======== */

body_l = 175;         // длина корпуса
body_w = 75;          // макс. ширина
body_h = 50;          // общая высота
wall   = 1.2;         // толщина стенки (FDM)

wheelbase    = 98;    // колёсная база
front_axle_x = 38;   // от носа до передней оси
rear_axle_x  = front_axle_x + wheelbase;  // 136

belt_z   = 22;        // высота бельтлайна
corner_r = 5;         // радиус скругления рёбер

// Колёсные арки
wheel_arch_d   = 24;  // диаметр арки
wheel_center_z = 12;  // высота центра колеса от низа

// Крепёжные стойки (body posts)
post_hole_d = 3.0;    // диаметр отверстия
post_y      = 27.5;   // расстояние стоек от центральной оси

$fn = 48;

/* ======== ПРОФИЛИ КУЗОВА ======== */

// Нижняя часть: [x, ширина, высота]
lower = [
    [0,              40, 12],   // нос
    [10,             54, 15],   // передний бампер
    [front_axle_x,   72, 20],  // передние крылья
    [52,          body_w, belt_z],
    [body_l / 2,  body_w, belt_z],  // середина
    [118,         body_w, belt_z],
    [rear_axle_x,    72, 20],  // задние крылья
    [155,            62, 18],  // задний бампер
    [body_l,         46, 15],  // хвост (выше чем у седана)
];

// Кабина — хэтчбек: крыша начинается раньше, сзади резко обрывается
cabin = [
    [50,   60,  2],   // начало лобового стекла
    [64,   58, 20],   // лобовое стекло
    [78,   56, 26],   // передняя часть крыши
    [92,   55, 28],   // пик крыши
    [108,  55, 28],   // крыша ровная (хэтчбек)
    [122,  56, 24],   // начало заднего стекла
    [138,  58, 10],   // заднее стекло (крутой угол)
    [148,  60,  2],   // конец остекления
];

/* ======== СБОРКА ======== */

difference() {
    car_outer();
    car_inner();
    bottom_cut();
    wheel_arches();
    post_holes();
}

/* ======== МОДУЛИ ======== */

module car_outer() {
    seq_hull(lower, 0);
    seq_hull(cabin, belt_z);
}

module car_inner() {
    inset_l = [for (s = lower)
        [s[0], max(6, s[1] - wall * 2), max(4, s[2] - wall)]];
    seq_hull(inset_l, 0);

    inset_c = [for (s = cabin)
        [s[0], max(6, s[1] - wall * 2), max(1, s[2] - wall)]];
    seq_hull(inset_c, belt_z);
}

module bottom_cut() {
    translate([-5, -body_w, -100])
        cube([body_l + 10, body_w * 2, 100]);
}

module wheel_arches() {
    for (ax = [front_axle_x, rear_axle_x])
        for (s = [-1, 1])
            translate([ax, s * (body_w / 2), wheel_center_z])
                rotate([90, 0, 0])
                    cylinder(d = wheel_arch_d, h = 20, center = true);
}

module post_holes() {
    for (ax = [front_axle_x, rear_axle_x])
        for (s = [-1, 1])
            translate([ax, s * post_y, -1])
                cylinder(d = post_hole_d, h = belt_z + 5);
}

module seq_hull(sections, z_off) {
    for (i = [0 : len(sections) - 2])
        hull() {
            translate([sections[i][0], 0, z_off])
                xsec(sections[i][1], sections[i][2]);
            translate([sections[i + 1][0], 0, z_off])
                xsec(sections[i + 1][1], sections[i + 1][2]);
        }
}

module xsec(w, h) {
    r = max(0.5, min(corner_r, w / 2 - 0.1, h / 2 - 0.1));
    hull()
        for (y = [-w / 2 + r, w / 2 - r])
            for (z = [r, max(r + 0.1, h - r)])
                translate([0, y, z])
                    sphere(r = r);
}
