# Tests to make sure the Quantity array interface works as expected

@testset "similar" begin
    H = Stage(ts,randn(2))
    @test typeof(similar(H,5)) <: Stage
end

@testset "setindex" begin
    H = Stage(ts,randn(2))
    H[2] = (now(),500)
    @test quantity(H)[2] == 500
end

@testset "Range indexing" begin
    r = randn(2)
    H = Stage(ts,r)
    @test quantity(H[1:2]) == r
    @test typeof(H[1:2]) <: Stage
end
