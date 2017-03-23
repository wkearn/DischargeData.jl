using DischargeData, Base.Dates
using Base.Test

dd = Discharge(zeros(100),zeros(100))

cc = Calibration(collect(now():now()+Day(1)),randn(2),dd)
