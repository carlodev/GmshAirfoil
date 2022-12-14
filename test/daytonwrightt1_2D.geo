SetFactory("OpenCASCADE");
N_inlet = DefineNumber[ 20, Name "Parameters/N_inlet" ];
N_vertical = DefineNumber[ 40, Name "Parameters/N_vertical" ];
P_vertical = DefineNumber[ 1.15, Name "Parameters/P_vertical" ];
N_airfoil = DefineNumber[ 50, Name "Parameters/N_airfoil" ];
N_shear = DefineNumber[ 20, Name "Parameters/N_shear" ];
P_shear = DefineNumber[ 1.2, Name "Parameters/P_shear" ];
L = DefineNumber[ 6, Name "Parameters/L" ];
C = DefineNumber[ 6, Name "Parameters/C" ];
AoA_deg = DefineNumber[ 0, Name "Parameters/AoA" ];
AoA = AoA_deg*3.14/180;
a_dim = 0.2;
Point(1) = {1.0*Cos(AoA) + 0.0049*Sin(AoA),-1* 1.0*Sin(AoA) + 0.0049*Cos(AoA),0.0,a_dim};
Point(2) = {0.95*Cos(AoA) + 0.0026*Sin(AoA),-1* 0.95*Sin(AoA) + 0.0026*Cos(AoA),0.0,a_dim};
Point(3) = {0.9*Cos(AoA) + 0.0016*Sin(AoA),-1* 0.9*Sin(AoA) + 0.0016*Cos(AoA),0.0,a_dim};
Point(4) = {0.8*Cos(AoA) + 0.0*Sin(AoA),-1* 0.8*Sin(AoA) + 0.0*Cos(AoA),0.0,a_dim};
Point(5) = {0.7*Cos(AoA) + 0.0003*Sin(AoA),-1* 0.7*Sin(AoA) + 0.0003*Cos(AoA),0.0,a_dim};
Point(6) = {0.6*Cos(AoA) + 0.0036*Sin(AoA),-1* 0.6*Sin(AoA) + 0.0036*Cos(AoA),0.0,a_dim};
Point(7) = {0.5*Cos(AoA) + 0.0065*Sin(AoA),-1* 0.5*Sin(AoA) + 0.0065*Cos(AoA),0.0,a_dim};
Point(8) = {0.4*Cos(AoA) + 0.0068*Sin(AoA),-1* 0.4*Sin(AoA) + 0.0068*Cos(AoA),0.0,a_dim};
Point(9) = {0.3*Cos(AoA) + 0.0036*Sin(AoA),-1* 0.3*Sin(AoA) + 0.0036*Cos(AoA),0.0,a_dim};
Point(10) = {0.2*Cos(AoA) + 0.0002*Sin(AoA),-1* 0.2*Sin(AoA) + 0.0002*Cos(AoA),0.0,a_dim};
Point(11) = {0.15*Cos(AoA) + 0.0*Sin(AoA),-1* 0.15*Sin(AoA) + 0.0*Cos(AoA),0.0,a_dim};
Point(12) = {0.1*Cos(AoA) + 0.0017*Sin(AoA),-1* 0.1*Sin(AoA) + 0.0017*Cos(AoA),0.0,a_dim};
Point(13) = {0.075*Cos(AoA) + 0.0038*Sin(AoA),-1* 0.075*Sin(AoA) + 0.0038*Cos(AoA),0.0,a_dim};
Point(14) = {0.05*Cos(AoA) + 0.0074*Sin(AoA),-1* 0.05*Sin(AoA) + 0.0074*Cos(AoA),0.0,a_dim};
Point(15) = {0.025*Cos(AoA) + 0.0141*Sin(AoA),-1* 0.025*Sin(AoA) + 0.0141*Cos(AoA),0.0,a_dim};
Point(16) = {0.0125*Cos(AoA) + 0.02*Sin(AoA),-1* 0.0125*Sin(AoA) + 0.02*Cos(AoA),0.0,a_dim};
Point(17) = {0.0*Cos(AoA) + 0.0404*Sin(AoA),-1* 0.0*Sin(AoA) + 0.0404*Cos(AoA),0.0,a_dim};
Point(18) = {0.0125*Cos(AoA) + 0.0621*Sin(AoA),-1* 0.0125*Sin(AoA) + 0.0621*Cos(AoA),0.0,a_dim};
Point(19) = {0.025*Cos(AoA) + 0.0734*Sin(AoA),-1* 0.025*Sin(AoA) + 0.0734*Cos(AoA),0.0,a_dim};
Point(20) = {0.05*Cos(AoA) + 0.09*Sin(AoA),-1* 0.05*Sin(AoA) + 0.09*Cos(AoA),0.0,a_dim};
Point(21) = {0.075*Cos(AoA) + 0.1017*Sin(AoA),-1* 0.075*Sin(AoA) + 0.1017*Cos(AoA),0.0,a_dim};
Point(22) = {0.1*Cos(AoA) + 0.1111*Sin(AoA),-1* 0.1*Sin(AoA) + 0.1111*Cos(AoA),0.0,a_dim};
Point(23) = {0.15*Cos(AoA) + 0.1251*Sin(AoA),-1* 0.15*Sin(AoA) + 0.1251*Cos(AoA),0.0,a_dim};
Point(24) = {0.2*Cos(AoA) + 0.1325*Sin(AoA),-1* 0.2*Sin(AoA) + 0.1325*Cos(AoA),0.0,a_dim};
Point(25) = {0.3*Cos(AoA) + 0.1373*Sin(AoA),-1* 0.3*Sin(AoA) + 0.1373*Cos(AoA),0.0,a_dim};
Point(26) = {0.4*Cos(AoA) + 0.1344*Sin(AoA),-1* 0.4*Sin(AoA) + 0.1344*Cos(AoA),0.0,a_dim};
Point(27) = {0.5*Cos(AoA) + 0.1252*Sin(AoA),-1* 0.5*Sin(AoA) + 0.1252*Cos(AoA),0.0,a_dim};
Point(28) = {0.6*Cos(AoA) + 0.1107*Sin(AoA),-1* 0.6*Sin(AoA) + 0.1107*Cos(AoA),0.0,a_dim};
Point(29) = {0.7*Cos(AoA) + 0.0916*Sin(AoA),-1* 0.7*Sin(AoA) + 0.0916*Cos(AoA),0.0,a_dim};
Point(30) = {0.8*Cos(AoA) + 0.0673*Sin(AoA),-1* 0.8*Sin(AoA) + 0.0673*Cos(AoA),0.0,a_dim};
Point(31) = {0.9*Cos(AoA) + 0.0388*Sin(AoA),-1* 0.9*Sin(AoA) + 0.0388*Cos(AoA),0.0,a_dim};
Point(32) = {0.95*Cos(AoA) + 0.0233*Sin(AoA),-1* 0.95*Sin(AoA) + 0.0233*Cos(AoA),0.0,a_dim};
Point(33) = {1.0*Cos(AoA) + 0.007*Sin(AoA),-1* 1.0*Sin(AoA) + 0.007*Cos(AoA),0.0,a_dim};
Spline(1) = {21:33};
Spline(2) = {1:13};
Line(3) = {33, 1};
Spline(4) = {13:21};
Point(34) = {0, C, 0};
Point(35) = {0, -C, 0};
Point(36) = {L, C, 0};
Point(37) = {L, -C, 0};
Point(38) = {1, C, 0};
Point(39) = {1, -C, 0};
Point(40) = {L, -L* 1.0*Sin(AoA) + 0.007*L*Cos(AoA), 0};
Point(41) = {L, -L* 1.0*Sin(AoA) + 0.0049*L*Cos(AoA), 0};
Point(42) = {0, 0, 0};
Circle(5) = {35, 42, 34};
Line(6) = {34, 38};
Line(7) = {35, 39};
Line(8) = {38, 36};
Line(9) = {38, 33};
Line(10) = {39, 1};
Line(11) = {39, 37};
Line(12) = {34, 21};
Line(13) = {35, 13};
Line(14) = {36, 40};
Line(15) = {40, 41};
Line(16) = {37, 41};
Line(17) = {41, 1};
Line(18) = {40, 33};
Curve Loop(1) = {12,-4,-13,5 };
Curve Loop(2) = {6,9,-1,-12 };
Curve Loop(3) = {7,10,2,-13 };
Curve Loop(4) = {8,14,18,-9 };
Curve Loop(5) = {11,16,17,-10 };
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Curve Loop(6) = {15,17,-3,-18 };
Plane Surface(6) = {6};
Transfinite Curve {-5, -4} = N_inlet Using Progression 1.0; 
Transfinite Curve {-12, -9, -14, -16, -10, -13} = N_vertical Using Progression P_vertical; 
Transfinite Curve {6, -1, 2, 7} = N_airfoil Using Progression 1.0; 
Transfinite Curve {3, 15} = 4 Using Progression 1.0; 
Transfinite Curve {8, -18, -17, 11} = N_shear Using Progression P_shear; 
Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Transfinite Surface {5};
Transfinite Surface {6};
Recombine Surface {1, 2, 3, 4, 5, 6}; 
Physical Surface("fluid", 1) = {1, 2, 3, 4, 5, 6};