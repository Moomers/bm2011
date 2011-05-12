// The PipeDream from BM 2010
// 
// Pipes are 4 feet per square / 1.22 m --> define this to be 1
// pipe diameter 1.66 inches/ 4.2cm     --> this is 0.034

#include "colors.inc"
#include "metals.inc"
#include "glass.inc"
#include "stones1.inc"

camera {
  angle 70
  location <-3,-3.2,1>
  look_at <0,0,2>
  sky <0,0,1>
}

plane {
  <0,0,1>,0
  texture {T_Grnt15a}
}

// The vertical beams
#declare X = 0;
#while(X <= 5)
  #declare Y = 0;
  #while(Y <= 5)
    #declare Z=5;
    #if ((X =2) | (X=3))
      #declare Z=Z-1;
    #end
    #if ((Y =2) | (Y=3))
      #declare Z=Z-1;
    #end
    cylinder {
      <X,Y,0>,
      <X,Y,Z>,
      0.034
      texture {
        T_Chrome_3B
      }
    }
    #declare Y = Y+1;
  #end
  #declare X = X+1;
#end

// Lower Full Horizontal Beams
#declare X = 0;
#while(X <= 5)
  #declare Z = 0.5;
  #while(Z <= 2.5)
    cylinder {
      <X,0,Z>,
      <X,5,Z>,
      0.034
      texture {
        T_Chrome_3B
      }
    }
    #declare Z = Z+1;
  #end
  #declare X = X+1;
#end
// Lower Split Horizontal Beams
#declare X = 0;
#while(X <= 5)
  #declare Z = 3.5;
  #while(Z <= 4.5)
    #declare TMP = Z;
    #if ((X=2) | (X=3))
      #declare TMP=Z+1;
    #end
    #if (TMP < 5.5)
      cylinder {
        <X,0,Z>,
        <X,5.5-TMP,Z>,
        0.034
        texture {
          T_Chrome_3B
        }
      }
      cylinder {
        <X,5,Z>,
        <X,TMP-0.5,Z>,
        0.034
        texture {
          T_Chrome_3B
        }
      }
    #end

    #declare Z = Z+1;
  #end
  #declare X = X+1;
#end


// Higher Full Horizontal Beams
#declare Y = 0;
#while(Y <= 5)
  #declare Z = 1;
  #while(Z <= 3)
    cylinder {
      <0,Y,Z>,
      <5,Y,Z>,
      0.034
      texture {
        T_Chrome_3B
      }
    }
    #declare Z = Z+1;
  #end
  #declare Y = Y+1;
#end

// Higher Split Horizontal Beams
#declare Y = 0;
#while(Y <= 5)
  #declare Z = 4;
  #while(Z <= 5)
    #declare TMP = Z;
    #if ((Y=2) | (Y=3))
      #declare TMP=Z+1;
    #end
    #if (TMP < 6)
      cylinder {
        <0,Y,Z>,
        <6-TMP,Y,Z>,
        0.034
        texture {
          T_Chrome_3B
        }
      }
      cylinder {
        <5,Y,Z>,
        <TMP-1,Y,Z>,
        0.034
        texture {
          T_Chrome_3B
        }
      }
    #end

    #declare Z = Z+1;
  #end
  #declare Y = Y+1;
#end

#declare lantern = sphere {<0,0,0>,0.06 texture {T_Glass3}}

// Lights on the ground, outside the structure
//light_source { <-1, -1, 0> color White fade_distance 5 fade_power 1 looks_like {lantern}}
//light_source { <6, -1, 0> color White fade_distance 5 fade_power 1 looks_like {lantern}}
//light_source { <6, 6, 0> color White fade_distance 5 fade_power 1 looks_like {lantern}}
//light_source { <-1, 6, 0> color White fade_distance 5 fade_power 1 looks_like {lantern}}

// Lights in the towers
light_source { <0.5, 0.5, 5> color White fade_distance 3 fade_power 2 looks_like {lantern}}
light_source { <4.5, 0.5, 5> color White fade_distance 3 fade_power 2 looks_like {lantern}}
light_source { <4.5, 4.5, 5> color White fade_distance 3 fade_power 2 looks_like {lantern}}
light_source { <0.5, 4.5, 5> color White fade_distance 2 fade_power 2 looks_like {lantern}}


//light_source { <2.5, 2.5, 5.5> color White fade_distance 15 fade_power 1 looks_like {lantern}}
//light_source { <4.5, 1.5, 5.5> color White fade_distance 15 fade_power 1 looks_like {lantern}}
//light_source { <3.5, 2.5, 5.5> color White fade_distance 15 fade_power 1 looks_like {lantern}}
//light_source { <-3, -3, 1.2> color White fade_distance 15 fade_power 1 }
