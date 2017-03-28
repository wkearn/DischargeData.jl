using DischargeData, Base.Dates
using Base.Test

ht = Stage(collect(now():now()+Day(1)),randn(2))
hh = Stage(collect(now():now()+Day(1)),randn(2))

cstage = Calibration(ht,hh)

dd = Discharge(collect(now():now()+Day(1)),randn(2))
dt = Discharge(collect(now():now()+Day(1)),randn(2))

cdischarge = Calibration(dt,dd)


