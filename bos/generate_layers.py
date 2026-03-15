#!/usr/bin/env python3
"""Разделение логотипа Brotherhood of Steel на цветовые слои для 3D-печати.

Создаёт SVG-файлы для каждого цветового слоя:
  - background.svg  — круглая подложка (белая часть)
  - wings.svg       — крылья (тёмно-синие)
  - gears.svg       — шестерёнки (чёрные)
  - sword.svg       — меч (серый)
  - outline.svg     — внешний контур (обводка)

Использование:
  python3 generate_layers.py
  # Создаст .pbm и .svg файлы в текущей папке
"""

import subprocess
import sys
from pathlib import Path
from PIL import Image
import numpy as np

SRC = Path(__file__).parent / "FO3_BoS_logo.webp"
OUT = Path(__file__).parent

# Целевой размер панно (мм) и DPI для конвертации
PANEL_W_MM = 150
# Высота рассчитается автоматически из пропорций

def load_image():
    img = Image.open(SRC).convert("RGBA")
    return img

def rgba_to_hsv_and_alpha(img):
    """Возвращает массивы H, S, V (0-255) и alpha."""
    arr = np.array(img)
    alpha = arr[:, :, 3]
    rgb = Image.fromarray(arr[:, :, :3])
    hsv = np.array(rgb.convert("HSV"))
    return hsv[:, :, 0], hsv[:, :, 1], hsv[:, :, 2], alpha

def segment_layers(img):
    """Сегментация изображения на слои по цвету."""
    h, s, v, alpha = rgba_to_hsv_and_alpha(img)
    rows, cols = h.shape

    # Маска видимых пикселей (не прозрачных)
    visible = alpha > 128

    # Классификация по цвету:
    # Крылья: тёмно-синий (hue ~150-170 в 0-255 шкале, т.е. ~210-240° → 148-170)
    # На самом деле в HSV Pillow: H 0-255 соответствует 0-360°
    # Синий ~220° → H ≈ 156, но давайте проверим эмпирически

    # Чёрные шестерёнки: низкая яркость, любой оттенок
    is_dark = (v < 80) & visible

    # Серый меч: средняя яркость, низкая насыщенность
    is_gray = (v >= 80) & (v < 220) & (s < 60) & visible

    # Синие крылья: насыщенный цвет
    is_blue = (s >= 40) & (v >= 50) & visible & ~is_dark

    # Белая подложка: высокая яркость, низкая насыщенность
    is_white = (v >= 220) & (s < 60) & visible

    # Светло-серая обводка (внешний край, если есть)
    # Объединим с серым мечом или выделим в рамку

    # Для лучшего результата нужна очистка — морфологические операции
    # Сделаем через Pillow

    return {
        "wings": is_blue,
        "gears": is_dark,
        "sword": is_gray,
        "background": is_white,
        "full": visible,
    }

def mask_to_pbm(mask, filepath):
    """Сохраняет булеву маску как PBM (для potrace)."""
    # PBM: 1 = чёрный (foreground), 0 = белый (background)
    # potrace трассирует чёрные области
    img = Image.fromarray((mask * 255).astype(np.uint8), mode='L')
    # Пороговая бинаризация
    img = img.point(lambda x: 0 if x > 128 else 255)  # инверсия для PBM
    img.save(filepath)

def pbm_to_svg(pbm_path, svg_path):
    """Конвертация PBM → SVG через potrace."""
    subprocess.run([
        "potrace",
        str(pbm_path),
        "-b", "svg",
        "-o", str(svg_path),
        "--flat",           # без вложенных групп
        "-t", "5",          # подавление шума (despeckling)
        "-O", "0.2",        # оптимизация кривых
    ], check=True)

def cleanup_and_dilate(mask, iterations=1):
    """Простая морфологическая очистка маски."""
    from PIL import ImageFilter
    img = Image.fromarray((mask * 255).astype(np.uint8), mode='L')
    # Закрытие (убрать дырки)
    for _ in range(iterations):
        img = img.filter(ImageFilter.MaxFilter(3))
    for _ in range(iterations):
        img = img.filter(ImageFilter.MinFilter(3))
    return np.array(img) > 128

def main():
    print("Загрузка изображения...")
    img = load_image()
    w, h = img.size
    print(f"  Размер: {w}x{h}")

    print("Сегментация по цветам...")
    layers = segment_layers(img)

    # Очистка масок
    for name in layers:
        layers[name] = cleanup_and_dilate(layers[name], iterations=2)

    # Сохранение PBM и конвертация в SVG
    for name, mask in layers.items():
        pbm_path = OUT / f"{name}.pbm"
        svg_path = OUT / f"{name}.svg"

        print(f"  {name}: {np.sum(mask)} px → {svg_path.name}")
        mask_to_pbm(mask, pbm_path)
        pbm_to_svg(pbm_path, svg_path)

    # Вычислим масштаб для OpenSCAD
    # SVG от potrace будет в пикселях. Нужен scale = PANEL_W_MM / w_pixels
    scale = PANEL_W_MM / w
    panel_h_mm = h * scale

    print(f"\n=== Параметры для OpenSCAD ===")
    print(f"  PANEL_W = {PANEL_W_MM} мм")
    print(f"  PANEL_H = {panel_h_mm:.1f} мм")
    print(f"  SCALE   = {scale:.6f}")
    print(f"  Исходное изображение: {w}x{h} px")
    print(f"\nГотово! SVG-файлы созданы.")

if __name__ == "__main__":
    main()
