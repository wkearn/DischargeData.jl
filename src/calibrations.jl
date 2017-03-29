"""
A Calibration holds two TidalFluxQuantities

- qto is the 'true' quantity that we want to calibrate to
- qfrom is the measured quantity that we want to calibrate from
"""
type Calibration
    qto::Quantity
    qfrom::Quantity
end

to_quantity(c::Calibration) = c.qto
from_quantity(c::Calibration) = c.qfrom

times(c::Calibration) = (times(to_quantity(c)),times(from_quantity(c)))
