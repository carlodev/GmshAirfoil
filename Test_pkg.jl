using GridapGmsh
using Gridap
using Revise
include("GmshAirfoil.jl")
using Main.GmshAirfoil

#url = "https://m-selig.ae.illinois.edu/ads/coord/l188root.dat"

url = "https://m-selig.ae.illinois.edu/ads/coord/sd7003.dat"

filename = from_url_to_csv(url)

filename = "test/e1211.csv"

filename = "test/NACA0012.csv"


create_geofile_ref(filename; Reynolds=600_000, elements = :TRI)


model = GmshDiscreteModel("e1211_2D.msh")
writevtk(model, "Mesh")