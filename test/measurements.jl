using Measurements

@testset "Measurements" begin
    H = Stage(ts,measurement(rand(2),0.5))
    @test uncertainty(quantity(H)) == [0.5;0.5]
end
