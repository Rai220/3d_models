#!/bin/bash
# Экспорт трёх STL-файлов для многоцветной печати
# Использование: cd mandelbrot_panel && bash export_stl.sh

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
SCAD="$DIR/mandelbrot.scad"
OUT="$DIR/stl"

mkdir -p "$OUT"

# Генерация карты высот (если нет или устарела)
if [ ! -f "$DIR/heightmap.dat" ] || [ "$DIR/generate_heightmap.py" -nt "$DIR/heightmap.dat" ]; then
    echo "=== Генерация карты высот ==="
    python3 "$DIR/generate_heightmap.py" > "$DIR/heightmap.dat"
fi

echo "=== Экспорт основания (цвет 1) ==="
openscad -o "$OUT/base.stl"   -D 'PART=1' "$SCAD"

echo "=== Экспорт рельефа (цвет 2) ==="
openscad -o "$OUT/relief.stl" -D 'PART=2' "$SCAD"

echo "=== Экспорт рамки (цвет 3) ==="
openscad -o "$OUT/frame.stl"  -D 'PART=3' "$SCAD"

echo ""
echo "Готово! Файлы в $OUT/"
ls -lh "$OUT"/*.stl
