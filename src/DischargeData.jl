module DischargeData

export Discharge, Calibration

using Base.Dates

include("quantities.jl")

##################################################
# A light type for holding Calibration data

type Calibration
    t::Vector{DateTime}
    Q::Vector{Float64}
    dd::Discharge
end

end # module
