SetFactory("OpenCASCADE");
N_inlet = DefineNumber[ 30, Name "Parameters/N_inlet" ];
N_vertical = DefineNumber[ 40, Name "Parameters/N_vertical" ];
P_vertical = DefineNumber[ 1.10, Name "Parameters/P_vertical" ];
N_airfoil = DefineNumber[ 50, Name "Parameters/N_airfoil" ];
N_shear = DefineNumber[ 30, Name "Parameters/N_shear" ];
P_shear = DefineNumber[ 1.1, Name "Parameters/P_shear" ];
L = DefineNumber[ 6, Name "Parameters/L" ];
C = DefineNumber[ 6, Name "Parameters/C" ];
Refinement_offset = DefineNumber[ 0.3508356243812806, Name "Parameters/Refinement_offset" ];
N_refinement = DefineNumber[ 60.0, Name "Parameters/N_refinement" ];
P_refinement = DefineNumber[ 1.0999999999999999, Name "Parameters/P_refinement" ];
AoA_deg = DefineNumber[ 0, Name "Parameters/AoA" ];
AoA = AoA_deg*3.14/180;
a_dim = 0.2;
Point(1) = {1.0*Cos(AoA) + -0.0013*Sin(AoA),-1* 1.0*Sin(AoA) + -0.0013*Cos(AoA),0.0,a_dim};
Point(2) = {0.95*Cos(AoA) + -0.0016*Sin(AoA),-1* 0.95*Sin(AoA) + -0.0016*Cos(AoA),0.0,a_dim};
Point(3) = {0.9*Cos(AoA) + -0.0022*Sin(AoA),-1* 0.9*Sin(AoA) + -0.0022*Cos(AoA),0.0,a_dim};
Point(4) = {0.8*Cos(AoA) + -0.0039*Sin(AoA),-1* 0.8*Sin(AoA) + -0.0039*Cos(AoA),0.0,a_dim};
Point(5) = {0.7*Cos(AoA) + -0.0065*Sin(AoA),-1* 0.7*Sin(AoA) + -0.0065*Cos(AoA),0.0,a_dim};
Point(6) = {0.6*Cos(AoA) + -0.01*Sin(AoA),-1* 0.6*Sin(AoA) + -0.01*Cos(AoA),0.0,a_dim};
Point(7) = {0.5*Cos(AoA) + -0.014*Sin(AoA),-1* 0.5*Sin(AoA) + -0.014*Cos(AoA),0.0,a_dim};
Point(8) = {0.4*Cos(AoA) + -0.018*Sin(AoA),-1* 0.4*Sin(AoA) + -0.018*Cos(AoA),0.0,a_dim};
Point(9) = {0.3*Cos(AoA) + -0.0226*Sin(AoA),-1* 0.3*Sin(AoA) + -0.0226*Cos(AoA),0.0,a_dim};
Point(10) = {0.25*Cos(AoA) + -0.025*Sin(AoA),-1* 0.25*Sin(AoA) + -0.025*Cos(AoA),0.0,a_dim};
Point(11) = {0.2*Cos(AoA) + -0.0274*Sin(AoA),-1* 0.2*Sin(AoA) + -0.0274*Cos(AoA),0.0,a_dim};
Point(12) = {0.15*Cos(AoA) + -0.0288*Sin(AoA),-1* 0.15*Sin(AoA) + -0.0288*Cos(AoA),0.0,a_dim};
Point(13) = {0.1*Cos(AoA) + -0.0286*Sin(AoA),-1* 0.1*Sin(AoA) + -0.0286*Cos(AoA),0.0,a_dim};
Point(14) = {0.075*Cos(AoA) + -0.0274*Sin(AoA),-1* 0.075*Sin(AoA) + -0.0274*Cos(AoA),0.0,a_dim};
Point(15) = {0.05*Cos(AoA) + -0.0249*Sin(AoA),-1* 0.05*Sin(AoA) + -0.0249*Cos(AoA),0.0,a_dim};
Point(16) = {0.025*Cos(AoA) + -0.0195*Sin(AoA),-1* 0.025*Sin(AoA) + -0.0195*Cos(AoA),0.0,a_dim};
Point(17) = {0.0125*Cos(AoA) + -0.0143*Sin(AoA),-1* 0.0125*Sin(AoA) + -0.0143*Cos(AoA),0.0,a_dim};
Point(18) = {0.0*Cos(AoA) + 0.0*Sin(AoA),-1* 0.0*Sin(AoA) + 0.0*Cos(AoA),0.0,a_dim};
Point(19) = {0.0125*Cos(AoA) + 0.0244*Sin(AoA),-1* 0.0125*Sin(AoA) + 0.0244*Cos(AoA),0.0,a_dim};
Point(20) = {0.025*Cos(AoA) + 0.0339*Sin(AoA),-1* 0.025*Sin(AoA) + 0.0339*Cos(AoA),0.0,a_dim};
Point(21) = {0.05*Cos(AoA) + 0.0473*Sin(AoA),-1* 0.05*Sin(AoA) + 0.0473*Cos(AoA),0.0,a_dim};
Point(22) = {0.075*Cos(AoA) + 0.0576*Sin(AoA),-1* 0.075*Sin(AoA) + 0.0576*Cos(AoA),0.0,a_dim};
Point(23) = {0.1*Cos(AoA) + 0.0659*Sin(AoA),-1* 0.1*Sin(AoA) + 0.0659*Cos(AoA),0.0,a_dim};
Point(24) = {0.15*Cos(AoA) + 0.0789*Sin(AoA),-1* 0.15*Sin(AoA) + 0.0789*Cos(AoA),0.0,a_dim};
Point(25) = {0.2*Cos(AoA) + 0.088*Sin(AoA),-1* 0.2*Sin(AoA) + 0.088*Cos(AoA),0.0,a_dim};
Point(26) = {0.25*Cos(AoA) + 0.0941*Sin(AoA),-1* 0.25*Sin(AoA) + 0.0941*Cos(AoA),0.0,a_dim};
Point(27) = {0.3*Cos(AoA) + 0.0976*Sin(AoA),-1* 0.3*Sin(AoA) + 0.0976*Cos(AoA),0.0,a_dim};
Point(28) = {0.4*Cos(AoA) + 0.098*Sin(AoA),-1* 0.4*Sin(AoA) + 0.098*Cos(AoA),0.0,a_dim};
Point(29) = {0.5*Cos(AoA) + 0.0919*Sin(AoA),-1* 0.5*Sin(AoA) + 0.0919*Cos(AoA),0.0,a_dim};
Point(30) = {0.6*Cos(AoA) + 0.0814*Sin(AoA),-1* 0.6*Sin(AoA) + 0.0814*Cos(AoA),0.0,a_dim};
Point(31) = {0.7*Cos(AoA) + 0.0669*Sin(AoA),-1* 0.7*Sin(AoA) + 0.0669*Cos(AoA),0.0,a_dim};
Point(32) = {0.8*Cos(AoA) + 0.0489*Sin(AoA),-1* 0.8*Sin(AoA) + 0.0489*Cos(AoA),0.0,a_dim};
Point(33) = {0.9*Cos(AoA) + 0.0271*Sin(AoA),-1* 0.9*Sin(AoA) + 0.0271*Cos(AoA),0.0,a_dim};
Point(34) = {0.95*Cos(AoA) + 0.0147*Sin(AoA),-1* 0.95*Sin(AoA) + 0.0147*Cos(AoA),0.0,a_dim};
Point(35) = {1.0*Cos(AoA) + 0.0013*Sin(AoA),-1* 1.0*Sin(AoA) + 0.0013*Cos(AoA),0.0,a_dim};
Spline(1) = {22:35};
Spline(2) = {1:14};
Line(3) = {35, 1};
Spline(4) = {14:22};
Point(36) = {0, C, 0};
Point(37) = {0, -C, 0};
Point(38) = {L, C, 0};
Point(39) = {L, -C, 0};
Point(40) = {1, C, 0};
Point(41) = {1, -C, 0};
Point(42) = {L, -L* 1.0*Sin(AoA) + 0.0013*L*Cos(AoA), 0};
Point(43) = {L, -L* 1.0*Sin(AoA) + -0.0013*L*Cos(AoA), 0};
Point(44) = {0, 0, 0};
Point(45) = { Refinement_offset*Sin(AoA),  Refinement_offset*Cos(AoA), 0};
Point(46) = { - Refinement_offset*Sin(AoA),  - Refinement_offset*Cos(AoA), 0};
Point(47) = {1*Cos(AoA), -1* 1.0*Sin(AoA) + 0.0013*1*Cos(AoA) + Refinement_offset, 0};
Point(48) = {L, -L* 1.0*Sin(AoA) + 0.0013*L*Cos(AoA)+ Refinement_offset, 0};
Point(49) = {L, -L* 1.0*Sin(AoA) + -0.0013*L*Cos(AoA) - Refinement_offset, 0};
Point(50) = {1*Cos(AoA), -1* 1.0*Sin(AoA) + -0.0013*1*Cos(AoA) - Refinement_offset, 0};
Circle(5) = {37, 44, 36};
Line(6) = {36, 40};
Line(7) = {37, 41};
Line(8) = {40, 38};
Line(9) = {40, 35};
Line(10) = {41, 1};
Line(11) = {41, 39};
Line(12) = {36, 45};
Line(13) = {45, 22};
Line(14) = {37, 46};
Line(15) = {46, 14};
Line(16) = {38, 48};
Line(17) = {48, 42};
Line(18) = {42, 43};
Line(19) = {43, 49};
Line(20) = {39, 49};
Line(21) = {43, 1};
Line(22) = {50, 1};
Line(23) = {42, 35};
Circle(24) = {46, 44, 45};
Line(25) = {45, 47};
Line(26) = {46, 50};
Line(27) = {47, 48};
Line(28) = {50, 49};
Line(29) = {36, 45};
Line(30) = {37, 46};
Line(31) = {40, 47};
Line(32) = {41, 50};
Line(33) = {47, 35};
Curve Loop(1) = {12,-24,-14,5 };
Curve Loop(2) = {6,31,-25,-12 };
Curve Loop(3) = {7,32,-26,-14 };
Curve Loop(4) = {8,16,-27,-31 };
Curve Loop(5) = {11,20,-28,-32 };
Curve Loop(6) = {13,-4,-15,24 };
Curve Loop(7) = {25,33,-1,-13 };
Curve Loop(8) = {26,22,2,-15 };
Curve Loop(9) = {27,17,23,-33 };
Curve Loop(10) = {28,-19,21,-22 };
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};
Plane Surface(7) = {7};
Plane Surface(8) = {8};
Plane Surface(9) = {9};
Plane Surface(10) = {10};
Curve Loop(11) = {18,21,-3,-23 };
Plane Surface(11) = {11};
Transfinite Curve {-5, -24, -4} = N_inlet Using Progression 1.0; 
Transfinite Curve {-12, -31, -16, -20, -32, -14} = N_vertical Using Progression P_vertical; 
Transfinite Curve {-13, -33, -17, 19, -22, -15} = N_refinement Using Progression P_refinement; 
Transfinite Curve {6, 25, -1, 2, 7, 26} = N_airfoil Using Progression 1.0; 
Transfinite Curve {3, 18} = 4 Using Progression 1.0; 
Transfinite Curve {8, 27, -23, -21, 28, 11} = N_shear Using Progression P_shear; 
Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Transfinite Surface {5};
Transfinite Surface {6};
Transfinite Surface {7};
Transfinite Surface {8};
Transfinite Surface {9};
Transfinite Surface {10};
Transfinite Surface {11};
Recombine Surface {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}; 
Physical Surface ("fluid", 1) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}; 
Physical Curve ("airfoil", 2) = {1, 2, 4}; 
Physical Curve ("inlet", 3) = {5}; 
Physical Curve ("outlet", 4) = {16, 17, 20}; 
Physical Curve ("limits", 5) = {6, 7, 8, 11}; 
Physical Point ("airfoil", 6) = {22, 14, 35}; 
Physical Point ("limits", 7) = {36, 37, 40, 41, 38, 39}; 
Physical Point ("outlet", 8) = {42, 48, 49}; 
Physical Curve ("airfoil", 2) += {3}; 
Physical Curve ("outlet", 4) += {18, 19}; 
Physical Point ("airfoil", 6) += {1}; 
Physical Point ("outlet", 8) += {43}; 
