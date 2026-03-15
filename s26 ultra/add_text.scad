// "I ❤️ OpenClaw 🦀" on galaxy s26 ultra case
// Text is engraved (flush with surface), separate inlay STL for red color
// part = "combined" | "case" | "inlay"

part = "combined";

$fn = 64;
engrave_depth = 0.8; // depth of engraving into back surface

// SVG viewBox is 128x128; we scale to desired mm size
crab_svg = "crab.svg";
heart_svg = "heart.svg";

// All design elements as 2D, to be extruded
// Positioned so that when rotated 180° around Y, they read correctly from -z (back)
module design_2d() {
    // Line 1: "I" + ❤️ + "OpenClaw"
    // "I" at left
    translate([-24, 6, 0])
        text("I", size=7, font="Arial:style=Bold", halign="center", valign="center");

    // Heart emoji - scale to match text cap height
    translate([-14, 5.5, 0])
        scale([0.12, 0.12, 1])
        import(heart_svg, center=true);

    // "OpenClaw"
    translate([10, 6, 0])
        text("OpenClaw", size=6, font="Arial:style=Bold", halign="center", valign="center");

    // Line 2: Crab emoji - scale to ~80mm
    translate([0, -28, 0])
        scale([0.8, 0.8, 1])
        import(crab_svg, center=true);
}

// 3D engraving tool - cuts from z=-0.01 to z=engrave_depth into the case body
module design_3d_cutter() {
    // Mirror X so text reads correctly from back (-z direction)
    translate([0, 0, -0.01])
    mirror([1, 0, 0])
    linear_extrude(height=engrave_depth + 0.02)
        design_2d();
}

// 3D inlay piece - fills the engraving from z=0 to z=engrave_depth, flush with back
module design_3d_inlay() {
    mirror([1, 0, 0])
    linear_extrude(height=engrave_depth)
        design_2d();
}

if (part == "combined") {
    // Case with engraving filled with red inlay
    difference() {
        import("galaxy-s26-ultra-case.stl");
        design_3d_cutter();
    }
    color("red") design_3d_inlay();
} else if (part == "case") {
    difference() {
        import("galaxy-s26-ultra-case.stl");
        design_3d_cutter();
    }
} else if (part == "inlay") {
    design_3d_inlay();
}
