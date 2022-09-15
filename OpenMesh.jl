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
