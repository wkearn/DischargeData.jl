abstract TidalFluxQuantity{T} <: AbstractVector{Tuple{DateTime,T}}

times(q::TidalFluxQuantity) = q.ts
Base.linearindexing{T<:TidalFluxQuantity}(::Type{T}) = Base.LinearFast()

# When you do q[range] for range::UnitRange, these return
# a vector, not a TidalFluxQuantity
Base.size(q::TidalFluxQuantity) = size(times(q))
Base.getindex(q::TidalFluxQuantity,i::Int) = (times(q)[i],quantity(q)[i])

"""
This generates a TidalFluxQuantity type which
conforms to the specification of the abstract
type

Example:

```
@quantity Stage Float64
```

generates a new type Stage <: TidalFluxQuantity{Float64}
which is a Real-valued time series 
"""
macro quantity(name,T)
    quote
        Base.@__doc__ immutable $name <: TidalFluxQuantity{$T}
            ts::Vector{DateTime}
            q::Vector{$T}
        end

        quantity(q::$name) = q.q
    end
end

"""
A real valued time series for water levels
"""
@quantity Stage Float64

"""
A real valued time series for the flooded
cross-sectional area of a channel
"""
@quantity CrossSectionalArea Float64

"""
An R^3 valued time series for velocity
"""
@quantity Velocity Tuple{Float64,Float64,Float64}

"""
An R valued time series for discharge
"""
@quantity Discharge Float64
