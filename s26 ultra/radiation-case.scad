// Galaxy S26 Ultra case with radiation symbol cutout on the back
// Black case + yellow phone = ☢ look through the cutouts

$fn = 120;
cut_depth = 7; // deep enough to cut through back wall

// Radiation symbol parameters — sized to fill the back panel
// Standard trefoil proportions (ISO style)
center_r = 5;       // center circle radius
blade_inner = 7.5;  // blade start (gap from center)
blade_outer = 33;   // blade end — no ring, so blades go bigger

// Symbol center position — shifted down to avoid camera module area
sym_x = 0;
sym_y = -18;

// One blade sector: 60° wide arc segment
module blade(angle) {
    rotate([0, 0, angle])
    intersection() {
        // 60° pie slice centered on 0°
        polygon([
            [0, 0],
            [blade_outer * 2 * cos(-30), blade_outer * 2 * sin(-30)],
            [blade_outer * 2, 0],
            [blade_outer * 2 * cos(30), blade_outer * 2 * sin(30)]
        ]);
        // Annular ring for blade
        difference() {
            circle(r = blade_outer);
            circle(r = blade_inner);
        }
    }
}

// Full 2D radiation symbol
module radiation_2d() {
    // Center circle
    circle(r = center_r);

    // Three blades at 120° intervals
    // Standard orientation: one blade pointing up (90°)
    blade(90);
    blade(210);
    blade(330);

    // No outer ring — better structural integrity
}

// 3D cutter — extrudes the symbol and positions it on the back
module radiation_cutter() {
    translate([sym_x, sym_y, -0.5])
    linear_extrude(height = cut_depth)
        radiation_2d();
}

difference() {
    import("galaxy-s26-ultra-case.stl");
    radiation_cutter();
}
