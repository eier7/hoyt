
$fn = 200;

screenwidth = 110;
screenheight = 81;
screendepth = 20;
screeninnerwidth = 74;
screeninnerheight = 66;
bottomplateheight = 60;
boxdepth = 30;
totallength = bottomplateheight + screenheight;

module main(){
    //TOP
    difference(){
        cube([screenwidth, screenheight + bottomplateheight, 2]);
        translate([screenwidth-55, 20, -2]) cube([50, 20, 5]);//USB CABLE
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
    difference(){
        translate([(screenwidth/2)-18, screenheight +(bottomplateheight/2), -3]) cylinder(r=10, h=3);
        translate([(screenwidth/2)-18, screenheight +(bottomplateheight/2), -4]) cylinder(r=7, h=5);
    }
    difference(){
        translate([(screenwidth/2), screenheight +(bottomplateheight/2), -3]) cylinder(r=10, h=3);
        translate([(screenwidth/2), screenheight +(bottomplateheight/2), -4]) cylinder(r=7, h=5);
    }
    difference(){
        translate([(screenwidth/2)+18, screenheight +(bottomplateheight/2), -3]) cylinder(r=10, h=3);
        translate([(screenwidth/2)+18, screenheight +(bottomplateheight/2), -4]) cylinder(r=7, h=5);
    }
    difference(){
        translate([(screenwidth/2)+18, screenheight +(bottomplateheight/2), -3]) cylinder(r=10, h=3);
        translate([(screenwidth/2)+18, screenheight +(bottomplateheight/2), -4]) cylinder(r=7, h=5);
    }
    //SIDES
    translate([0,0,-boxdepth]){
        cube([4, totallength, boxdepth]);
        cube([screenwidth, 4, boxdepth]);
    }
    translate([screenwidth-4, 0, -boxdepth]){
        cube([4, totallength, boxdepth]);
    }
    translate([0, totallength-4, -boxdepth/2]){
        cube([screenwidth, 4, boxdepth/2]);
    }
    //mounting
    translate([0,0,-boxdepth]){
        mountingcorner();
    }
    translate([screenwidth-4, 0, -boxdepth]){
        rotate(90){
            mountingcorner();
        }
    }
    translate([screenwidth/2, screenheight+(bottomplateheight/2), -6]){
        translate([31,17,0]){
            difference(){
                cylinder(r=4, h=6);
                translate([0,0,-1]) cylinder(r=2, h=9);
            }
        }
        translate([-31,17,0]){
            difference(){
                cylinder(r=4, h=6);
                translate([0,0,-1]) cylinder(r=2, h=9);
            }
        }
        translate([31,-17,0]){
            difference(){
                cylinder(r=4, h=6);
                translate([0,0,-1]) cylinder(r=2, h=9);
            }
        }
        translate([-31,-17,0]){
            difference(){
                cylinder(r=4, h=6);
                translate([0,0,-1]) cylinder(r=2, h=9);
            }
        }
    }

}
module mountingcorner(){
    difference(){
        intersection(){
            cylinder(r=40, h=4);
            cube([40,40,4]);
        }
        translate([20,20,-1]){
            cylinder(r=2,h=6);
            translate([0,0,3]) cylinder(r=4,h=4);
        }
    }
}
/////////
//testing
/////////

module Ydisplay(previewdepth){
    color("black"){
        translate([0, 0, 2-previewdepth]){
            cube([screenwidth, screenheight, 3]);
            translate([(screenwidth - screeninnerwidth)/2, (screenheight - screeninnerheight)/2, -17]){
                cube([screeninnerwidth, screeninnerheight, 20]);
            }
        }
    }
    translate([screenwidth/2,screenheight/2,5-previewdepth]){
        color("blue") cube([58, 32, 2], center=true);
    }
}
module buttonpcb(previewdepth){
    translate([screenwidth/2, screenheight+(bottomplateheight/2), -7-previewdepth+1]){//+1 because plate 2 depth is centered
        difference(){
            color("green") cube([70, 42, 2],center=true);
            translate([31,17,-1]) cylinder(r=2, h=4);
            translate([31,-17,-1]) cylinder(r=2, h=4);
            translate([-31,17,-1]) cylinder(r=2, h=4);
            translate([-31,-17,-1]) cylinder(r=2, h=4);
        }

        translate([0,0,2]) color("black") cube([12, 12, 3],center=true);
        translate([0,0,3]){
            color("black") cylinder(r=3, h=3);
            translate([0,0,3])  color("blue") cylinder(r=7, h=2);
            translate([0,0,5]) color("blue")  cylinder(r=6, h=5);
        }

        translate([-18,0,0]){
            translate([0,0,2]) color("black") cube([12, 12, 3],center=true);
            translate([0,0,3]){
                color("black") cylinder(r=3, h=3);
                translate([0,0,3])  color("white")  cylinder(r=7, h=2);
                translate([0,0,5]) color("white")  cylinder(r=6, h=5);
            }
        }

        translate([18,0,0]){
            translate([0,0,2]) color("black") cube([12, 12, 3],center=true);
            translate([0,0,3]){
                color("black") cylinder(r=3, h=3);
                translate([0,0,3])  color("white") cylinder(r=7, h=2);
                translate([0,0,5]) color("white") cylinder(r=6, h=5);
            }
        }
    }
}
Ydisplay(-80);
buttonpcb(80);
main();
