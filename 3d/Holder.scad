//import("./triton-Edge_Cuts.svg");


# translate([-69,112.5]) import("./triton.stl");

$fn=16;

cx = 40;
cy = 70;

module screw_thing() {
        linear_extrude(10) 
        difference() {
            minkowski() {
                square(4,5);
                circle(3);
            }
            translate([4,4]) circle(d=2.9);
        }
}

module outer(r=5) {
    minkowski() {
        square([cx,cy]);
        circle(r);
    }
}

module inner(r=1) {
    outer(r=r);
}

module slide (s=6, i=1) {

    intersection() {
        linear_extrude(4)
        difference() {
            outer();
            inner(r=i);
        }
        translate([-10,cy-10,]) cube([cx+20,20,20]);
    }
    intersection() {
        linear_extrude(4)
        difference() {
            outer();
            inner(r=i);
        }
        translate([cx/2,cy/2,3]) rotate([0,45,0]) cube([cx-s,cy,cx-s], center=true);
    }
    
    linear_extrude(4) difference() {
        outer(r=3);
        inner(r=i);
        translate([-10,-10,0]) square([100,10]);
    }
    

    
}

module mount(h=2) {
    difference() {
        linear_extrude(h) outer();
        translate([cx/5,cy*4/5,0]) cylinder(h=h, d1=4, d2=4+h*2);
        translate([cx*4/5,cy*4/5,0]) cylinder(h=h, d1=4, d2=4+h*2);
    }
    difference() {
        linear_extrude(6)
        difference() {
            outer();
            inner();
        }
        rotate([0,180,0]) translate([-cx,0,-6]) slide(s=5.5, i=0.5);
    }
}

module case() {
    difference () {
    union() {
    difference() {

        linear_extrude(25) outer();


        translate([0,0,-1]) linear_extrude(17) inner();
        // USB-C
        usb();
        
        
linear_extrude(30) translate([0,0]) scale(0.04)
import("trident.svg");

    }
        translate([0,0,3]) {
             screw_thing();
             translate ([cx,0]) mirror([1,0,0]) screw_thing();
             translate ([cx,cy]) mirror([1,1,0]) screw_thing();
             translate ([0,cy]) mirror([0,1,0]) screw_thing();
    }
    }
    
    
        translate([20,763,18]) scale(1.05) fob(h=h);
        translate([35,76,18]) scale(1.05) fob(h=h+10);
        translate([5,76,18]) scale(1.05) fob(h=h-10);
    

    }
}

module usb() {
translate([20,0,5])
rotate([90])
linear_extrude(10) 
hull() {
    translate ([-3,0]) circle(3);
    translate ([3,0]) circle(3);
    translate ([0,-3]) square([12,6], center=true);
}
}


d = 6;
h = 45;
l = 30;
module fob(bevel=false, h=h) {
    difference () {
    rotate([90,-90,0])
    difference() {
        union() {
            cylinder(h, d=d);
            translate([0,-(d-2)/2,0]) cube([l,d-2, h]);
        }
        translate([l-5, 0, 5]) rotate([90,0,0]) cylinder(d, d=4, center=true);

        
    }
            if(bevel) {
            translate([0, 0,-d]) rotate([45,0,0]) cube(2*d, center=true);
        }
    }
}

//fob(bevel=true, h=h+10);
//fob(bevel=true, h=h-10);
color("grey") case();
rotate([0,180,0]) translate([-cx,0,0]) slide();
intersection() {
linear_extrude(25)
    inner();

translate([0,0,17]) union() {
translate([cx+1,cy/2,0]) rotate([0,45,0]) cube([4,cy+5,4], center=true);
translate([-1,cy/2,0]) rotate([0,45,0]) cube([4,cy+5,4], center=true);
}
}
//color("lime") rotate([0,0,180]) translate([-cx,-cy,-16]) mount();
