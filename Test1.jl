using Pkg
Pkg.activate(".")
using Plots
using Gridap, GridapGmsh
using CSV, DataFrames, XLSX
using Gmsh: gmsh
gmsh.initialize()

include("T1.jl")

filename = "NACA4412.csv"
AoA_deg = 2
C = 6
L = 6
c = 1 #chord lenght
leading_edge_points = [14, 22] #top and bottom points, to identify the leading leading_edge_points
trailing_edge_point = [1, 35] #if 2 points, a line between them will be created. If 1, sharp leading edge

lc = 1e-6

AoA = AoA_deg * 3.14 / 180


function get_coordinate(p)
    x = airfoil_points_list[p, 1]
    y = airfoil_points_list[p, 2]
    z = airfoil_points_list[p, 3]
    x_c = x * cos(AoA) + y * sin(AoA)
    y_c = -1 * x * sin(AoA) + y * cos(AoA)
    z_c = z
    return x_c, y_c, z_c
end

if length(trailing_edge_point) > 1
    sharp_end = false
else
    sharp_end = true
end

lc = 0.1
airfoil_points_list = CSV.File(filename, header=true) |> Tables.matrix

airfoil_points = Any[]
for i = 1:1:length(airfoil_points_list[:, 1])
    x_c, y_c, z_c = get_coordinate(i)
    addPoint(x_c, y_c, z_c)
end




#Airfoil lines definition
spline_airfoil_top = addSpline(1:14) #top
spline_airfoil_bottom = addSpline(22:35) #bottom
line_airfoil_te = addLine(1, 35) #trailing edge
spline_airfoil_le = addSpline(14:22) #leading edge

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
gmsh.model.geo.synchronize()


#Add Line exterior Domain
circ = addCirc(point1, 18, point2)[end][1]

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
loop2 = LoopfromPoints([point1, point3, trailing_edge_point[1], leading_edge_points[1]])
loop3 = LoopfromPoints([point2, point4, trailing_edge_point[2], leading_edge_points[2]])
loop4 = LoopfromPoints([point3, point5, point7, trailing_edge_point[1]])
loop5 = LoopfromPoints([point4, point6, point8, trailing_edge_point[2]])
loop6 = LoopfromPoints([point7, point8, trailing_edge_point[2], trailing_edge_point[1]])
gmsh.model.geo.addCurveLoop(loop1, 1)
gmsh.model.geo.addCurveLoop(loop2, 2)
gmsh.model.geo.addCurveLoop(loop3, 3)
gmsh.model.geo.addCurveLoop(loop4, 4)
gmsh.model.geo.addCurveLoop(loop5, 5)
gmsh.model.geo.addCurveLoop(loop6, 6)

gmsh.model.geo.synchronize()

gmsh.model.geo.addPlaneSurface([1], 1)
gmsh.model.geo.addPlaneSurface([2], 2)
gmsh.model.geo.addPlaneSurface([3], 3)
gmsh.model.geo.addPlaneSurface([4], 4)
gmsh.model.geo.addPlaneSurface([5], 5)
gmsh.model.geo.addPlaneSurface([6], 6)



gmsh.model.geo.synchronize()
leading_edge_lines = [LinefromPoints(point1, point2), LinefromPoints(leading_edge_points[1], leading_edge_points[2])]
TransfiniteCurve(leading_edge_lines, 10, 1.)

internal_lines = [LinefromPoints(point1, leading_edge_points[1]),
    LinefromPoints(point3, trailing_edge_point[1]),
    LinefromPoints(point5, point7),
    LinefromPoints(point6, point8),
    LinefromPoints(trailing_edge_point[2], point4),
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



gmsh.model.mesh.setTransfiniteSurface(1)
gmsh.model.mesh.setTransfiniteSurface(2)
gmsh.model.mesh.setTransfiniteSurface(3)
gmsh.model.mesh.setTransfiniteSurface(4)
gmsh.model.mesh.setTransfiniteSurface(5)
gmsh.model.mesh.setTransfiniteSurface(6)

gmsh.model.geo.synchronize()
gmsh.model.mesh.setRecombine(2, 1)
gmsh.model.mesh.setRecombine(2, 2)
gmsh.model.mesh.setRecombine(2, 3)
gmsh.model.mesh.setRecombine(2, 4)
gmsh.model.mesh.setRecombine(2, 5)
gmsh.model.mesh.setRecombine(2, 6)

gmsh.model.geo.synchronize()



gmsh.model.addPhysicalGroup(2, [1, 2, 3, 4, 5, 6], 1)
gmsh.model.setPhysicalName(2, 1, "fluid")

airfoil = [LinefromPoints(trailing_edge_point[1], leading_edge_points[1]), 
LinefromPoints(trailing_edge_point[2], leading_edge_points[2]),
LinefromPoints(trailing_edge_point[1], trailing_edge_point[2]), 
LinefromPoints(leading_edge_points[2], leading_edge_points[1])]

gmsh.model.addPhysicalGroup(1, airfoil, 2)
gmsh.model.setPhysicalName(1, 2, "airfoil")








gmsh.model.geo.synchronize()

gmsh.model.mesh.generate(2)
gmsh.model.geo.synchronize()
gmsh.model.mesh.recombine()

gmsh.write("t1.msh")


gmsh.finalize()


#Read with GridapGmsh
model = GmshDiscreteModel("t1.msh")
writevtk(model, "t1")