@testset "Quantity Operations" begin
    At = CrossSectionalArea(collect(ts),randn(2))
    cvt = AlongChannelVelocity(collect(ts),randn(2))
    dvt = At*cvt
    @test quantity(dvt) == quantity(cvt).*quantity(At)

    ts2 = now():now()+Day(2)
    A2 = CrossSectionalArea(collect(ts2),randn(3))

    @test_throws ErrorException A2*cvt
end
