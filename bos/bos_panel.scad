// Brotherhood of Steel — рельефное панно для многоцветной 3D-печати
//
// === ПОДГОТОВКА ===
//   python3 generate_layers.py
//   # Создаст SVG-файлы слоёв из FO3_BoS_logo.webp
//
// === ЭКСПОРТ МНОГОЦВЕТНЫХ STL ===
//   PART = 0  → всё вместе (превью)
//   PART = 1  → подложка/фон (белый)
//   PART = 2  → крылья (тёмно-синий)
//   PART = 3  → шестерёнки (чёрный)
//   PART = 4  → меч (серебристый/серый)
//   PART = 5  → рамка (тёмно-серый)
//
// Для AMS/мультиматериальной печати:
//   openscad -D PART=1 -o bos_background.stl bos_panel.scad
//   openscad -D PART=2 -o bos_wings.stl bos_panel.scad
//   openscad -D PART=3 -o bos_gears.stl bos_panel.scad
//   openscad -D PART=4 -o bos_sword.stl bos_panel.scad
//   openscad -D PART=5 -o bos_frame.stl bos_panel.scad

/* ======== ВЫБОР ДЕТАЛИ ======== */

PART = 0;

/* ======== ПАРАМЕТРЫ ======== */

// Размеры панно
panel_w     = 150;          // ширина, мм
panel_h     = 181.4;        // высота, мм (из пропорций изображения)

// Толщины слоёв
base_t      = 2.0;          // толщина подложки
relief_t    = 2.0;          // толщина рельефных элементов (крылья, шестерёнки)
sword_t     = 3.0;          // толщина меча (выступает над остальным)

// Масштаб: SVG от potrace в pt (1pt = 1px изображения)
// panel_w_mm / image_width_px
svg_scale   = 150 / 1100;

// Рамка
frame_w     = 4;            // ширина рамки
frame_h     = base_t + relief_t + sword_t;  // высота рамки
frame_r     = 2;            // скругление рамки

// Крепление на стену
mount_d     = 5;            // диаметр отверстия
mount_inset = 8;            // отступ от края рамки

// SVG от potrace имеет Y-инверсию, поэтому зеркалим
// Размер изображения в pt
img_h_pt    = 1330;

/* ======== МОДУЛИ ======== */

module svg_layer(file) {
    scale([svg_scale, svg_scale, 1])
        import(file, center = false);
}

// 2D-профили слоёв (для быстрых булевых операций)
module _2d_wings()  { svg_layer("wings.svg"); }
module _2d_gears()  { svg_layer("gears.svg"); }
module _2d_sword()  { svg_layer("sword.svg"); }

// «Сырые» 3D-формы (с перекрытиями)
module _raw_wings()  { linear_extrude(relief_t) _2d_wings(); }
module _raw_gears()  { linear_extrude(relief_t) _2d_gears(); }
module _raw_sword()  { linear_extrude(sword_t)  _2d_sword(); }

module _raw_frame() {
    difference() {
        linear_extrude(frame_h)
            offset(r = frame_r)
                offset(delta = frame_w - frame_r)
                    svg_layer("full.svg");
        translate([0, 0, -0.01])
            linear_extrude(frame_h + 0.02)
                offset(delta = -0.3)
                    svg_layer("full.svg");
    }
}

// --- Эксклюзивные детали для AMS (без пересечений) ---

// 1. Подложка: полный контур минус все рельефные элементы
module base_plate() {
    difference() {
        linear_extrude(base_t)
            svg_layer("full.svg");
        // Вырезаем зоны, где будут крылья/шестерёнки/меч
        // (они начинаются с base_t, но занимают и нижний слой для AMS)
    }
}

// 2. Крылья: вырезаем шестерёнки и меч (булевы в 2D — быстро)
module wings_layer() {
    translate([0, 0, base_t])
        linear_extrude(relief_t)
            difference() {
                _2d_wings();
                _2d_gears();
                _2d_sword();
            }
}

// 3. Шестерёнки: вырезаем меч (булевы в 2D — быстро)
module gears_layer() {
    translate([0, 0, base_t])
        linear_extrude(relief_t)
            difference() {
                _2d_gears();
                _2d_sword();
            }
}

// 4. Меч: как есть (самый верхний рельеф)
module sword_layer() {
    translate([0, 0, base_t])
        _raw_sword();
}

// 5. Рамка: вырезаем всё внутреннее содержимое
module frame() {
    difference() {
        _raw_frame();
        // Вырезаем рельефные слои (2D union → один extrude — быстрее)
        translate([0, 0, base_t])
            linear_extrude(max(relief_t, sword_t) + 0.01)
                union() {
                    _2d_wings();
                    _2d_gears();
                    _2d_sword();
                }
        // Отверстия для крепления на стену
        wall_mounts();
    }
}

module wall_mounts() {
    for (dx = [panel_w * 0.3, panel_w * 0.7]) {
        translate([dx, panel_h - mount_inset, -0.01])
            cylinder(d = mount_d, h = frame_h + 0.02, $fn = 30);
    }
}

/* ======== СБОРКА ======== */

if (PART == 0 || PART == 1)
    color("White")          base_plate();

if (PART == 0 || PART == 2)
    color("MidnightBlue")   wings_layer();

if (PART == 0 || PART == 3)
    color("Black")          gears_layer();

if (PART == 0 || PART == 4)
    color("Silver")         sword_layer();

if (PART == 0 || PART == 5)
    color("DimGray")        frame();
