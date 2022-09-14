using FileIO, CSV, DataFrames, XLSX
include("Airfoil_Utils.jl")

filename = "NACA4412.csv"
AoA_deg = 2
C = 6
L = 6
c = 1 #chord lenght
leading_edge_points = [14, 22] #top and bottom points, to identify the leading leading_edge_points
trailing_edge_point = [1, 35] #if 2 points, a line between them will be created. If 1, sharp leading edge



AoA = AoA_deg * 3.14 / 180

lc = 1


io = open("t1.geo", "w")
write(io, "SetFactory(\"OpenCASCADE\");\n")

write(io, "a_dim = DefineNumber[ 0.2, Name \"Parameters/a_dim\" ];\n")

write(io, "AoA_deg = DefineNumber[ 0, Name \"Parameters/AoA\" ];\n")
write(io, "AoA = AoA_deg*3.14/180;\n")

AoA_r = AoA*3.14/180;

if length(trailing_edge_point) > 1
    sharp_end = false
else
    sharp_end = true
end

airfoil_points_list = CSV.File(filename, header=true) |> Tables.matrix

for i = 1:1:length(airfoil_points_list[:,1])

    x = string(airfoil_points_list[i,1])
    y = string(airfoil_points_list[i,2])
    z = string(airfoil_points_list[i,3])
    x_string = x * "*Cos(AoA) + "* y * "*Sin(AoA)"
    y_string = "-1* " * x * "*Sin(AoA) + "* y * "*Cos(AoA)"
    
    str_tmp = "Point($i) = {" * x_string*","* y_string *","* z * ",a_dim};\n"
    nn = length(Points)+1
    push!(Points, [nn, x, y, z])

    write(io, str_tmp)
end

spline_airfoil_top = addSpline(1:14)[end][1]#top
spline_airfoil_bottom = addSpline(22:35)[end][1] #bottom
line_airfoil_te = addLine(1, 35)[end][1] #trailing edge
spline_airfoil_le = addSpline(14:22)[end][1] #leading edge


#External Domain points
point1 = addPoint(0, C, 0)[end][1]
point2 = addPoint(0, -C, 0)[end][1]

point5 = addPoint(L, C, 0)[end][1]
point6 = addPoint(L, -C, 0)[end][1]

point3 = addPoint(c, C, 0)[end][1]
point4 = addPoint(c, -C, 0)[end][1]

#Trailing edge point at the rear part
x_c, y_c, z_c = get_coordinate(trailing_edge_point[1])
point7 = addPoint(L, y_c, 0)[end][1]
if !sharp_end
    x_c, y_c, z_c = get_coordinate(trailing_edge_point[2])
    point8 = addPoint(L, y_c, 0)[end][1]
end



circ = addCirc(point2, 18, point1)[end][1]

l1 = addLine(point1, point3)
l2 = addLine(point2, point4)
l3 = addLine(point3, point5)
l3t = addLine(point3, trailing_edge_point[1])
l2t = addLine(point4, trailing_edge_point[2])


l4 = addLine(point4, point6)
l1l = addLine(point1, leading_edge_points[1])
l2l = addLine(point2, leading_edge_points[2])

l5 = addLine(point5, point7)
if sharp_end
    l7 = addLine(point7, point6)
else
    l7 = addLine(point7, point8)
    l6 = addLine(point6, point8)
end
l7t = addLine(point7, trailing_edge_point[1])
l8t = addLine(point8, trailing_edge_point[2])


loop1 = LoopfromPoints([point1, leading_edge_points[1], leading_edge_points[2], point2])
loop2 =LoopfromPoints([point1, point3, trailing_edge_point[1], leading_edge_points[1]])
loop3 =LoopfromPoints([point2, point4, trailing_edge_point[2], leading_edge_points[2]])
loop4 =LoopfromPoints([point3, point5, point7, trailing_edge_point[1]])
loop5 =LoopfromPoints([point4, point6, point8, trailing_edge_point[2]])
loop6 =LoopfromPoints([point7, point8, trailing_edge_point[2], trailing_edge_point[1]])

loop1 =  addLoop(loop1)[end][1]
loop2 = addLoop(loop2)[end][1]
loop3 = addLoop(loop3)[end][1]
loop4 = addLoop(loop4)[end][1]
loop5 = addLoop(loop5)[end][1]
loop6 =  addLoop(loop6)[end][1]



addPlaneSurface(loop1)
addPlaneSurface(loop2)
addPlaneSurface(loop3)
addPlaneSurface(loop4)
addPlaneSurface(loop5)
addPlaneSurface(loop6)

leading_edge_lines = [LinefromPoints(point1, point2), LinefromPoints(leading_edge_points[1], leading_edge_points[2])]
TransfiniteCurve(leading_edge_lines, 10, 1.)

internal_lines = -1 .*[LinefromPoints(point1, leading_edge_points[1]),
    LinefromPoints(point3, trailing_edge_point[1]),
    LinefromPoints(point5, point7),
    LinefromPoints(point6, point8),
    -1 .*LinefromPoints(trailing_edge_point[2], point4),
    LinefromPoints(point2, leading_edge_points[2])]

TransfiniteCurve(internal_lines, 41, 1.2)


airfoil_lines = [LinefromPoints(point1, point3),
    LinefromPoints(trailing_edge_point[1], leading_edge_points[1]),
    LinefromPoints(trailing_edge_point[2], leading_edge_points[2]),
    LinefromPoints(point2, point4)]
TransfiniteCurve(airfoil_lines, 51, 1.)


shear_lines = [LinefromPoints(point3, point5),
LinefromPoints(trailing_edge_point[1], point7),
    LinefromPoints(trailing_edge_point[2], point8),
     LinefromPoints(point4, point6)]


TransfiniteCurve(shear_lines, 21, 1.15)
trailing_edge_lines = [LinefromPoints(trailing_edge_point[1], trailing_edge_point[2]), LinefromPoints(point7, point8)]
TransfiniteCurve(trailing_edge_lines, 3, 1.)

TransfiniteSurfaces([1,2,3,4,5,6])
RecombineSurfaces([1,2,3,4,5,6])

addPhysicalSuface("fluid", [1,2,3,4,5,6])
close(io)

