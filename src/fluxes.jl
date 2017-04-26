"""
A flux of a scalar quantity is itself a quantity
"""
@quantity Flux{T<:Quantity{Float64}} Float64

function Base.:*{T<:Quantity{Float64}}(a::T,b::Discharge)
    times(a) == times(b) || error("Time series are not sampled at the same times. Consider interpolating")
    Flux{T}(times(a),quantity(a).*quantity(b))
end

function Base.:*{T<:Quantity{Float64}}(a::Discharge,b::T)
    times(a) == times(b) || error("Time series are not sampled at the same times. Consider interpolating")
    Flux{T}(times(a),quantity(a).*quantity(b))
end
