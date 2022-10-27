function create_geofile(filename; leading_edge_points = [], trailing_edge_point =[], chord=1, dimesion=2)


"provide a continuous set of points"
if dimesion !=2
    error("Only dimension = 2 supported at the moment")
end

d = 0.07*chord #for an automatic choice 









name = filename[1:end-4]

global io 
global Points = Any[]
global Lines = Any[]
global Surfaces = Any[]
global Loops = Any[]



global PhysicalGroups = DataFrame(number = Int64[], name=String[], entities=Vector[], type=String[])






io = open("$(name)_$(dimesion)D.geo", "w")
write(io, "SetFactory(\"OpenCASCADE\");\n")

write(io, "N_inlet = DefineNumber[ 20, Name \"Parameters/N_inlet\" ];\n")
write(io, "N_vertical = DefineNumber[ 40, Name \"Parameters/N_vertical\" ];\n")
write(io, "P_vertical = DefineNumber[ 1.15, Name \"Parameters/P_vertical\" ];\n")

write(io, "N_airfoil = DefineNumber[ 50, Name \"Parameters/N_airfoil\" ];\n")

write(io, "N_shear = DefineNumber[ 20, Name \"Parameters/N_shear\" ];\n")
write(io, "P_shear = DefineNumber[ 1.2, Name \"Parameters/P_shear\" ];\n")
write(io, "L = DefineNumber[ 6, Name \"Parameters/L\" ];\n")
write(io, "C = DefineNumber[ 6, Name \"Parameters/C\" ];\n")


write(io, "AoA_deg = DefineNumber[ 0, Name \"Parameters/AoA\" ];\n")
write(io, "AoA = AoA_deg*3.14/180;\n")
write(io, "a_dim = 0.2;\n")



airfoil_points_list = CSV.File(filename, header=true) |> Tables.matrix

#PreProcessing airfoil_points_list
airfoil_points_list, sharp_end, trailing_edge_point=formatting_airfoil_points(airfoil_points_list, trailing_edge_point, chord)
println("shaprend=$sharp_end, trailing_edge_points=$trailing_edge_point")



addAirfoilPoints(airfoil_points_list)

if isempty(trailing_edge_point) #smart choice of trailing edge if is not specified
    trailing_edge_point = findTE(chord)
    if length(trailing_edge_point)==1
        sharp_end = true
        println("sharp edge")
    elseif length(trailing_edge_point)==2
        sharp_end = false
        println("non-shap edge")
    else
        error("Impssible to determine the trailing edge, plase specify")
    end
end




"Smart choice of trailing edge if is not specified"
if isempty(trailing_edge_point) 
    trailing_edge_point = findTE(chord)
end

"Automatically detect the leading edge points"
if isempty(leading_edge_points)
    atol = 1e-3
    leading_edge_points = findLE(d, atol)
end


"Re-sort leading edge points, where the vertical line starts"
if Points[leading_edge_points[1]][3] < Points[leading_edge_points[2]][3]
tmp = leading_edge_points[1]
leading_edge_points[1]= leading_edge_points[2]
leading_edge_points[2]= tmp
end


println("leading edge points =$leading_edge_points")
println("trailing edge points =$trailing_edge_point")

if length(trailing_edge_point) > 1
    sharp_end = false
    idx_sharp = 2
    println("no sharp edge")
else
    sharp_end = true
    idx_sharp = 1
    println("sharp edge")
end




if trailing_edge_point[1]<leading_edge_points[1]
    if sharp_end
        nn = length(Lines) + 1
        str_tmp = "Spline($nn) = {$(leading_edge_points[1] ): $(length(Points)), $(trailing_edge_point[1])};\n"
        write(io, str_tmp)
        push!(Lines, [nn, leading_edge_points[1], trailing_edge_point[1]])
        spline_airfoil_top = nn#top
    else
        spline_airfoil_top = addSpline(trailing_edge_point[1]:leading_edge_points[1])[end][1]#top
    end
    
else
    spline_airfoil_top = addSpline(leading_edge_points[1]:trailing_edge_point[1])[end][1]#top

end


if leading_edge_points[2]< trailing_edge_point[idx_sharp]
    spline_airfoil_bottom = addSpline(leading_edge_points[2]:trailing_edge_point[idx_sharp])[end][1] #bottom
else
    spline_airfoil_bottom = addSpline(trailing_edge_point[idx_sharp]:leading_edge_points[2])[end][1] #bottom
end


if !sharp_end
    line_airfoil_te = addLine(trailing_edge_point[1], trailing_edge_point[2])[end][1] #trailing edge
end



if leading_edge_points[1]<leading_edge_points[2]
    spline_airfoil_le = addSpline(leading_edge_points[1]:leading_edge_points[2])[end][1] #leading edge
else
    spline_airfoil_le = addSpline(leading_edge_points[2]: leading_edge_points[1])[end][1] #leading edge

end


#External Domain points
point1 = addPoint(0, "C", 0)[end][1]
point2 = addPoint(0, "-C", 0)[end][1]

point5 = addPoint("L", "C", 0)[end][1]
point6 = addPoint("L", "-C", 0)[end][1]

point3 = addPoint(chord, "C", 0)[end][1]
point4 = addPoint(chord, "-C", 0)[end][1]

#Trailing edge point at the rear part
#This allows the shear to rotate as the AoA impose it
x_tmp, y_tmp = Points[trailing_edge_point[1]][2:3]
point7 = addPoint("L", "-L* " * string(x_tmp) * "*Sin(AoA) + " * string(y_tmp) * "*L*Cos(AoA)" ,0)[end][1]




if !sharp_end
    x_tmp, y_tmp = Points[trailing_edge_point[2]][2:3]
    point8 = addPoint("L", "-L* " * string(x_tmp) * "*Sin(AoA) + " * string(y_tmp) * "*L*Cos(AoA)" ,0)[end][1]
end


    println("new origin point")
    origin_idx = addPoint(0, 0, 0)[end][1]


circ = addCirc(point2, origin_idx, point1)[end][1]

l1 = addLine(point1, point3)
l2 = addLine(point2, point4)
l3 = addLine(point3, point5)
l3t = addLine(point3, trailing_edge_point[1])
l2t = addLine(point4, trailing_edge_point[idx_sharp])


l4 = addLine(point4, point6)
l1l = addLine(point1, leading_edge_points[1])
l2l = addLine(point2, leading_edge_points[2])

l5 = addLine(point5, point7)
if sharp_end
    l7 = addLine(point7, point6)
else
    l7 = addLine(point7, point8)
    l6 = addLine(point6, point8)
    l8t = addLine(point8, trailing_edge_point[2])

end
l7t = addLine(point7, trailing_edge_point[1])


loop1 = LoopfromPoints([point1, leading_edge_points[1], leading_edge_points[2], point2])
loop2 =LoopfromPoints([point1, point3, trailing_edge_point[1], leading_edge_points[1]])
loop3 =LoopfromPoints([point2, point4, trailing_edge_point[idx_sharp], leading_edge_points[2]])
loop4 =LoopfromPoints([point3, point5, point7, trailing_edge_point[1]])
if sharp_end
    loop5 =LoopfromPoints([point4, point6, point7, trailing_edge_point[idx_sharp]])
else
    loop5 =LoopfromPoints([point4, point6, point8, trailing_edge_point[idx_sharp]])

end
loop1 =  addLoop(loop1)[end][1]
loop2 = addLoop(loop2)[end][1]
loop3 = addLoop(loop3)[end][1]
loop4 = addLoop(loop4)[end][1]
loop5 = addLoop(loop5)[end][1]



addPlaneSurface(loop1)
addPlaneSurface(loop2)
addPlaneSurface(loop3)
addPlaneSurface(loop4)
addPlaneSurface(loop5)


if !sharp_end
    loop6 =LoopfromPoints([point7, point8, trailing_edge_point[2], trailing_edge_point[1]])
    loop6 =  addLoop(loop6)[end][1]
    addPlaneSurface(loop6)
end


leading_edge_lines = [LinefromPoints(point1, point2), LinefromPoints(leading_edge_points[1], leading_edge_points[2])]
TransfiniteCurve(leading_edge_lines, "N_inlet", 1.)

if sharp_end
    internal_lines = -1 .*[LinefromPoints(point1, leading_edge_points[1]),
    LinefromPoints(point3, trailing_edge_point[1]),
    LinefromPoints(point5, point7),
    LinefromPoints(point6, point7),
    -1 .*LinefromPoints(trailing_edge_point[idx_sharp], point4),
    LinefromPoints(point2, leading_edge_points[2])]
else
    internal_lines = -1 .*[LinefromPoints(point1, leading_edge_points[1]),
    LinefromPoints(point3, trailing_edge_point[1]),
    LinefromPoints(point5, point7),
    LinefromPoints(point6, point8),
    -1 .*LinefromPoints(trailing_edge_point[2], point4),
    LinefromPoints(point2, leading_edge_points[2])]
end





TransfiniteCurve(internal_lines, "N_vertical", "P_vertical")


airfoil_lines = [LinefromPoints(point1, point3),
    LinefromPoints(trailing_edge_point[1], leading_edge_points[1]),
    LinefromPoints(trailing_edge_point[idx_sharp], leading_edge_points[2]),
    LinefromPoints(point2, point4)]
TransfiniteCurve(airfoil_lines, "N_airfoil", 1.)

if sharp_end
shear_lines = [LinefromPoints(point3, point5),
LinefromPoints(trailing_edge_point[1], point7),
    LinefromPoints(point4, point6)]
else
shear_lines = [LinefromPoints(point3, point5),
LinefromPoints(trailing_edge_point[1], point7),
    LinefromPoints(trailing_edge_point[2], point8),
     LinefromPoints(point4, point6)]

trailing_edge_lines = [LinefromPoints(trailing_edge_point[1], trailing_edge_point[2]), LinefromPoints(point7, point8)]
TransfiniteCurve(trailing_edge_lines, 4, 1.)
end

TransfiniteCurve(shear_lines, "N_shear", "P_shear")

#Add Physical Groups

if !sharp_end
    TransfiniteSurfaces([1,2,3,4,5,6])
    RecombineSurfaces([1,2,3,4,5,6])
    addPhysicalGroup("fluid", [1,2,3,4,5,6],"Surface")

else
    TransfiniteSurfaces([1,2,3,4,5])
    RecombineSurfaces([1,2,3,4,5])
    addPhysicalGroup("fluid", [1,2,3,4,5],"Surface")
end


#Add Physical Curve
addPhysicalGroup("airfoil", [spline_airfoil_top, spline_airfoil_bottom, spline_airfoil_le], "Curve")


addPhysicalGroup("inlet", [circ], "Curve")

addPhysicalGroup("outlet", [LinefromPoints(point5, point7)], "Curve")

addPhysicalGroup("limits", [LinefromPoints(point1, point3), LinefromPoints(point2, point4), LinefromPoints(point3, point5), LinefromPoints(point4, point6)], "Curve")


addPhysicalGroup("airfoil", [leading_edge_points[1], leading_edge_points[2], trailing_edge_point[1]], "Point")

addPhysicalGroup("limits", [point1, point2, point3, point4, point5, point6], "Point")

addPhysicalGroup("outlet", [point7], "Point")


if !sharp_end
    addPhysicalGroup("airfoil", [line_airfoil_te], "Curve"; add = true)
    addPhysicalGroup("outlet", [LinefromPoints(point7, point8), LinefromPoints(point8, point6)], "Curve"; add = true)

    addPhysicalGroup("airfoil", [trailing_edge_point[2]], "Point"; add = true)
    addPhysicalGroup("outlet", [point8], "Point"; add = true)    
else
    addPhysicalGroup("outlet", [LinefromPoints(point7, point6)], "Curve"; add = true)

end


close(io)

end