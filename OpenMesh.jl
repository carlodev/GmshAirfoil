using Gridap
using Gridap.Algebra
using Gridap.Geometry
using Gridap.Fields
using Gridap.CellData
using Gridap.Arrays
using Gridap.ReferenceFEs
using Gridap.Fields: meas

using GridapGmsh
using GridapDistributed
using GridapDistributed.CellData

model = GmshDiscreteModel("NACA4412_2D.msh")
writevtk(model, "NACA4412")



d = 0.1 #diameter
L_back = 2
L_front = 0.2
H = 0.41


function create_tag!(model::GridapDistributed.DistributedDiscreteModel)
    map_parts(model.models) do model
        create_center_tag!(model)
    end

end

function create_tag!(model::Gridap.Geometry.UnstructuredDiscreteModel, tag_params)
    labels = get_face_labeling(model)
    println(labels)
    model_nodes = DiscreteModel(Polytope{0}, model)
    cell_nodes_coords = get_cell_coordinates(model_nodes)
    cell_node_centre = collect1d(lazy_map(tag_params[:fun], cell_nodes_coords))
    cell_node = findall(cell_node_centre)
    new_entity = num_entities(labels) + 1
    println(new_entity)
    for centre_point in cell_node
        labels.d_to_dface_to_entity[1][centre_point] = new_entity
    end
    add_tag!(labels, tag_params[:label], [new_entity])
end

function add_3d_cylinder_tag(model) #creating the "center" tag at the tag_coordinate (Point); if mesh extremely the tolrances have to be smaller (unlikely)

    v1(v) = v[1]
    v2(v) = v[2]
    v3(v) = v[3]


    function is_cylinder(x::Vector{VectorValue{3,Float64}})
        distance = v1.(x) .^2 + v2.(x) .^2
        isapprox(distance[1], (d/2)^2)        
    end

    function is_inlet(x::Vector{VectorValue{3,Float64}})
        isapprox(v1.(x)[1], -L_front)        
    end

    function is_outlet(x::Vector{VectorValue{3,Float64}})
        isapprox(v1.(x)[1], L_back)        
    end

    function is_wall(x::Vector{VectorValue{3,Float64}})
        isapprox(norm(v2.(x)), H)        
    end
    create_tag!(model, Dict(:fun => is_wall, :label => "Wall"))

    create_tag!(model, Dict(:fun => is_inlet, :label => "Inlet"))
    create_tag!(model, Dict(:fun => is_outlet, :label => "Outlet"))

    create_tag!(model, Dict(:fun => is_cylinder, :label => "Cylinder"))

    return model
end

model = add_3d_cylinder_tag(model)


writevtk(model, "Cylinder3d")
