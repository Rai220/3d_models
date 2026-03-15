#!/usr/bin/env python3
"""Генерация карты высот фрактала Мандельброта для OpenSCAD surface().

Использует smooth iteration count и логарифмическое отображение
для плавного, пологого рельефа без резких пиков.
"""

import sys
import math

# Параметры (panel_w, panel_h, res должны совпадать с .scad)
PANEL_W   = 120       # мм
PANEL_H   = 80        # мм
RES       = 0.5       # мм на пиксель
MAX_ITER  = 100       # итераций (больше = плавнее переходы)
MAX_DEPTH = 6.0       # макс. высота рельефа, мм

# Область комплексной плоскости
CX_MIN, CX_MAX = -2.2, 0.8
CY_MIN, CY_MAX = -1.2, 1.2

BAILOUT = 256.0  # большой радиус для точного smooth iteration

cols = int(PANEL_W / RES)
rows = int(PANEL_H / RES)

LOG2 = math.log(2)

def mandel_smooth(cx, cy):
    """Возвращает плавное число итераций (float) или -1 для точек внутри множества."""
    zx, zy = 0.0, 0.0
    for i in range(MAX_ITER):
        zx2, zy2 = zx * zx, zy * zy
        if zx2 + zy2 > BAILOUT:
            # Smooth iteration count: убирает ступеньки
            log_zn = math.log(zx2 + zy2) / 2.0
            nu = math.log(log_zn / LOG2) / LOG2
            return i + 1 - nu
        zx, zy = zx2 - zy2 + cx, 2 * zx * zy + cy
    return -1  # внутри множества


def height(smooth_iter):
    """Преобразование итераций в высоту: логарифмическое, инвертированное.

    Граница множества — самая высокая часть рельефа.
    Далёкие точки — плавно спускаются к нулю.
    """
    if smooth_iter < 0:
        return MAX_DEPTH  # внутри множества — плато наверху
    # Нормализация: 0..1 (0 = далеко, 1 = у границы)
    t = smooth_iter / MAX_ITER
    # Инверсия + логарифмическое сглаживание
    h = MAX_DEPTH * (1.0 - math.pow(t, 0.4))
    return max(0.0, h)


out = sys.stdout
for r in range(rows):
    cy = CY_MIN + (CY_MAX - CY_MIN) * r / rows
    row_vals = []
    for c in range(cols):
        cx = CX_MIN + (CX_MAX - CX_MIN) * c / cols
        si = mandel_smooth(cx, cy)
        h = height(si)
        row_vals.append(f"{h:.2f}")
    out.write(" ".join(row_vals) + "\n")

print(f"// {cols}x{rows} pixels, res={RES}mm", file=sys.stderr)
