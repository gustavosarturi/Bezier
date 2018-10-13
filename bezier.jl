Pkg.add("Luxor");
Pkg.add("Colors");
using Luxor
using Colors

function bern(x₁::Real, x₂::Real, t::Real)
    return t * x₁ + (1 - t) * x₂
end

@png begin
    x₁, y₁ = (-200, 0)
    x₂, y₂ = (-100, -100)
    x₃, y₃ = (100, -100)
    x₄, y₄ = (200, 0)
    P1  = Point(x₁,y₁)
    P2 = Point(x₂, y₂)
    P3 = Point(x₃, y₃)
    P4  = Point(x₄, y₄)

    t = 0.3
    Q1 = Point(bern(x₁, x₂, t), bern(y₁, y₂, t))
    Q2 = Point(bern(x₂, x₃, t), bern(y₂, y₃, t))
    Q3 = Point(bern(x₃, x₄, t), bern(y₃, y₄, t))
    line(P1,P2,:stroke)
    line(P2,P3,:stroke)
    line(P3,P4,:stroke)
    sethue("purple")
    line(Q1,Q2,:stroke)
    line(Q2,Q3,:stroke)
    sethue("green")
    ##line(R1,R2,:stroke)
    sethue("black")
    circle.([P1, P2, P3, P4, Q1, Q2, Q3], 5, :fill)
    label.(["P[0,0]", "P[0,1]", "P[0,2]", "P[0,3]"], :N, [P1, P2, P3, P4], offset=10)
    sethue("red")
    move(P1)
    curve(P2,P3,P4)
    strokepath()
end

