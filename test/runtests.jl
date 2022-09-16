using ESA
using Test

@testset "ESA.jl" begin
    path = joinpath(@__DIR__, "IEEE 14 bus.pwb")
    saw = SAW(path)
    @test saw.pw_order == false
    @test saw.GetParametersMultipleElement("Bus", ["BusNum"]).shape[1] == 14
    saw.exit()
end
