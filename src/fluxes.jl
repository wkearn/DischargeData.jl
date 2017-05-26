"""
# A flux of a scalar quantity is itself a quantity
# """
type Flux{S<:AbstractFloat,T<:Quantity{S}} <: Quantity{S}
    ts::Vector{DateTime}
    q::Vector{S}
end

function Base.:*{S<:AbstractFloat,T<:Quantity{S}}(a::T,b::Discharge)
    times(a) == times(b) || error("Time series are not sampled at the same times. Consider interpolating")
    Flux{S,T}(times(a),quantity(a).*quantity(b))
end

function Base.:*{S<:AbstractFloat,T<:Quantity{S}}(a::Discharge,b::T)
    times(a) == times(b) || error("Time series are not sampled at the same times. Consider interpolating")
    Flux{S,T}(times(a),quantity(a).*quantity(b))
end
