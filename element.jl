include("node.jl")
include("material.jl")

struct Element
    id::Int64
    nodes::Vector{Node}
    material::Material

    function Element(id::Int64, nodes::Vector{Node}, material::Material)
        if id <= 0
            throw(ArgumentError("The 'id' must be greater than 0"))
        end
        
        # Para estruturas de treliça, cada elemento é composto por 2 nós.
        if length(nodes) != 2
            throw(ArgumentError("The 'nodes' vector must have 2 elements"))
        end

        new(id, nodes, material)
    end
end

function len(element::Element)::Float64
    return distance(element.nodes[1], element.nodes[2])
end

# Implementar aqui a função que retorna a matriz de rigidez do elemento.
function k_local(element::Element)::Matrix{Float64}
    return zeros(2, 2)
end

# Implementar a matriz de rotação do elemento.
function rotation_matrix(element::Element)::Matrix{Float64}
    return zeros(2, 2)
end

# Matriz de rigidez global (matriz local rotacionada)
function k_global(element::Element)::Matrix{Float64}
    return rotation_matrix(element)' * k_local(element) * rotation_matrix(element)
end