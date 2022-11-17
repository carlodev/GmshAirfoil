

function addAirfoilPoints(airfoil_points_list)
    for i = 1:1:(length(airfoil_points_list[:, 1]))
        x = airfoil_points_list[i, 1]
        y = airfoil_points_list[i, 2]
        z = airfoil_points_list[i, 3]
        x_string = string(x) * "*Cos(AoA) + " * string(y) * "*Sin(AoA)"
        y_string = "-1* " * string(x) * "*Sin(AoA) + " * string(y) * "*Cos(AoA)"

        str_tmp = "Point($i) = {" * x_string * "," * y_string * "," * string(z) * ",a_dim};\n"
        nn = length(Points) + 1
        push!(Points, [nn, x, y, z])

        write(io, str_tmp)
    end
end

function addShearPoint(shear_coord)
    x = shear_coord[1, 1]
    y = shear_coord[1, 2]
    z = shear_coord[1, 3]
    x_string = "$L"
    y_string = "-1* " * string(x) * "*Sin(AoA) + " * string(y) * "*Cos(AoA)"
    nn = length(Points) + 1
    str_tmp = "Point($nn) = {" * x_string * "," * y_string * "," * string(z) * ",a_dim};\n"
    push!(Points, [nn, x, y, z])
    write(io, str_tmp)

end

#not used anymore
function findOrigin(Mat)

    leading_edge_idx = []
    atol = 1e-4
    while length(leading_edge_idx) != 1
        vv1 = findall(x -> isapprox(x, 0.0; atol=atol), Mat[:, 1])
        vv2 = findall(x -> isapprox(x, 0.0; atol=atol), Mat[:, 2])
        atol = atol * 2
        leading_edge_idx = vv1[findall(in(vv2), vv1)]
    end
    return leading_edge_idx
end


function is_clockwise(Mat)
    idx_1 = Int(floor(length(Mat[:, 1]) / 4))
    if (Mat[idx_1, 1] - Mat[idx_1+1, 1]) < 0
        clockwise = true
    else
        clockwise = false
    end

    return clockwise


end

function findTE(c)
    atol = 1e-4
    Points
    x_tmp = Any[]
    for i = 1:1:length(Points)
        push!(x_tmp, Points[:][i][2])
    end


    vv1 = findall(x -> isapprox(x, c; atol=atol), x_tmp)


    return vv1
end

function findLE(d, atol)

    x_tmp = Any[]
    y_tmp = Any[]

    for i = 1:1:length(Points)
        push!(x_tmp, Points[:][i][2])
        push!(y_tmp, Points[:][i][3])

    end



    vv1 = findall(x -> isapprox(x, d; atol=atol), x_tmp)

    if length(vv1) < 2
        vv1 = findLE(d, atol * 2)
    end

    if length(vv1) > 2
        vv1 = findLE(d, atol / 3)

    end

    vv1
end


function addPoint(x, y, z)
    nn = length(Points) + 1
    str_tmp = "Point($nn) = {$x, $y, $z};\n"
    write(io, str_tmp)

    push!(Points, [nn, x, y, z])
end


function addLine(a1, a2)
    nn = length(Lines) + 1
    str_tmp = "Line($nn) = {$a1, $a2};\n"
    write(io, str_tmp)

    push!(Lines, [nn, a1, a2])
end

function addSpline(a)
    nn = length(Lines) + 1
    str_tmp = "Spline($nn) = {$a};\n"
    write(io, str_tmp)
    push!(Lines, [nn, a[1], a[end]])
end

function addCirc(a1, a2, a3)

    nn = length(Lines) + 1
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

    loop[end] > 0 ? ctrl_sing = 2 : ctrl_sing = 1
    count = 2

    while count <= length(a)

        loop[end] > 0 ? ctrl_sing = 2 : ctrl_sing = 1

        point_1 = getLinesNodes(abs(loop[end]))[ctrl_sing]

        if count < length(a)
            point_2 = a[count+1]
        else
            point_2 = a[1]
        end


        push!(loop, LinefromPoints(point_1, point_2))
        count = count + 1
    end

    return loop
end



function LinefromPoints(p1, p2)
    p = [p1, p2]
    line_found = false
    line = 0
    while !line_found && line < length(Lines)
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
    nn = length(Loops) + 1

    str_tmp = "Curve Loop($nn) = {$(a[1]),$(a[2]),$(a[3]),$(a[4]) };\n"
    write(io, str_tmp)
    push!(Loops, [nn, a])


end

function addPlaneSurface(a)
    nn = length(Surfaces) + 1

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

function RecombineSurfaces(surf, recombine)
    if recombine
    str_surf = "$(surf[1])"

    for i = 2:1:length(surf)
        str_surf = str_surf * ", $(surf[i])"



    end
    str_tmp = "Recombine Surface {$str_surf}; \n"
    write(io, str_tmp)

    end

end



function addPhysicalGroup(name::String, entities::Vector, type::String; add=false)

    if type != "Point" && type != "Curve" && type != "Surface"
        error("Type of Physical Group not recognized, available:Point, Curve, Surface")
    end

    str_ent = "$(entities[1])"
    for i = 2:1:length(entities)
        str_ent = str_ent * ", $(entities[i])"
    end

    if add == false
        nn = size(PhysicalGroups, 1) + 1
        str_tmp = "Physical $type (\"$name\", $nn) = {$str_ent}; \n"
        push!(PhysicalGroups, [nn, name, entities, type])

    else
        f_name = filter(:name => ==(name) , PhysicalGroups)
        f_type = filter(:type => ==(type) , f_name)
        nn = f_type.number[1]
        str_tmp = "Physical $type (\"$name\", $nn) += {$str_ent}; \n"
        append!(PhysicalGroups.entities[nn], entities)

    end
    #println(str_tmp)
    write(io, str_tmp)

end



function formatting_airfoil_points(airfoil_points_list, trailing_edge_point, c)
    if airfoil_points_list[1, 1] != c
        error("the file should start from the trailing edge")
    end


    #leading_edge_idx = findOrigin(airfoil_points_list)
    clockwise = is_clockwise(airfoil_points_list)


    atol = 1e-6
    while isempty(trailing_edge_point)
        trailing_edge_point = findall(x -> isapprox(x, c; atol=atol), airfoil_points_list[:, 1])
        atol = atol * 2
    end

    if length(trailing_edge_point) == 1
        sharp_end = true
        println("sharp edge")
    elseif length(trailing_edge_point) == 2
        sharp_end = false
        println("non-shap edge")
    else
        error("Impossible to determine the trailing edge, please specify")
    end


    if !clockwise
        println("anti-clockwise")
        n_points = length(airfoil_points_list[:, 1])
        println("n points = $n_points")
        if sharp_end
            airfoil_points_list = vcat(airfoil_points_list[1, :]', airfoil_points_list[end:-1:2, :])
            trailing_edge_point = 1
            corr = 1
        else
            airfoil_points_list = airfoil_points_list[end:-1:1, :]
            corr = 0
            trailing_edge_point = n_points .+ 1 .- trailing_edge_point
        end
    end

    airfoil_points_list, sharp_end, trailing_edge_point
end


