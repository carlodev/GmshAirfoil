Points = Any[]
Lines = Any[]
Surfaces = Any[]
Loops = Any[]

PhysicalCurve = Any[]
PhysicalSurface = Any[]
function get_coordinate(p)
    x = airfoil_points_list[p, 1]
    y = airfoil_points_list[p, 2]
    z = airfoil_points_list[p, 3]
    x_c = x * cos(AoA) + y * sin(AoA)
    y_c = -1 * x * sin(AoA) + y * cos(AoA)
    z_c = z
    return x_c, y_c, z_c
end
function addPoint(x, y, z)
    nn = length(Points) +1
    str_tmp = "Point($nn) = {$x, $y, $z};\n"
    write(io, str_tmp)

    push!(Points, [nn, x, y, z])
end


function addLine(a1, a2)
    nn = length(Lines) +1
    str_tmp = "Line($nn) = {$a1, $a2};\n"
    write(io, str_tmp)

    push!(Lines, [nn, a1, a2])
end

function addSpline(a)
    nn = length(Lines) +1
    str_tmp = "Spline($nn) = {$a};\n"
    write(io, str_tmp)    
    push!(Lines, [nn, a[1], a[end]])
end

function addCirc(a1, a2, a3)

    nn = length(Lines) +1
    str_tmp = "Circle($nn) = {$a1, $a2, $a3};\n"
    write(io, str_tmp)  
    push!(Lines, [nn, a1, a3])
end

function getLinesNodes(i)
return (Lines[i][2], Lines[i][3])

end


function LoopfromPoints(a)
    lines_id = Any[]
    
    push!(lines_id, LinefromPoints(a[1], a[2]))
    loop = Any[]
    push!(loop, lines_id[1])
    #the second node
    
    loop[end] > 0 ? ctrl_sing = 2  : ctrl_sing = 1
    count = 2

    while count <= length(a)

        loop[end] > 0 ? ctrl_sing = 2  : ctrl_sing = 1

        point_1 = getLinesNodes(abs(loop[end]))[ctrl_sing]
        
        if count < length(a)
            point_2 = a[count+1]
        else
            point_2 = a[1]
        end

        
        push!(loop, LinefromPoints(point_1, point_2))
        count = count+1
    end

    return loop
end



function LinefromPoints(p1, p2)
    p = [p1,p2]
    line_found = false
    line = 0
    while !line_found && line<length(Lines)
        line = line + 1
        line_nodes = getLinesNodes(line)
        line_nodes = [line_nodes[1], line_nodes[2]]
        sorted_line_nodes = sort(line_nodes)
        if sorted_line_nodes == sort(p)
            line_found = true
            if p[1] == line_nodes[2]
                line = -line
            end
        end

    end

    if line_found
        return line
    else
        return "Line not found"
    end
end


function addLoop(a)
    nn = length(Loops) +1

    str_tmp = "Curve Loop($nn) = {$(a[1]),$(a[2]),$(a[3]),$(a[4]) };\n"
    write(io, str_tmp) 
    push!(Loops, [nn, a])

    
end

function addPlaneSurface(a)
    nn = length(Surfaces) +1

    str_tmp = "Plane Surface($nn) = {$a};\n"
    write(io, str_tmp) 
    push!(Surfaces, [nn, a])
    
end

function TransfiniteCurve(curves, nodes, progression)
    str_curves = "$(curves[1])"
    for i = 2:1:length(curves)
        str_curves = str_curves * ", $(curves[i])"
        
    end
    str_tmp = "Transfinite Curve {$str_curves} = $nodes Using Progression $progression; \n"
    write(io, str_tmp) 

end

function TransfiniteSurfaces(surf)
  
    for i = 1:1:length(surf)
        str_tmp = "Transfinite Surface {$(surf[i])};\n"
        write(io, str_tmp) 

        
    end
  

end

function RecombineSurfaces(surf)
    str_surf = "$(surf[1])"

    for i = 2:1:length(surf)
        str_surf = str_surf * ", $(surf[i])"


        
    end
    str_tmp = "Recombine Surface {$str_surf}; \n"
    write(io, str_tmp) 



end

function addPhysicalSuface(name, surf)
    nn = length(PhysicalSurface)+1
    str_surf = "$(surf[1])"

    for i = 2:1:length(surf)
        str_surf = str_surf * ", $(surf[i])"
    end
    str_tmp = "Physical Surface(\"$name\", $nn) = {$str_surf};"
    write(io, str_tmp) 
    push!(PhysicalSurface, [nn, surf])

end
