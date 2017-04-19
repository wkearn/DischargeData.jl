using DischargeData, Base.Dates
using Base.Test

ht = Stage(collect(now():now()+Day(1)),randn(2))
hh = Stage(collect(now():now()+Day(1)),randn(2))

ts = times(ht)
hs = quantity(ht)

@test (ts,hs) == unzip(ht)

cstage = Calibration(ht,hh)
@test to_quantity(cstage) == ht
@test from_quantity(cstage) == hh

At = CrossSectionalArea(ts,randn(2))
AA = CrossSectionalArea(ts,randn(2))

carea = Calibration(At,AA)
@test to_quantity(carea) == At
@test from_quantity(carea) ==AA

vt = Velocity(ts,[(randn(3)...);(randn(3)...)])
vv = Velocity(ts,[(randn(3)...);(randn(3)...)])

cvelocity = Calibration(vt,vv)
@test to_quantity(cvelocity) == vt
@test from_quantity(cvelocity) == vv

cvt = AlongChannelVelocity(ts,randn(2))
cvv = AlongChannelVelocity(ts,randn(2))

ccvelocity = Calibration(cvt,cvv)
@test to_quantity(ccvelocity) == cvt
@test from_quantity(ccvelocity) == cvv

dd = Discharge(ts,randn(2))
dt = Discharge(ts,randn(2))

cdischarge = Calibration(dt,dd)
@test to_quantity(cdischarge) == dt
@test from_quantity(cdischarge) == dd

include("quantity_ops.jl")
