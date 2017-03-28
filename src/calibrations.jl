"""
A Calibration holds two TidalFluxQuantities

- qtrue is the 'true' quantity that we want to calibrate to
- qmeas is the measured quantity that we want to calibrate from
"""
type Calibration
    qtrue::Quantity
    qmeas::Quantity
end

true_quantities(c::Calibration) = c.qtrue
meas_quantities(c::Calibration) = c.qmeas

times(c::Calibration) = (times(c.qtrue),times(c.qmeas))
