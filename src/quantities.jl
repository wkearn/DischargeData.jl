"""
A `Quantity` represents a time series of some quantity
measured in a tidal channel. You might measure water 
levels (`Stage`) or flow (`Discharge`) or whatever
water quality parameters you might think up (not implemented).

Each sample of a quantity is assumed to be drawn at a 
real-world time, so a `Quantity` is a vector of values of the 
quantity in some space `T` attached to a `DateTime`.
"""
abstract Quantity{T} <: AbstractVector{Tuple{DateTime,T}}

"""Return the times at which the quantity is measured"""
times(q::Quantity) = q.ts

"""Return the values of the quantity itself"""
quantity(q::Quantity) = q.q

"""
Return both of the parts of the quantity
"""
unzip(q::Quantity) = (times(q),quantity(q))

Base.linearindexing{T<:Quantity}(::Type{T}) = Base.LinearFast()

# When you do q[range] for range::UnitRange, these return
# a vector, not a Quantity
Base.size(q::Quantity) = size(times(q))
Base.getindex(q::Quantity,i::Int) = (times(q)[i],quantity(q)[i])

"""
    @quantity name T

This macro simplifies the process of defining
a quantity that conforms to the abstract
specification.

# Examples

```julia
@quantity Stage Float64
```

generates a new type Stage <: Quantity{Float64}
which is a Real-valued time series 
"""
macro quantity(name,T)
    quote
        Base.@__doc__ immutable $name{T<:$T} <: Quantity{T}
            ts::Vector{DateTime}
            q::Vector{T}
        end
    end
end

"""
    @quantity_op Quantity = Quantity (:op) Quantity

This macro defines a Quantity as the output of an 
operation on two other Quantities. The operation is
applied by a map over the two input quantities, so
it is possible to define any operation which makes
sense pointwise in a time series.

# Examples

```julia
@quantity_op Discharge = CrossSectionalArea * AlongChannelVelocity
```

"""
macro quantity_op(ex)
    ex.head == :(=) || error("Expression is not an equality")
    output = ex.args[1]
    expr = ex.args[2]
    expr.head == :call || error("Expression does not call a function")
    op = expr.args[1]
    length(expr.args[2:end]) == 2 || error("Expressions of length > 2 quantities not yet supported")
    args = (expr.args[2:end]...)
    quote
        function Base.$op{A<:$(esc(args[1])),B<:$(esc(args[2]))}(a::A,b::B)
            times(a) == times(b) || error("Time series are not sampled at the same times. Consider interpolating")
            $(esc(output))(times(a),map($op, quantity(a), quantity(b)))
        end
    end
end
        

"""
An ``R``-valued time series for water levels
"""
@quantity Stage AbstractFloat

"""
An ``R``-valued time series for the flooded
cross-sectional area of a channel
"""
@quantity CrossSectionalArea AbstractFloat

"""
An ``R^3`` valued time series for velocity
"""
@quantity Velocity Tuple{AbstractFloat,AbstractFloat,AbstractFloat}

"""
An ``R^3`` valued time series for the velocity
along a channel
"""
@quantity AlongChannelVelocity AbstractFloat

"""
An ``R``-valued time series for discharge
"""
@quantity Discharge AbstractFloat

@quantity_op Discharge = CrossSectionalArea * AlongChannelVelocity

"""
An ``R``-valued time series for temperature
"""
@quantity Temperature AbstractFloat
