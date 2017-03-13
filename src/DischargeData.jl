module DischargeData

export Discharge

type Discharge
    cp::Vector{Float64}
    ts::Vector{DateTime}
    vs::Vector{Float64}
    A::Vector{Float64}
    Q::Vector{Float64}
end

Discharge(cp::Vector{Float64},Q::Vector{Float64}) = Discharge(cp,DateTime[],Float64[],Float64[],Q)

end # module
