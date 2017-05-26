module DischargeData

export Quantity,
Discharge,
Stage,
CrossSectionalArea,
Velocity,
AlongChannelVelocity,
Temperature,
Calibration,
times,
quantity,
unzip,
@quantity,
@quantity_op,
to_quantity,
from_quantity,
Flux

using Base.Dates

include("quantities.jl")
include("calibrations.jl")
if VERSION >= v"0.6.0-"
    # Fluxes depend on v0.6 parametric types
    # We're working towards supporting only v0.6
    # so this check will be dropped very shortly
    include("fluxes.jl")
end

end # module
