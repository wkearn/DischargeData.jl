abstract TidalFluxQuantity{T} <: AbstractVector{Tuple{DateTime,T}}

times(q::TidalFluxQuantity) = q.ts
Base.linearindexing{T<:TidalFluxQuantity}(::Type{T}) = Base.LinearFast()

# When you do q[range] for range::UnitRange, these return
# a vector, not a TidalFluxQuantity
Base.size(q::TidalFluxQuantity) = size(times(q))
Base.getindex(q::TidalFluxQuantity,i::Int) = (times(q)[i],quantity(q)[i])


immutable Stage <: TidalFluxQuantity{Float64}
    ts::Vector{DateTime}
    h::Vector{Float64}
end

quantity(h::Stage) = h.h

immutable Discharge <: TidalFluxQuantity{Float64}
    ts::Vector{DateTime}
    Q::Vector{Float64}
end

quantity(q::Discharge) = q.Q

Discharge(cp::Vector{Float64},Q::Vector{Float64}) = Discharge(cp,DateTime[],Float64[],Float64[],Q)
