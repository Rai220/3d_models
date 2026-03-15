# Vibe-Coded 3D Models

3D-модели, целиком созданные с помощью вайб-кодинга (Claude + Claude Code) и напечатанные на 3D-принтере.

Человек не написал ни строчки кода — только описывал идею и давал обратную связь. Весь код на OpenSCAD и Python сгенерирован ИИ.

## Проекты

### [Galaxy S26 Ultra — чехлы для телефона](s26%20ultra/)

Несколько вариантов чехла для Samsung Galaxy S26 Ultra с различными паттернами на задней панели.

| Radiation | Lattice | Engraved text |
|:-:|:-:|:-:|
| ![radiation](s26%20ultra/radiation-preview-back.png) | ![lattice](s26%20ultra/lattice-preview-back.png) | ![text](s26%20ultra/preview_back_full.png) |

- `radiation-case.scad` — вырез символа радиации на задней панели
- `lattice-case.scad` — ромбовидная решётка
- `add_text.scad` — гравировка текста и SVG-изображений с двухцветной печатью

---

### [Brotherhood of Steel — панно](bos/)

Многоцветное рельефное панно с логотипом Brotherhood of Steel (Fallout). 5 цветов, автоматическая сегментация изображения на слои.

<img src="bos/FO3_BoS_logo.webp" width="300" />

- `generate_layers.py` — сегментация PNG/WebP на цветовые слои через Pillow + potrace
- `bos_panel.scad` — параметрическая модель с 5 деталями для AMS-печати
- `build_3mf.py` — сборка STL в один 3MF с назначенными цветами

---

### [Mandelbrot — панно](mandelbrot_panel/)

Рельефное панно с фракталом Мандельброта. Карта высот генерируется из математической формулы, рельеф создаётся через `surface()`.

- `generate_heightmap.py` — генерация карты высот со smooth iteration count
- `mandelbrot.scad` — 3-компонентная модель (основание + рельеф + рамка)

---

## Инструменты

- **[OpenSCAD](https://openscad.org/)** — программное создание 3D-моделей
- **Python** — генерация карт высот, сегментация изображений, сборка 3MF
- **[Claude Code](https://claude.ai/claude-code)** — вайб-кодинг всего вышеперечисленного

## Лицензия

MIT
