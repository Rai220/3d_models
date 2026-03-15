// Фрактал Мандельброта — рельефное панно для многоцветной 3D-печати
// Использует surface() с предгенерированной картой высот — быстрый рендер.
//
// === ПОДГОТОВКА ===
// python3 generate_heightmap.py > heightmap.dat
//
// === ЭКСПОРТ МНОГОЦВЕТНЫХ STL ===
//   PART = 0  → всё вместе (превью)
//   PART = 1  → основание (цвет 1)
//   PART = 2  → рельеф фрактала (цвет 2)
//   PART = 3  → рамка (цвет 3)

/* ======== ВЫБОР ДЕТАЛИ ======== */

PART = 0;

/* ======== ПАРАМЕТРЫ ======== */

panel_w   = 120;
panel_h   = 80;
base_t    = 2.0;
max_depth = 6.0;
res       = 0.5;      // должен совпадать с generate_heightmap.py

// Рамка
frame_w   = 3;
frame_h   = max_depth + base_t + 1;

/* ======== МОДУЛИ ======== */

module base_plate() {
    cube([panel_w, panel_h, base_t]);
}

module fractal_relief() {
    translate([0, 0, base_t])
        scale([res, res, 1])
            surface(file = "heightmap.dat", center = false, convexity = 4);
}

module frame() {
    difference() {
        translate([-frame_w, -frame_w, 0])
            cube([panel_w + frame_w * 2, panel_h + frame_w * 2, frame_h]);
        translate([-0.01, -0.01, -0.01])
            cube([panel_w + 0.02, panel_h + 0.02, frame_h + 0.02]);
    }
}

/* ======== СБОРКА ======== */

if (PART == 0 || PART == 1)
    color("SteelBlue")   base_plate();

if (PART == 0 || PART == 2)
    color("Gold")         fractal_relief();

if (PART == 0 || PART == 3)
    color("DimGray")      frame();
