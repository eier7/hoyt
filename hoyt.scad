
$fn = 40;

screenwidth = 110;
screenheight = 81;
screendepth = 20;
screeninnerwidth = 74;
screeninnerheight = 66;
bottomplateheight = 50;
boxdepth = 30;

module main(){
    difference(){
        cube([screenwidth, screenheight + bottomplateheight, 2]);
        translate([(screenwidth - screeninnerwidth) /2, (screenheight - screeninnerheight) /2, -1]){
            cube([screeninnerwidth, screeninnerheight, 4]);
        }
        translate([(screenwidth/2)-18, screenheight + (bottomplateheight/2), -1]) cylinder(r=7, h=6);
        translate([(screenwidth/2), screenheight + (bottomplateheight/2), -1]) cylinder(r=7, h=6);
        translate([(screenwidth/2)+18, screenheight + (bottomplateheight/2), -1]) cylinder(r=7, h=6);
    }
    difference(){
        translate([0, screenheight, 2]) cube([screenwidth, bottomplateheight, 2]);
        translate([(screenwidth/2)-18, screenheight +(bottomplateheight/2), -1]) cylinder(r=6, h=6);
        translate([(screenwidth/2), screenheight +(bottomplateheight/2), -1]) cylinder(r=6, h=6);
        translate([(screenwidth/2)+18, screenheight +(bottomplateheight/2), -1]) cylinder(r=6, h=6);
    }
}

//for test
module Ydisplay(){
    color("green"){
        translate([0, 0, 2]){
            cube([screenwidth, screenheight, 3]);
            translate([(screenwidth - screeninnerwidth)/2, (screenheight - screeninnerheight)/2, -17]){
                cube([screeninnerwidth, screeninnerheight, 20]);
            }
        }
    }
    translate([screenwidth/2,screenheight/2,5]){
        color("blue") cube([58, 32, 2], center=true);
    }
}
module buttonpcb(){
    translate([screenwidth/2, screenheight+(bottomplateheight/2), -11]){
        color("green") cube([70, 42, 2],center=true);

        translate([0,0,2]) color("green") cube([12, 12, 3],center=true);
        translate([0,0,3]){
            color("green") cylinder(r=3, h=8);
            translate([0,0,8])  color("blue") cylinder(r=7, h=2);
            translate([0,0,10]) color("blue")  cylinder(r=6, h=5);
        }

        translate([-18,0,0]){
            translate([0,0,2]) color("green") cube([12, 12, 3],center=true);
            translate([0,0,3]){
                color("green") cylinder(r=3, h=8);
                translate([0,0,8])  color("white")  cylinder(r=7, h=2);
                translate([0,0,10]) color("white")  cylinder(r=6, h=5);
            }
        }

        translate([18,0,0]){
            translate([0,0,2]) color("green") cube([12, 12, 3],center=true);
            translate([0,0,3]){
                color("green") cylinder(r=3, h=8);
                translate([0,0,8])  color("white") cylinder(r=7, h=2);
                translate([0,0,10]) color("white") cylinder(r=6, h=5);
            }
        }
    }
}
//Ydisplay();
//buttonpcb();
main();
