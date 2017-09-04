//scale([.1,.1,.1])
include <raspberrypi3.scad>;
include <cubex.scad>;

translate([-1.5,-5,-2])
  rotate([0,0,90])
	scale([0.1,0.1,0.1])
		pi3();
	
Box(10,20,4,50);

// The $fn parameter will influence all objects inside this module
// It can, optionally, be overridden when instantiating the module
module Box(w,l,h,$fn=40) {

  difference(){
    union(){
      cubeX([w,l,h],0.3,true,true);
	  translate([0,7,1])
		sphere(1.5,true);
    }
    translate([0,0,-1.3])
      cubeX([w-0.4,l-0.4,h+2],0.3,true,true);
    translate([0,7,3])
      cylinder(4,0.2,2,true);
    translate([-1,2.5,1])
        cube([6.5,1.5,h-1],true);
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

