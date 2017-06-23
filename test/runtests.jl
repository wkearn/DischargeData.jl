using DischargeData, Base.Dates
using Base.Test

ts = collect(now():now()+Day(1))


@testset "Stage" begin
    ht = Stage(ts,randn(2))
    hh = Stage(ts,randn(2))

    hs = quantity(ht)

    @test (ts,hs) == unzip(ht)

end

@testset "CrossSectionalArea" begin
    At = CrossSectionalArea(ts,randn(2))
    AA = CrossSectionalArea(ts,randn(2))

end

@testset "Velocity" begin
    vt = Velocity(ts,[(randn(3)...);(randn(3)...)])
    vv = Velocity(ts,[(randn(3)...);(randn(3)...)])

end

@testset "AlongChannelVelocity" begin
    cvt = AlongChannelVelocity(ts,randn(2))
    cvv = AlongChannelVelocity(ts,randn(2))

end

@testset "Discharge" begin
    dd = Discharge(ts,randn(2))
    dt = Discharge(ts,randn(2))

end

include("quantity_ops.jl")
include("measurements.jl")
include("fluxes.jl")
include("array_interface.jl")

