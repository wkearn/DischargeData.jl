module DischargeData

export Discharge, Stage, Calibration

using Base.Dates

include("quantities.jl")
include("calibrations.jl")

end # module
