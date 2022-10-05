using GridapGmsh
using Gridap
using Revise
include("GmshAirfoil.jl")
using Main.GmshAirfoil

url = "https://m-selig.ae.illinois.edu/ads/coord/l188root.dat"

url = "https://m-selig.ae.illinois.edu/ads/coord/e1211.dat"
filename = from_url_to_csv(url)
create_geofile(filename)


model = GmshDiscreteModel("e1211_2D.msh")
writevtk(model, "Mesh")