using DischargeData, Base.Dates
using Base.Test

ht = Stage(collect(now():now()+Day(1)),randn(2))
hh = Stage(collect(now():now()+Day(1)),randn(2))

cstage = Calibration(ht,hh)

At = CrossSectionalArea(collect(now():now()+Day(1)),randn(2))
AA = CrossSectionalArea(collect(now():now()+Day(1)),randn(2))

carea = Calibration(At,AA)

vt = Velocity(collect(now():now()+Day(1)),[(randn(3)...);(randn(3)...)])
vv = Velocity(collect(now():now()+Day(1)),[(randn(3)...);(randn(3)...)])

cvelocity = Calibration(vt,vv)

dd = Discharge(collect(now():now()+Day(1)),randn(2))
dt = Discharge(collect(now():now()+Day(1)),randn(2))

cdischarge = Calibration(dt,dd)


