"""
# A flux of a scalar quantity is itself a quantity
# """
type Flux{S<:Real} <: Quantity{S}
    ts::Vector{DateTime}
    q::Vector{S}
end

function Base.:*{T<:Quantity}(a::T,b::Discharge)
    times(a) == times(b) || error("Time series are not sampled at the same times. Consider interpolating")
    Flux(times(a),quantity(a).*quantity(b))
end

function Base.:*{T<:Quantity}(a::Discharge,b::T)
    times(a) == times(b) || error("Time series are not sampled at the same times. Consider interpolating")
    Flux(times(a),quantity(a).*quantity(b))
end
