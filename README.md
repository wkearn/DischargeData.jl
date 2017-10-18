# TidalFluxQuantities.jl

[![TidalFluxes.jl Badge](https://wkearn.github.io/TidalFluxes.jl/assets/badge.svg)](https://github.com/wkearn/TidalFluxes.jl)

[![Build Status](https://travis-ci.org/wkearn/TidalFluxQuantities.jl.svg?branch=master)](https://travis-ci.org/wkearn/TidalFluxQuantities.jl)

[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://wkearn.github.io/TidalFluxQuantities.jl/latest)

This package provides a generic interface for dealing with time series of various quantities that one might sample in a tidal channel. For instance, we can construct a `Discharge` instance which holds a discharge time series or a `Stage` instance which holds a time series of water levels. Putting these together, we'll be able to estimate a [stage-discharge model](https://github.com/wkearn/TidalDischargeModels.jl). 
