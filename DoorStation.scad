//scale([.1,.1,.1])
include <raspberrypi3.scad>;
include <cubex.scad>;

translate([-1.5,-5,-1.3])
  rotate([0,0,90])
	scale([0.1,0.1,0.1])
		pi3();
	
Box(10,20,4,50);
translate([0,3,1.5])
	Lcd();
	
module Lcd(){
	//http://www.velleman.eu/images/products/8/lcd1602lc_t.jpg
	difference(){
		union(){
			color("grey")
				cube([8.00,3.6,0.16],true);
			color("black")
				translate([1.5,0.5,-0.41])
					cube([3.5,1.7,0.7],true);
			color("black")
				translate([0,0,0.5])
				cube([7.10,2.38,0.7],true);
			color("blue")
				translate([0,0,0.51])
					cube([6.40,1.45,0.7],true);
			translate([0,0.1,0.41])
			linear_extrude(height = 0.5) {
				text("123456789ABCDEF",font = "Courier",size=0.5,halign="center");
			}
			translate([0,-0.5,0.41])
			linear_extrude(height = 0.5) {
				text("123456789ABCDEF",font = "Courier",size=0.5,halign="center");
			}
		}
		translate([7.5/2,-1.55,-0.1])
			cylinder(0.2,0.25,0.15);
		translate([-7.5/2,-1.55,-0.1])
			cylinder(0.2,0.25,0.15);
		translate([7.5/2,+1.55,-0.1])
			cylinder(0.2,0.25,0.15);
		translate([-7.5/2,+1.55,-0.1])
			cylinder(0.2,0.25,0.15);
	}
	
}
module Box(w,l,h,$fn=40) {

  difference(){
    union(){
	  difference(){
		  cubeX([w,l,h],0.3,true,true);
		  translate([0,0,-1.3])
				cubeX([w-0.4,l-0.4,h+2],0.3,true,true);
	  }

	  /*surrelevation ecran*/
	  difference(){
	    translate([0,3,1.3])
			cubeX([8.5,3.7,3],0.3,true,true);
		translate([0,3,2])
			cube([7.2,2.38,3],true);
		  translate([0,3,-1.3])
			cube([9,5,7],true);
	  }
	  translate([0,7,1])
		sphere(1.5,true);
	  
	  translate([0,0,-1.5])
		cylinder(4,0.6,0.6);
	}
    translate([0,7,3])
      cylinder(4,0.2,2,true);
	
	translate([0,3,0])
	  cube([3.5,1.7,4],true);
	translate([1.5,0.5,-0.41])
	  cube([3.5,1.7,0.7],true);


	/* trou ecran*/
	/*translate([0,3,1])
        cube([7,2,h-1],true);*/

	/*cut en dessous*/
    translate([0,0,-2])
        cube([w*1.1,l*1.,1],true);
  }

}

echo(version=version());
// Written by Clifford Wolf <clifford@clifford.at> and Marius
// Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

