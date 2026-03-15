// WLToys K969 (1:28) — верхняя крышка кузова (body shell)
// Тонкостенная оболочка в форме спорткара, открытая снизу.
// Крепится клипсами на 4 стойки шасси (body posts).
// Все размеры в мм. Подгоняйте параметры под свой экземпляр.

/* ======== ПАРАМЕТРЫ (ПОДГОНКА) ======== */

body_l = 175;         // длина корпуса
body_w = 75;          // макс. ширина
wall   = 1.2;         // толщина стенки (для FDM-печати)

wheelbase    = 98;    // колёсная база
front_axle_x = 38;   // от носа до передней оси
rear_axle_x  = front_axle_x + wheelbase;  // 136

belt_z   = 23;        // высота бельтлайна (граница капот/остекление)
corner_r = 5;         // радиус скругления рёбер

// Колёсные арки
wheel_arch_d   = 24;  // диаметр арки (колесо ~20 + зазор)
wheel_center_z = 12;  // высота центра колеса от низа корпуса

// Крепёжные стойки (body posts)
post_hole_d = 3.0;    // диаметр отверстия (стойка ~2.5 + зазор)
post_y      = 27.5;   // расстояние стоек от центральной оси

$fn = 48;

/* ======== ПРОФИЛИ КУЗОВА ======== */

// Нижняя часть (от носа до хвоста): [x, ширина, высота]
lower = [
    [0,              42, 13],   // нос
    [12,             56, 16],   // передний бампер
    [front_axle_x,   72, 20],  // передние крылья
    [55,          body_w, belt_z],
    [body_l / 2,  body_w, belt_z],  // середина
    [120,         body_w, belt_z],
    [rear_axle_x,    71, 20],  // задние крылья
    [158,            60, 16],  // задний бампер
    [body_l,         44, 13],  // хвост
];

// Кабина — над бельтлайном: [x, ширина, высота_над_бельтлайном]
cabin = [
    [56,   62,  2],   // начало лобового стекла
    [68,   58, 22],   // лобовое стекло
    [82,   55, 26],   // передняя часть крыши
    [97,   54, 28],   // пик крыши
    [110,  55, 24],   // задняя часть крыши
    [123,  57, 14],   // заднее стекло
    [136,  60,  2],   // конец остекления
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

// Внешняя форма автомобиля
module car_outer() {
    seq_hull(lower, 0);
    seq_hull(cabin, belt_z);
}

// Внутренняя полость (создаёт тонкие стенки)
module car_inner() {
    inset_l = [for (s = lower)
        [s[0], max(6, s[1] - wall * 2), max(4, s[2] - wall)]];
    seq_hull(inset_l, 0);

    inset_c = [for (s = cabin)
        [s[0], max(6, s[1] - wall * 2), max(1, s[2] - wall)]];
    seq_hull(inset_c, belt_z);
}

// Отрезаем дно — корка открыта снизу
module bottom_cut() {
    translate([-5, -body_w, -100])
        cube([body_l + 10, body_w * 2, 100]);
}

// Колёсные арки — 4 полукруглых выреза
module wheel_arches() {
    for (ax = [front_axle_x, rear_axle_x])
        for (s = [-1, 1])
            translate([ax, s * (body_w / 2), wheel_center_z])
                rotate([90, 0, 0])
                    cylinder(d = wheel_arch_d, h = 20, center = true);
}

// Отверстия под стойки крепления
module post_holes() {
    for (ax = [front_axle_x, rear_axle_x])
        for (s = [-1, 1])
            translate([ax, s * post_y, -1])
                cylinder(d = post_hole_d, h = belt_z + 5);
}

// Лофт: hull между соседними сечениями
module seq_hull(sections, z_off) {
    for (i = [0 : len(sections) - 2])
        hull() {
            translate([sections[i][0], 0, z_off])
                xsec(sections[i][1], sections[i][2]);
            translate([sections[i + 1][0], 0, z_off])
                xsec(sections[i + 1][1], sections[i + 1][2]);
        }
}

// Поперечное сечение: скруглённый прямоугольник в плоскости YZ
module xsec(w, h) {
    r = max(0.5, min(corner_r, w / 2 - 0.1, h / 2 - 0.1));
    hull()
        for (y = [-w / 2 + r, w / 2 - r])
            for (z = [r, max(r + 0.1, h - r)])
                translate([0, y, z])
                    sphere(r = r);
}
