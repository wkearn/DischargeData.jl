# DischargeData

[![Build Status](https://travis-ci.org/wkearn/DischargeData.jl.svg?branch=master)](https://travis-ci.org/wkearn/DischargeData.jl)

[Part of ![TidalFluxes.jl](http://wskearney.com/assets/TFlogo.svg)](https://github.com/wkearn/TidalFluxes.jl)

This package (to be eventually renamed something like `TidalFluxQuantities.jl`) provides a generic interface for dealing with time series of various quantities that one might sample in a tidal channel. For instance, we can construct a `Discharge` instance which holds a discharge time series or a `Stage` instance which holds a time series of water levels. Putting these together, we'll be able to estimate a [stage-discharge model](https://github.com/wkearn/TidalDischargeModels.jl). 

