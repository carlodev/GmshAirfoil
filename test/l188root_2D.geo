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
Point(1) = {1.0*Cos(AoA) + -0.0014*Sin(AoA),-1* 1.0*Sin(AoA) + -0.0014*Cos(AoA),0.0,a_dim};
Point(2) = {0.998782*Cos(AoA) + -0.001505*Sin(AoA),-1* 0.998782*Sin(AoA) + -0.001505*Cos(AoA),0.0,a_dim};
Point(3) = {0.995134*Cos(AoA) + -0.001819*Sin(AoA),-1* 0.995134*Sin(AoA) + -0.001819*Cos(AoA),0.0,a_dim};
Point(4) = {0.989074*Cos(AoA) + -0.002331*Sin(AoA),-1* 0.989074*Sin(AoA) + -0.002331*Cos(AoA),0.0,a_dim};
Point(5) = {0.980631*Cos(AoA) + -0.003031*Sin(AoA),-1* 0.980631*Sin(AoA) + -0.003031*Cos(AoA),0.0,a_dim};
Point(6) = {0.969846*Cos(AoA) + -0.003913*Sin(AoA),-1* 0.969846*Sin(AoA) + -0.003913*Cos(AoA),0.0,a_dim};
Point(7) = {0.956773*Cos(AoA) + -0.004969*Sin(AoA),-1* 0.956773*Sin(AoA) + -0.004969*Cos(AoA),0.0,a_dim};
Point(8) = {0.941474*Cos(AoA) + -0.006197*Sin(AoA),-1* 0.941474*Sin(AoA) + -0.006197*Cos(AoA),0.0,a_dim};
Point(9) = {0.924024*Cos(AoA) + -0.007594*Sin(AoA),-1* 0.924024*Sin(AoA) + -0.007594*Cos(AoA),0.0,a_dim};
Point(10) = {0.904509*Cos(AoA) + -0.009165*Sin(AoA),-1* 0.904509*Sin(AoA) + -0.009165*Cos(AoA),0.0,a_dim};
Point(11) = {0.883022*Cos(AoA) + -0.010914*Sin(AoA),-1* 0.883022*Sin(AoA) + -0.010914*Cos(AoA),0.0,a_dim};
Point(12) = {0.85967*Cos(AoA) + -0.012856*Sin(AoA),-1* 0.85967*Sin(AoA) + -0.012856*Cos(AoA),0.0,a_dim};
Point(13) = {0.834565*Cos(AoA) + -0.015014*Sin(AoA),-1* 0.834565*Sin(AoA) + -0.015014*Cos(AoA),0.0,a_dim};
Point(14) = {0.807831*Cos(AoA) + -0.017435*Sin(AoA),-1* 0.807831*Sin(AoA) + -0.017435*Cos(AoA),0.0,a_dim};
Point(15) = {0.779596*Cos(AoA) + -0.020266*Sin(AoA),-1* 0.779596*Sin(AoA) + -0.020266*Cos(AoA),0.0,a_dim};
Point(16) = {0.75*Cos(AoA) + -0.023435*Sin(AoA),-1* 0.75*Sin(AoA) + -0.023435*Cos(AoA),0.0,a_dim};
Point(17) = {0.719186*Cos(AoA) + -0.026799*Sin(AoA),-1* 0.719186*Sin(AoA) + -0.026799*Cos(AoA),0.0,a_dim};
Point(18) = {0.687303*Cos(AoA) + -0.030262*Sin(AoA),-1* 0.687303*Sin(AoA) + -0.030262*Cos(AoA),0.0,a_dim};
Point(19) = {0.654509*Cos(AoA) + -0.033729*Sin(AoA),-1* 0.654509*Sin(AoA) + -0.033729*Cos(AoA),0.0,a_dim};
Point(20) = {0.620961*Cos(AoA) + -0.037106*Sin(AoA),-1* 0.620961*Sin(AoA) + -0.037106*Cos(AoA),0.0,a_dim};
Point(21) = {0.586824*Cos(AoA) + -0.040303*Sin(AoA),-1* 0.586824*Sin(AoA) + -0.040303*Cos(AoA),0.0,a_dim};
Point(22) = {0.552264*Cos(AoA) + -0.043225*Sin(AoA),-1* 0.552264*Sin(AoA) + -0.043225*Cos(AoA),0.0,a_dim};
Point(23) = {0.51745*Cos(AoA) + -0.045787*Sin(AoA),-1* 0.51745*Sin(AoA) + -0.045787*Cos(AoA),0.0,a_dim};
Point(24) = {0.48255*Cos(AoA) + -0.047911*Sin(AoA),-1* 0.48255*Sin(AoA) + -0.047911*Cos(AoA),0.0,a_dim};
Point(25) = {0.447736*Cos(AoA) + -0.049525*Sin(AoA),-1* 0.447736*Sin(AoA) + -0.049525*Cos(AoA),0.0,a_dim};
Point(26) = {0.413176*Cos(AoA) + -0.050573*Sin(AoA),-1* 0.413176*Sin(AoA) + -0.050573*Cos(AoA),0.0,a_dim};
Point(27) = {0.379039*Cos(AoA) + -0.051035*Sin(AoA),-1* 0.379039*Sin(AoA) + -0.051035*Cos(AoA),0.0,a_dim};
Point(28) = {0.345492*Cos(AoA) + -0.051127*Sin(AoA),-1* 0.345492*Sin(AoA) + -0.051127*Cos(AoA),0.0,a_dim};
Point(29) = {0.312697*Cos(AoA) + -0.050918*Sin(AoA),-1* 0.312697*Sin(AoA) + -0.050918*Cos(AoA),0.0,a_dim};
Point(30) = {0.280814*Cos(AoA) + -0.05043*Sin(AoA),-1* 0.280814*Sin(AoA) + -0.05043*Cos(AoA),0.0,a_dim};
Point(31) = {0.25*Cos(AoA) + -0.049682*Sin(AoA),-1* 0.25*Sin(AoA) + -0.049682*Cos(AoA),0.0,a_dim};
Point(32) = {0.220404*Cos(AoA) + -0.04869*Sin(AoA),-1* 0.220404*Sin(AoA) + -0.04869*Cos(AoA),0.0,a_dim};
Point(33) = {0.192169*Cos(AoA) + -0.047459*Sin(AoA),-1* 0.192169*Sin(AoA) + -0.047459*Cos(AoA),0.0,a_dim};
Point(34) = {0.165435*Cos(AoA) + -0.045988*Sin(AoA),-1* 0.165435*Sin(AoA) + -0.045988*Cos(AoA),0.0,a_dim};
Point(35) = {0.14033*Cos(AoA) + -0.044267*Sin(AoA),-1* 0.14033*Sin(AoA) + -0.044267*Cos(AoA),0.0,a_dim};
Point(36) = {0.116978*Cos(AoA) + -0.042281*Sin(AoA),-1* 0.116978*Sin(AoA) + -0.042281*Cos(AoA),0.0,a_dim};
Point(37) = {0.095492*Cos(AoA) + -0.040003*Sin(AoA),-1* 0.095492*Sin(AoA) + -0.040003*Cos(AoA),0.0,a_dim};
Point(38) = {0.075976*Cos(AoA) + -0.037406*Sin(AoA),-1* 0.075976*Sin(AoA) + -0.037406*Cos(AoA),0.0,a_dim};
Point(39) = {0.058526*Cos(AoA) + -0.034452*Sin(AoA),-1* 0.058526*Sin(AoA) + -0.034452*Cos(AoA),0.0,a_dim};
Point(40) = {0.043227*Cos(AoA) + -0.031101*Sin(AoA),-1* 0.043227*Sin(AoA) + -0.031101*Cos(AoA),0.0,a_dim};
Point(41) = {0.030154*Cos(AoA) + -0.02731*Sin(AoA),-1* 0.030154*Sin(AoA) + -0.02731*Cos(AoA),0.0,a_dim};
Point(42) = {0.019369*Cos(AoA) + -0.023036*Sin(AoA),-1* 0.019369*Sin(AoA) + -0.023036*Cos(AoA),0.0,a_dim};
Point(43) = {0.010926*Cos(AoA) + -0.018228*Sin(AoA),-1* 0.010926*Sin(AoA) + -0.018228*Cos(AoA),0.0,a_dim};
Point(44) = {0.004866*Cos(AoA) + -0.012834*Sin(AoA),-1* 0.004866*Sin(AoA) + -0.012834*Cos(AoA),0.0,a_dim};
Point(45) = {0.001218*Cos(AoA) + -0.006793*Sin(AoA),-1* 0.001218*Sin(AoA) + -0.006793*Cos(AoA),0.0,a_dim};
Point(46) = {0.0*Cos(AoA) + 0.0*Sin(AoA),-1* 0.0*Sin(AoA) + 0.0*Cos(AoA),0.0,a_dim};
Point(47) = {0.001218*Cos(AoA) + 0.007293*Sin(AoA),-1* 0.001218*Sin(AoA) + 0.007293*Cos(AoA),0.0,a_dim};
Point(48) = {0.004866*Cos(AoA) + 0.014482*Sin(AoA),-1* 0.004866*Sin(AoA) + 0.014482*Cos(AoA),0.0,a_dim};
Point(49) = {0.010926*Cos(AoA) + 0.021468*Sin(AoA),-1* 0.010926*Sin(AoA) + 0.021468*Cos(AoA),0.0,a_dim};
Point(50) = {0.019369*Cos(AoA) + 0.0282*Sin(AoA),-1* 0.019369*Sin(AoA) + 0.0282*Cos(AoA),0.0,a_dim};
Point(51) = {0.030154*Cos(AoA) + 0.034646*Sin(AoA),-1* 0.030154*Sin(AoA) + 0.034646*Cos(AoA),0.0,a_dim};
Point(52) = {0.043227*Cos(AoA) + 0.040791*Sin(AoA),-1* 0.043227*Sin(AoA) + 0.040791*Cos(AoA),0.0,a_dim};
Point(53) = {0.058526*Cos(AoA) + 0.046622*Sin(AoA),-1* 0.058526*Sin(AoA) + 0.046622*Cos(AoA),0.0,a_dim};
Point(54) = {0.075976*Cos(AoA) + 0.052134*Sin(AoA),-1* 0.075976*Sin(AoA) + 0.052134*Cos(AoA),0.0,a_dim};
Point(55) = {0.095492*Cos(AoA) + 0.057323*Sin(AoA),-1* 0.095492*Sin(AoA) + 0.057323*Cos(AoA),0.0,a_dim};
Point(56) = {0.116978*Cos(AoA) + 0.062183*Sin(AoA),-1* 0.116978*Sin(AoA) + 0.062183*Cos(AoA),0.0,a_dim};
Point(57) = {0.14033*Cos(AoA) + 0.066711*Sin(AoA),-1* 0.14033*Sin(AoA) + 0.066711*Cos(AoA),0.0,a_dim};
Point(58) = {0.165435*Cos(AoA) + 0.070896*Sin(AoA),-1* 0.165435*Sin(AoA) + 0.070896*Cos(AoA),0.0,a_dim};
Point(59) = {0.192169*Cos(AoA) + 0.074723*Sin(AoA),-1* 0.192169*Sin(AoA) + 0.074723*Cos(AoA),0.0,a_dim};
Point(60) = {0.220404*Cos(AoA) + 0.078176*Sin(AoA),-1* 0.220404*Sin(AoA) + 0.078176*Cos(AoA),0.0,a_dim};
Point(61) = {0.25*Cos(AoA) + 0.081228*Sin(AoA),-1* 0.25*Sin(AoA) + 0.081228*Cos(AoA),0.0,a_dim};
Point(62) = {0.280814*Cos(AoA) + 0.083852*Sin(AoA),-1* 0.280814*Sin(AoA) + 0.083852*Cos(AoA),0.0,a_dim};
Point(63) = {0.312697*Cos(AoA) + 0.086012*Sin(AoA),-1* 0.312697*Sin(AoA) + 0.086012*Cos(AoA),0.0,a_dim};
Point(64) = {0.345492*Cos(AoA) + 0.087671*Sin(AoA),-1* 0.345492*Sin(AoA) + 0.087671*Cos(AoA),0.0,a_dim};
Point(65) = {0.379039*Cos(AoA) + 0.088787*Sin(AoA),-1* 0.379039*Sin(AoA) + 0.088787*Cos(AoA),0.0,a_dim};
Point(66) = {0.413176*Cos(AoA) + 0.089279*Sin(AoA),-1* 0.413176*Sin(AoA) + 0.089279*Cos(AoA),0.0,a_dim};
Point(67) = {0.447736*Cos(AoA) + 0.088919*Sin(AoA),-1* 0.447736*Sin(AoA) + 0.088919*Cos(AoA),0.0,a_dim};
Point(68) = {0.48255*Cos(AoA) + 0.087717*Sin(AoA),-1* 0.48255*Sin(AoA) + 0.087717*Cos(AoA),0.0,a_dim};
Point(69) = {0.51745*Cos(AoA) + 0.085721*Sin(AoA),-1* 0.51745*Sin(AoA) + 0.085721*Cos(AoA),0.0,a_dim};
Point(70) = {0.552264*Cos(AoA) + 0.082995*Sin(AoA),-1* 0.552264*Sin(AoA) + 0.082995*Cos(AoA),0.0,a_dim};
Point(71) = {0.586824*Cos(AoA) + 0.079611*Sin(AoA),-1* 0.586824*Sin(AoA) + 0.079611*Cos(AoA),0.0,a_dim};
Point(72) = {0.620961*Cos(AoA) + 0.075654*Sin(AoA),-1* 0.620961*Sin(AoA) + 0.075654*Cos(AoA),0.0,a_dim};
Point(73) = {0.654509*Cos(AoA) + 0.071211*Sin(AoA),-1* 0.654509*Sin(AoA) + 0.071211*Cos(AoA),0.0,a_dim};
Point(74) = {0.687303*Cos(AoA) + 0.066372*Sin(AoA),-1* 0.687303*Sin(AoA) + 0.066372*Cos(AoA),0.0,a_dim};
Point(75) = {0.719186*Cos(AoA) + 0.061223*Sin(AoA),-1* 0.719186*Sin(AoA) + 0.061223*Cos(AoA),0.0,a_dim};
Point(76) = {0.75*Cos(AoA) + 0.055843*Sin(AoA),-1* 0.75*Sin(AoA) + 0.055843*Cos(AoA),0.0,a_dim};
Point(77) = {0.779596*Cos(AoA) + 0.050298*Sin(AoA),-1* 0.779596*Sin(AoA) + 0.050298*Cos(AoA),0.0,a_dim};
Point(78) = {0.807831*Cos(AoA) + 0.044591*Sin(AoA),-1* 0.807831*Sin(AoA) + 0.044591*Cos(AoA),0.0,a_dim};
Point(79) = {0.834565*Cos(AoA) + 0.038782*Sin(AoA),-1* 0.834565*Sin(AoA) + 0.038782*Cos(AoA),0.0,a_dim};
Point(80) = {0.85967*Cos(AoA) + 0.033126*Sin(AoA),-1* 0.85967*Sin(AoA) + 0.033126*Cos(AoA),0.0,a_dim};
Point(81) = {0.883022*Cos(AoA) + 0.027766*Sin(AoA),-1* 0.883022*Sin(AoA) + 0.027766*Cos(AoA),0.0,a_dim};
Point(82) = {0.904509*Cos(AoA) + 0.022797*Sin(AoA),-1* 0.904509*Sin(AoA) + 0.022797*Cos(AoA),0.0,a_dim};
Point(83) = {0.924024*Cos(AoA) + 0.018288*Sin(AoA),-1* 0.924024*Sin(AoA) + 0.018288*Cos(AoA),0.0,a_dim};
Point(84) = {0.941474*Cos(AoA) + 0.014285*Sin(AoA),-1* 0.941474*Sin(AoA) + 0.014285*Cos(AoA),0.0,a_dim};
Point(85) = {0.956773*Cos(AoA) + 0.010817*Sin(AoA),-1* 0.956773*Sin(AoA) + 0.010817*Cos(AoA),0.0,a_dim};
Point(86) = {0.969846*Cos(AoA) + 0.007897*Sin(AoA),-1* 0.969846*Sin(AoA) + 0.007897*Cos(AoA),0.0,a_dim};
Point(87) = {0.980631*Cos(AoA) + 0.005527*Sin(AoA),-1* 0.980631*Sin(AoA) + 0.005527*Cos(AoA),0.0,a_dim};
Point(88) = {0.989074*Cos(AoA) + 0.003705*Sin(AoA),-1* 0.989074*Sin(AoA) + 0.003705*Cos(AoA),0.0,a_dim};
Point(89) = {0.995134*Cos(AoA) + 0.002417*Sin(AoA),-1* 0.995134*Sin(AoA) + 0.002417*Cos(AoA),0.0,a_dim};
Point(90) = {0.998782*Cos(AoA) + 0.001653*Sin(AoA),-1* 0.998782*Sin(AoA) + 0.001653*Cos(AoA),0.0,a_dim};
Point(91) = {1.0*Cos(AoA) + 0.0014*Sin(AoA),-1* 1.0*Sin(AoA) + 0.0014*Cos(AoA),0.0,a_dim};
Spline(1) = {54:91};
Spline(2) = {1:38};
Line(3) = {91, 1};
Spline(4) = {38:54};
Point(92) = {0, C, 0};
Point(93) = {0, -C, 0};
Point(94) = {L, C, 0};
Point(95) = {L, -C, 0};
Point(96) = {1, C, 0};
Point(97) = {1, -C, 0};
Point(98) = {L, -L* 1.0*Sin(AoA) + 0.0014*L*Cos(AoA), 0};
Point(99) = {L, -L* 1.0*Sin(AoA) + -0.0014*L*Cos(AoA), 0};
Point(100) = {0, 0, 0};
Circle(5) = {93, 100, 92};
Line(6) = {92, 96};
Line(7) = {93, 97};
Line(8) = {96, 94};
Line(9) = {96, 91};
Line(10) = {97, 1};
Line(11) = {97, 95};
Line(12) = {92, 54};
Line(13) = {93, 38};
Line(14) = {94, 98};
Line(15) = {98, 99};
Line(16) = {95, 99};
Line(17) = {99, 1};
Line(18) = {98, 91};
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
Physical Surface ("fluid", 1) = {1, 2, 3, 4, 5, 6}; 
Physical Curve ("airfoil", 2) = {1, 2, 4}; 
Physical Curve ("inlet", 3) = {5}; 
Physical Curve ("outlet", 4) = {14}; 
Physical Curve ("limits", 5) = {6, 7, 8, 11}; 
Physical Point ("airfoil", 6) = {54, 38, 91}; 
Physical Point ("limits", 7) = {92, 93, 96, 97, 94, 95}; 
Physical Point ("outlet", 8) = {98}; 
Physical Curve ("airfoil", 2) += {3}; 
Physical Curve ("outlet", 4) += {15, -16}; 
Physical Point ("airfoil", 6) += {1}; 
Physical Point ("outlet", 8) += {99}; 