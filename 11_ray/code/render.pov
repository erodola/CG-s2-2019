#version 3.7;
 
#include "colors.inc"
#include "load_mesh.inc"

camera { 
 perspective
 location <0,0.2,-1.3> 
 direction <0,0,1> * 5 // change focal length here
 right <-1.33, 0, 0>
 look_at <0,0.05,0>
}

background { color White }

light_source {
    <100, 500, -1000>
    color White
    area_light <400, 0, 0>, <0, 0, 400>, 20, 20
    adaptive 1
  }

plane 
{ 
     <0,1,0>, 0
     pigment { color White }
     finish {
             ambient 0.7
             brilliance 0
     }
}

/*
sphere{
  <0.1, 0.1, 0.2>, 0.1
  pigment { color rgb<0,0.7,0> }
  finish {
        ambient 0.8
        specular 0.3
        phong 0.7 phong_size 2
  }
} */

LOAD_MESH("./cat.mesh",true,0.5,0.99,0.7)
object{
	shape
	scale 0.0015
	rotate<-90,0,0>
	rotate<0,200,0>
	translate<0,0.048,0>
}
	