sz=12;
faces=35;
zazor=.01;


module inner() {
union() {
translate ([0,0,sz*0.5])
  cylinder (sz,sz/2,sz/2, $fn=faces);
sphere (sz, $fn=faces);
};};

module outer() {
union() {
difference (){
difference (){
difference() {
sphere(sz+sz*0.25, $fn=faces);
translate ([0,0,sz*0.25])
  sphere(sz+zazor, $fn=faces);
};
translate ([sz*-1.5,sz*-1.75,sz*0.5])
cube([sz*3,sz*3,sz]);
};
union() {
translate([0,sz*-1.5,sz*-0.4])
cube([sz*0.1,sz*3, sz]);
rotate([0,0,90])
  translate([0,sz*-1.5,sz*-0.4])
     cube([sz*0.1,sz*3, sz]);
};
};
translate ([0,0,sz*-1.75])
  cylinder (sz,sz/2,sz/2, $fn=faces);
};
};

inner();
color("red", 0.25)
  outer();



