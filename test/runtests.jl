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

At = CrossSectionalArea(collect(now():now()+Day(1)),randn(2))
AA = CrossSectionalArea(collect(now():now()+Day(1)),randn(2))

carea = Calibration(At,AA)
@test to_quantity(carea) == At
@test from_quantity(carea) ==AA

vt = Velocity(collect(now():now()+Day(1)),[(randn(3)...);(randn(3)...)])
vv = Velocity(collect(now():now()+Day(1)),[(randn(3)...);(randn(3)...)])

cvelocity = Calibration(vt,vv)
@test to_quantity(cvelocity) == vt
@test from_quantity(cvelocity) == vv

dd = Discharge(collect(now():now()+Day(1)),randn(2))
dt = Discharge(collect(now():now()+Day(1)),randn(2))

cdischarge = Calibration(dt,dd)
@test to_quantity(cdischarge) == dt
@test from_quantity(cdischarge) == dd


