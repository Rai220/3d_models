#!/bin/bash
# Экспорт всех деталей панно Brotherhood of Steel в STL
# Детали НЕ пересекаются — готовы для AMS / MMU мультиматериальной печати
#
# Импорт в Bambu Studio:
#   1. Открыть bos_background.stl
#   2. ПКМ → Add Part → добавить остальные 4 STL
#   3. Назначить каждой детали свой филамент/цвет

set -e
cd "$(dirname "$0")"

echo "=== Brotherhood of Steel — экспорт STL для AMS ==="

for part in 1 2 3 4 5; do
    case $part in
        1) name="background"; color="белый" ;;
        2) name="wings";      color="тёмно-синий" ;;
        3) name="gears";      color="чёрный" ;;
        4) name="sword";      color="серебристый" ;;
        5) name="frame";      color="тёмно-серый" ;;
    esac
    echo "  PART=$part → bos_${name}.stl ($color)"
    openscad -D "PART=$part" -o "bos_${name}.stl" bos_panel.scad
done

echo ""
echo "Готово! Файлы:"
ls -lh bos_*.stl
echo ""
echo "Импорт в Bambu Studio / OrcaSlicer:"
echo "  1. Открыть bos_background.stl"
echo "  2. ПКМ на модели → Add Part → добавить остальные STL"
echo "  3. Назначить каждой части свой цвет филамента"
