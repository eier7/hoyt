
module main(){
    difference(){
        cube([110, 96, 4]);
        translate([45, 87.5, -1]) cylinder(r=2, h=6);
        translate([55, 87.5, -1]) cylinder(r=2, h=6);
        translate([65, 87.5, -1]) cylinder(r=2, h=6);
        translate([35, 20, -1]) cube([40, 40, 6]);
        translate([-2, -2, 2]) cube([110+4, 81, 2+2]);
    }
}

//for test
module Ydisplay(){
    color("green"){
        translate([0, 0, 2]){
            cube([110, 81, 3]);
            translate([35, 20.5, -17]){
                cube([40, 40, 17]);
            }
        }
    }
}
Ydisplay();
main();
