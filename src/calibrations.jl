"""
A Calibration holds two TidalFluxQuantities

- qto is the 'true' quantity that we want to calibrate to
- qfrom is the measured quantity that we want to calibrate from
"""
type Calibration{T<:Quantity, F<:Quantity}
    qto::T
    qfrom::F
end

"""Return the to quantity"""
to_quantity(c::Calibration) = c.qto

"""Return the from quantity"""
from_quantity(c::Calibration) = c.qfrom

times(c::Calibration) = (times(to_quantity(c)),times(from_quantity(c)))
