module DischargeData

export Discharge, Calibration

"""
    Discharge(cp,ts,vs,A,Q)

A type to hold all the stuff we calculate when we 
calculate discharge time series
"""
type Discharge
    cp::Vector{Float64}
    ts::Vector{DateTime}
    vs::Vector{Float64}
    A::Vector{Float64}
    Q::Vector{Float64}
end

Discharge(cp::Vector{Float64},Q::Vector{Float64}) = Discharge(cp,DateTime[],Float64[],Float64[],Q)

##################################################
# A light type for holding Calibration data

type Calibration
    t::Vector{DateTime}
    Q::Vector{Float64}
    dd::Discharge
end

end # module
