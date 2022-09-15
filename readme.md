# Airfoil Gmsh

The package is thought to automatize and optimize some procedure for creating structured airfoil meshes using Gmsh.
The user modifies and then execute the Geo_create.jl file.
The user provides the .csv file, the length of the chord.
The user can specify the trailing edge node(s) and where to start for the leading-edge meshing.
Dimensions and meshing parameters are provided by defualt. The geometry dimensions of the domain and the meshing parameters (number of nodes, and progression) are parameters that can be changed in Gmsh. It is not advisable to change thoose parametrs in the Julia file. 

It creates .geo file to be opened in Gmsh and generate the mesh.

Features:
- Create a .geo file ready to be opened by Gmsh
- The mesh generated has also physical group: airfoil, inlet, outlet, limits
- The mesh is compatible with the FEM Gridap
- It allows to manage both sharp and non-sharp trailing edges
- AoA, geometry and meshing parameters can be modified in Gmsh

Not supported yet:
- Specify just half profile (eg naca0012)

# <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/all_domain.png" width="50%" title="Example of Mesh generated">
# <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/Profile1.png" width="65%" title="Detail of Mesh generated">

<div class="figure" style="text-align: center">
 <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/non_sharp.png" width="32.8%" title="Non-Sharp edge">
 <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/sharp.png" width="32.8%" title="Sharp Edge">
</div>
