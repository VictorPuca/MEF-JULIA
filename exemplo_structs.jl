include("element.jl")

nodes = [Node(1, [0.0, 0.0]),
Node(2, [1.0, 1.0]; forces=[10.0, 0.0], supports=[true, true])]

material = Material(1, 1.0)

element = Element(1, nodes, material)

println("========= Element properties =========\n")
println("id: $(element.id)\n\n")
println("nodes: $(element.nodes)\n\n")
println("material: $(element.material)\n\n")
println("length: $(len(element))\n\n")
