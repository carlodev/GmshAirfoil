include("GmshAirfoil.jl")
using Main.GmshAirfoil
url = "https://m-selig.ae.illinois.edu/ads/coord/l188root.dat"

url = "https://m-selig.ae.illinois.edu/ads/coord/hobiesm.dat"

filename = from_url_to_csv(url)

create_geofile(filename)
