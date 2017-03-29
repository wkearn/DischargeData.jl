module DischargeData

export Quantity,
Discharge,
Stage,
CrossSectionalArea,
Velocity,
Calibration,
times,
quantity,
unzip,
@quantity,
to_quantity,
from_quantity

using Base.Dates

include("quantities.jl")
include("calibrations.jl")

end # module
