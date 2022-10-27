module GmshAirfoil

using FileIO, CSV, DataFrames, XLSX
using Chain, Downloads
using Gridap, GridapGmsh
include("Read_web.jl")
include("Airfoil_Utils.jl")
include("BL_analysis.jl")
include("Geo_create_fun.jl")
include("Geo_create_fun_ref.jl")

export from_url_to_csv
export create_geofile
export create_geofile_ref

end