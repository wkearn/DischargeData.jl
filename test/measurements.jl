using Measurements

@testset "Measurements" begin
    x = rand(2)
    u = [0.5;0.5]
    H = Stage(ts,measurement.(x,u))
    @test Measurements.uncertainty.(quantity(H)) == [0.5;0.5]
end
