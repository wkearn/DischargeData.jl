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
        immutable $name <: TidalFluxQuantity{$T}
            ts::Vector{DateTime}
            q::Vector{$T}
        end

        DischargeData.quantity(q::$name) = q.q
    end
end

@quantity Stage Float64
@quantity CrossSectionalArea Float64
@quantity Velocity Tuple{Float64,Float64,Float64}
@quantity Discharge Float64
