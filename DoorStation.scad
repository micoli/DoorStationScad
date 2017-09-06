//scale([.1,.1,.1])
include <raspberrypi3.scad>;
include <cubex.scad>;
// 1.5/0.7 camera
// 0.5 led 
echo(version=version());

$fn=20;
Box(10,20,4,false,50);
	
module Lcd(){
	//http://www.velleman.eu/images/products/8/lcd1602lc_t.jpg
	//http://www.surenoo.com/surenoo_store/Photobucket/DSC06238.jpg
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

module hygiaphone(){
	$fn=20;
	radiusStep=0.3;
	stepSegments=[0,60,40,20,15,15];
	for (j = [0:5])
	{
		for (i = [0:stepSegments[j]:360])
		{
			translate([
				sin(i)*j*radiusStep,
				cos(i)*j*radiusStep,
				0
			])
			cylinder(3,0.06,0.06);
		}
	}
}
module button(radius,label,font,angle=0,size=0.8){
	$fn=30;
	difference(){
		color("grey")
		hull(){
			cylinder(0.3,radius,radius);
			translate([0,0,.6])
			scale([1,1,0.2])
			sphere(radius);
		}
		translate([0,0,.6])
		rotate([0,0,angle])
		linear_extrude(height = 0.3) {
			text(label,font = font,size=size, halign="center",valign="center");
		}
	}
}
module buttonCyl(buttonCylRadius,radius){
	hull(){
		translate([0,0,1.3])
		scale([1,1,0.2])
		sphere(radius);
		cylinder(1.1,buttonCylRadius,buttonCylRadius);
	}
}

module buttonCylHole(buttonCylRadius,radius){
	translate([0,0,-1])
	cylinder(3,radius+0.01,radius+0.01);
}

module Box(w,l,h,print=false,$fn=40) {
	centerCamera=[2.3,7];
	centerHygiaphone=[-2,7];
	centerMicrophone=[0.4,5.3];
	centerScreen=[0,3];
	buttonCenter=[[-2.3,0],[0,0],[2.3,0]];
	buttonRadius=0.7;
	buttonCylRadius=0.9;
	
	if(!print){
		translate([centerScreen[0],centerScreen[1],0.9])
		Lcd();
	}

	if(!print){
		translate([-1.5,-5,-1.3])
		rotate([0,0,90])
		scale([0.1,0.1,0.1])
		pi3();
	}

	difference(){
		color("grey")
		union(){
			/*box*/
			
			cubeX([w,l,h],0.3,true,true);
			
			/*camera*/
			translate([centerCamera[0],centerCamera[1],1])
			sphere(1.5,true);

			for(k = [0:2]){
				translate([buttonCenter[k][0],buttonCenter[k][1],0.8])
				buttonCyl(buttonCylRadius,buttonRadius);
			}

		}
		
		color("grey")
		union(){
			for(k = [0:2]){
				translate([buttonCenter[k][0],buttonCenter[k][1],0.8])
				buttonCylHole(buttonCylRadius,buttonRadius);
			}
		
		
			/* defonce box */
			translate([0,0,-1.1])
			cubeX([w-0.4,l-0.4,h+2],0.3,true,true);
			
			/*trou ecran*/
			translate([centerScreen[0],centerScreen[1],3.7])
			rotate([0,90,0])
			cylinder(6.70,2,2,true);

			/* hygiaphone */
			translate([centerHygiaphone[0],centerHygiaphone[1],0])
			hygiaphone();

			/* microphone */
			translate([centerMicrophone[0],centerMicrophone[1],1.8])
			cube([0.4,0.1,1],true);

			/* cone camera */
			translate([centerCamera[0],centerCamera[1],3])
			cylinder(4,0.2,2,true);
		

			/* cut en dessous */
			translate([0,0,-2])
			cube([w*1.1,l*1.,1],true);
			
		}
	}
	
	/*button*/
	translate([buttonCenter[0][0],buttonCenter[0][1],1.5])
	button(buttonRadius,"<","Liberation Sans:style=Bold",90);
	
	translate([buttonCenter[1][0],buttonCenter[1][1],1.5])
	button(buttonRadius,"\u2713","Arial Unicode MS",0,0.7);
	
	translate([buttonCenter[2][0],buttonCenter[2][1],1.5])
	button(buttonRadius,">","Liberation Sans:style=Bold",90);
}

/*
translate([0,3,2.5]);
	hull(){
	translate([0,0.9,-0.5])
		rotate([20,0,0])
			cube([6.90,1,0.3],true);
	translate([0,-0.9,-0.5])
		rotate([-20,0,0])
			cube([6.90,1,0.3],true);
}

//surrelevation ecran
difference(){
	translate([0,3,1.3])
		cubeX([8.5,3.7,3],0.3,true,true);
	translate([0,3,2])
		cube([7.2,2.38,3],true);
	translate([0,3,-1.3])
		cube([9,5,7],true);
}
*/