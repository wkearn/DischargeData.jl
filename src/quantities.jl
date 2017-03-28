abstract Quantity{T} <: AbstractVector{Tuple{DateTime,T}}

"""Return the times at which the quantity is measured"""
times(q::Quantity) = q.ts

"""Return the values of the quantity itself"""
quantity(q::Quantity) = q.q

Base.linearindexing{T<:Quantity}(::Type{T}) = Base.LinearFast()

# When you do q[range] for range::UnitRange, these return
# a vector, not a Quantity
Base.size(q::Quantity) = size(times(q))
Base.getindex(q::Quantity,i::Int) = (times(q)[i],quantity(q)[i])

"""
This generates a Quantity type which
conforms to the specification of the abstract
type

# Examples

```julia
@quantity Stage Float64
```

generates a new type Stage <: Quantity{Float64}
which is a Real-valued time series 
"""
macro quantity(name,T)
    quote
        Base.@__doc__ immutable $name <: Quantity{$T}
            ts::Vector{DateTime}
            q::Vector{$T}
        end
    end
end

"""
An ``R``-valued time series for water levels
"""
@quantity Stage Float64

"""
An ``R``-valued time series for the flooded
cross-sectional area of a channel
"""
@quantity CrossSectionalArea Float64

"""
An ``R^3`` valued time series for velocity
"""
@quantity Velocity Tuple{Float64,Float64,Float64}

"""
An ``R``-valued time series for discharge
"""
@quantity Discharge Float64
