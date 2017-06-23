@testset "Calibration cat" begin
    h1 = Stage(ts,randn(2))
    h2 = Stage(ts,randn(2))
    h3 = Stage(ts,randn(2))
    h4 = Stage(ts,randn(2))

    c1 = Calibration(h1,h2)
    c2 = Calibration(h3,h4)
    c = vcat(c1,c2)
    @test typeof(c)==Calibration{Stage{Float64},Stage{Float64}}
    @test size(c) == (4,4)
end
