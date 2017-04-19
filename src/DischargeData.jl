module DischargeData

export Quantity,
Discharge,
Stage,
CrossSectionalArea,
Velocity,
AlongChannelVelocity,
Calibration,
times,
quantity,
unzip,
@quantity,
@quantity_op,
to_quantity,
from_quantity

using Base.Dates

include("quantities.jl")
include("calibrations.jl")

end # module
