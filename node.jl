using LinearAlgebra

struct Node
    id::Int64
    position::Vector{Float64}
    forces::Vector{Float64}
    supports::Vector{Bool}

    function Node(id::Int64, 
        position::Vector{Float64}; 
        forces::Vector{Float64}=[0.0, 0.0], 
        supports::Vector{Bool}=[false, false])
        # Cada um dos membros de 'Node' DEVEM possuir 2 elementos. Como dados do tipo
        # 'Vector{Float64}' são dinâmicos (possuem tamanho variável), é necessário 
        # garantir que cada um deles possua 2 elementos com as seguintes verificações para que 
        # erros de execução sejam evitados.

        if length(position) != 2
            throw(ArgumentError("The 'position' vector must have 2 elements"))
        end

        if length(forces) != 2
            throw(ArgumentError("The 'forces' vector must have 2 elements"))
        end

        if length(supports) != 2
            throw(ArgumentError("The 'supports' vector must have 2 elements"))
        end

        new(id, position, forces, supports)
    end
end

function distance(node1::Node, node2::Node)::Float64
    return norm(node1.position - node2.position)
end

function degrees_of_freedom(node::Node)::Int
    return sum(node.supports)
end