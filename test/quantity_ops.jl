@quantity_op Discharge = CrossSectionalArea * AlongChannelVelocity

dvt = At*cvt
@test quantity(dvt) == quantity(cvt).*quantity(At)

ts2 = now():now()+Day(2)
A2 = CrossSectionalArea(ts2,randn(3))

@test_throws ErrorException A2*cvt 
