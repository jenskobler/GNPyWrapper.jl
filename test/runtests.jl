using GNPyWrapper
using Test

@testset "GNPyWrapper.jl" begin
    # Write your tests here.

    @test GNPyWrapper.dummyfunction() == "A dummy function"
    @test dummymult10(10) == 100
    @test dummymult10(20) == 200
end
