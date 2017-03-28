module DischargeData

export Quantity,
Discharge,
Stage,
CrossSectionalArea,
Velocity,
Calibration,
times,
quantity,
@quantity

using Base.Dates

include("quantities.jl")
include("calibrations.jl")

end # module
