# Utilities for filtering Quantities with window operations

"""
Filters the quantity q with a window function w

w::AbstractArray{T,1} -> T
"""
function filter_window{T<:Quantity}(q::T,w,k)
    ts,qs = unzip(q)
    N = length(qs)
    ps = zeros(qs)
    kk = isodd(k) ? k : k+1
    k2 = kk>>1
    for i in eachindex(ps)
        i1 = max(1,i-k2)
        i2 = min(N,i+k2)
        ps[i] = w(qs[i1:i2])
    end
    T(ts,ps)
end
