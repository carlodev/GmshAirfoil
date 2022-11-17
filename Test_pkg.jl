using GridapGmsh
using Gridap
using Revise
include("GmshAirfoil.jl")
using Main.GmshAirfoil

#url = "https://m-selig.ae.illinois.edu/ads/coord/l188root.dat"

url = "https://m-selig.ae.illinois.edu/ads/coord/sd7003.dat"

filename = from_url_to_csv(url)

filename = "test/NACA4412.csv"

filename = "test/NACA0012.csv"


main_create_geofile(filename; Reynolds=1.52e6, elements = :TRI, dimension = 2)


model = GmshDiscreteModel("test/NACA4412_2D.msh")
writevtk(model, "Mesh")