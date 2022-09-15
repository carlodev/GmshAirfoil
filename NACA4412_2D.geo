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
Point(1) = {1.0*Cos(AoA) + 0.0013*Sin(AoA),-1* 1.0*Sin(AoA) + 0.0013*Cos(AoA),0.0,a_dim};
Point(2) = {0.95*Cos(AoA) + 0.0147*Sin(AoA),-1* 0.95*Sin(AoA) + 0.0147*Cos(AoA),0.0,a_dim};
Point(3) = {0.9*Cos(AoA) + 0.0271*Sin(AoA),-1* 0.9*Sin(AoA) + 0.0271*Cos(AoA),0.0,a_dim};
Point(4) = {0.8*Cos(AoA) + 0.0489*Sin(AoA),-1* 0.8*Sin(AoA) + 0.0489*Cos(AoA),0.0,a_dim};
Point(5) = {0.7*Cos(AoA) + 0.0669*Sin(AoA),-1* 0.7*Sin(AoA) + 0.0669*Cos(AoA),0.0,a_dim};
Point(6) = {0.6*Cos(AoA) + 0.0814*Sin(AoA),-1* 0.6*Sin(AoA) + 0.0814*Cos(AoA),0.0,a_dim};
Point(7) = {0.5*Cos(AoA) + 0.0919*Sin(AoA),-1* 0.5*Sin(AoA) + 0.0919*Cos(AoA),0.0,a_dim};
Point(8) = {0.4*Cos(AoA) + 0.098*Sin(AoA),-1* 0.4*Sin(AoA) + 0.098*Cos(AoA),0.0,a_dim};
Point(9) = {0.3*Cos(AoA) + 0.0976*Sin(AoA),-1* 0.3*Sin(AoA) + 0.0976*Cos(AoA),0.0,a_dim};
Point(10) = {0.25*Cos(AoA) + 0.0941*Sin(AoA),-1* 0.25*Sin(AoA) + 0.0941*Cos(AoA),0.0,a_dim};
Point(11) = {0.2*Cos(AoA) + 0.088*Sin(AoA),-1* 0.2*Sin(AoA) + 0.088*Cos(AoA),0.0,a_dim};
Point(12) = {0.15*Cos(AoA) + 0.0789*Sin(AoA),-1* 0.15*Sin(AoA) + 0.0789*Cos(AoA),0.0,a_dim};
Point(13) = {0.1*Cos(AoA) + 0.0659*Sin(AoA),-1* 0.1*Sin(AoA) + 0.0659*Cos(AoA),0.0,a_dim};
Point(14) = {0.075*Cos(AoA) + 0.0576*Sin(AoA),-1* 0.075*Sin(AoA) + 0.0576*Cos(AoA),0.0,a_dim};
Point(15) = {0.05*Cos(AoA) + 0.0473*Sin(AoA),-1* 0.05*Sin(AoA) + 0.0473*Cos(AoA),0.0,a_dim};
Point(16) = {0.025*Cos(AoA) + 0.0339*Sin(AoA),-1* 0.025*Sin(AoA) + 0.0339*Cos(AoA),0.0,a_dim};
Point(17) = {0.0125*Cos(AoA) + 0.0244*Sin(AoA),-1* 0.0125*Sin(AoA) + 0.0244*Cos(AoA),0.0,a_dim};
Point(18) = {0.0*Cos(AoA) + 0.0*Sin(AoA),-1* 0.0*Sin(AoA) + 0.0*Cos(AoA),0.0,a_dim};
Point(19) = {0.0125*Cos(AoA) + -0.0143*Sin(AoA),-1* 0.0125*Sin(AoA) + -0.0143*Cos(AoA),0.0,a_dim};
Point(20) = {0.025*Cos(AoA) + -0.0195*Sin(AoA),-1* 0.025*Sin(AoA) + -0.0195*Cos(AoA),0.0,a_dim};
Point(21) = {0.05*Cos(AoA) + -0.0249*Sin(AoA),-1* 0.05*Sin(AoA) + -0.0249*Cos(AoA),0.0,a_dim};
Point(22) = {0.075*Cos(AoA) + -0.0274*Sin(AoA),-1* 0.075*Sin(AoA) + -0.0274*Cos(AoA),0.0,a_dim};
Point(23) = {0.1*Cos(AoA) + -0.0286*Sin(AoA),-1* 0.1*Sin(AoA) + -0.0286*Cos(AoA),0.0,a_dim};
Point(24) = {0.15*Cos(AoA) + -0.0288*Sin(AoA),-1* 0.15*Sin(AoA) + -0.0288*Cos(AoA),0.0,a_dim};
Point(25) = {0.2*Cos(AoA) + -0.0274*Sin(AoA),-1* 0.2*Sin(AoA) + -0.0274*Cos(AoA),0.0,a_dim};
Point(26) = {0.25*Cos(AoA) + -0.025*Sin(AoA),-1* 0.25*Sin(AoA) + -0.025*Cos(AoA),0.0,a_dim};
Point(27) = {0.3*Cos(AoA) + -0.0226*Sin(AoA),-1* 0.3*Sin(AoA) + -0.0226*Cos(AoA),0.0,a_dim};
Point(28) = {0.4*Cos(AoA) + -0.018*Sin(AoA),-1* 0.4*Sin(AoA) + -0.018*Cos(AoA),0.0,a_dim};
Point(29) = {0.5*Cos(AoA) + -0.014*Sin(AoA),-1* 0.5*Sin(AoA) + -0.014*Cos(AoA),0.0,a_dim};
Point(30) = {0.6*Cos(AoA) + -0.01*Sin(AoA),-1* 0.6*Sin(AoA) + -0.01*Cos(AoA),0.0,a_dim};
Point(31) = {0.7*Cos(AoA) + -0.0065*Sin(AoA),-1* 0.7*Sin(AoA) + -0.0065*Cos(AoA),0.0,a_dim};
Point(32) = {0.8*Cos(AoA) + -0.0039*Sin(AoA),-1* 0.8*Sin(AoA) + -0.0039*Cos(AoA),0.0,a_dim};
Point(33) = {0.9*Cos(AoA) + -0.0022*Sin(AoA),-1* 0.9*Sin(AoA) + -0.0022*Cos(AoA),0.0,a_dim};
Point(34) = {0.95*Cos(AoA) + -0.0016*Sin(AoA),-1* 0.95*Sin(AoA) + -0.0016*Cos(AoA),0.0,a_dim};
Point(35) = {1.0*Cos(AoA) + -0.0013*Sin(AoA),-1* 1.0*Sin(AoA) + -0.0013*Cos(AoA),0.0,a_dim};
Spline(1) = {1:14};
Spline(2) = {22:35};
Line(3) = {1, 35};
Spline(4) = {14:22};
Point(36) = {0, 6, 0};
Point(37) = {0, -6, 0};
Point(38) = {6, 6, 0};
Point(39) = {6, -6, 0};
Point(40) = {1, 6, 0};
Point(41) = {1, -6, 0};
Point(42) = {6,-1* 6.0*Sin(AoA) + -0.03358260244827261*Cos(AoA),0.0,a_dim};
Point(43) = {6,-1* 6.0*Sin(AoA) + -0.03618102020384099*Cos(AoA),0.0,a_dim};
Circle(5) = {37, 18, 36};
Line(6) = {36, 40};
Line(7) = {37, 41};
Line(8) = {40, 38};
Line(9) = {40, 1};
Line(10) = {41, 35};
Line(11) = {41, 39};
Line(12) = {36, 14};
Line(13) = {37, 22};
Line(14) = {38, 42.0};
Line(15) = {42.0, 43.0};
Line(16) = {39, 43.0};
Line(17) = {43.0, 35};
Line(18) = {42.0, 1};
Curve Loop(1) = {12,4,-13,5 };
Curve Loop(2) = {6,9,1,-12 };
Curve Loop(3) = {7,10,-2,-13 };
Curve Loop(4) = {8,14,18,-9 };
Curve Loop(5) = {11,16,17,-10 };
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Curve Loop(6) = {15,17,-3,-18 };
Plane Surface(6) = {6};
Transfinite Curve {-5, 4} = N_inlet Using Progression 1.0; 
Transfinite Curve {-12, -9, -14, -16, -10, -13} = N_vertical Using Progression P_vertical; 
Transfinite Curve {6, 1, -2, 7} = N_airfoil Using Progression 1.0; 
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