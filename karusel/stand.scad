details = 360;

main_d = 60;
pole_h = 120;



module Stand() {
difference() {
union() {
cylinder(h = main_d / 10, r1 = main_d, r2 = main_d, center = true, $fn = details);
translate([0,0, main_d / 10])
cylinder(h = main_d / 10, r1 = main_d - main_d / 10, r2 = main_d - main_d / 10, center = true, $fn = details);
translate([0,0, main_d / 5])
cylinder(h = main_d / 10, r1 = main_d - main_d / 5, r2 = main_d - main_d / 5, center = true, $fn = details);
}

translate([0,0, main_d / 10])
cylinder(h = 3 * (main_d / 10), r1 = main_d / 10 + 0.02, r2 = main_d / 10 + 0.02, center = false, $fn = details);
}
}

module Pole() {
union() {
translate([0,0, 0])
cylinder(h = pole_h, r1 = main_d / 10, r2 = main_d / 10, center = false, $fn = details);    
translate([0,0, pole_h])
sphere(r = main_d / 10, $fn= details); 
}
}

module HookRing() {
rotate([90,0,0])
difference() {
cylinder(h = main_d / 20, r1 = main_d / 10, r2 = main_d / 10, center = true, $fn = details);
color("red")
cylinder(h = main_d / 18, r1 = main_d / 15, r2 = main_d / 15, center = true, $fn = details);
translate([0, main_d / 10, 0])
cube([main_d / 5, main_d / 5, main_d / 18], center = true);
}
}

module Roof() {
difference() {
union() {
translate([main_d - main_d / 5, 0, 0]) HookRing();
translate([ -(main_d - main_d / 5), 0, 0]) HookRing();
rotate([0, 0, 90]) translate([main_d - main_d / 5, 0, 0]) HookRing();
rotate([0, 0, 90]) translate([ -(main_d - main_d / 5), 0, 0]) HookRing();
cylinder(h = main_d / 2, r1 = main_d, r2 = main_d / 10, center = false, $fn = details);
cylinder(h = main_d / 20, r1 = main_d, r2 = main_d, center = false, $fn = details);    
translate([0,0, main_d / 2])
sphere(r = main_d / 10 + 0.2, $fn= details);     
}

translate([0,0,-1])
cylinder(h = 3 * (main_d / 10), r1 = main_d / 10 + 0.2, r2 = main_d / 10 + 0.2, center = false, $fn = details);
translate([0,0, 3 * (main_d / 10) - 1])
sphere(r = main_d / 10 + 0.2, $fn= details); 
}
}
color("darkgrey", 0.5)
    Stand();
color("orange")
    translate([0,0, main_d / 10])
        Pole();
color("yellow", 0.5)
    translate([0,0, pole_h - main_d / 10]) Roof();

