# GmshAirfoil

The package is thought to automatize and optimize the procedure for creating structured airfoil meshes using Gmsh.
Features:

## version 1.2
- Create the 2D mesh with periodic boundaries on Z directionµ
- You can spacify the type of elements: TRI/TETRA or QUAD/HEX

## version 1.1
- Create a region close to the airfoil for creating a refinement close to the airfoil
- You can specify the Reynolds and, if you prefer, the height of the first layer, the software automatically 
looks for the best combination of number of layers (<150 in the refinement region) and growth ratio



## version 1.0

- Generate a csv file from the url from http://airfoiltools.com/
- Create a .geo file ready to be opened by Gmsh
- The mesh generated has also physical group: airfoil, inlet, outlet, limits
- The mesh is compatible with the FEM Gridap
- It allows to manage both sharp and non-sharp trailing edges
- AoA, geometry dimensions, number of nodes and progression can be modified in Gmsh





Not supported yet:
- Specify just half profile (eg naca0012)
- 3D meshes

### How to use
The user can provide directly the .csv file.
The user can provide the url form http://airfoiltools.com/ and the csv file will be automatically generated.
Example
```julia
    url = "https://m-selig.ae.illinois.edu/ads/coord/e1211.dat"
    filename = from_url_to_csv(url)
    create_geofile(filename)
```

The user can specify the trailing edge node(s) and where to start for the leading-edge meshing. An automatic detection is implemented.
Dimensions and meshing parameters are provided by defualt. The geometry dimensions of the domain and the meshing parameters (number of nodes, and progression) are parameters that can be changed in Gmsh. It is not advisable to change thoose parametrs in the Julia file. 

Prepare the .csv file as in the /test. The points have to be cointinuous, and start form the trailing edge and go to the leading edge and back to the trailing edge.
It creates .geo file to be opened in Gmsh and generate the mesh.



# <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/all_domain.png" width="50%" title="Example of Mesh generated">
# <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/Refinement.png" width="65%" title="Detail of the generated mesh and the refinement close to the airfoil">

<div class="figure" style="text-align: center">
 <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/non_sharp.png" width="32.8%" title="Non-Sharp edge">
 <img src="https://github.com/carlodev/Gmsh_Airfoil/blob/master/imgs/sharp.png" width="32.8%" title="Sharp Edge">
</div>
