using SparseArrays

function kfglobal(elem, no)
    # Número de elementos e de graus de liberdade
    nelem = length(elem)
    nnos = length(no)

    # Definição da matriz K como esparsa
    kg = spzeros(nnos, nnos)

    for el in elem
        # Matriz local dos elementos
        ke = el["k"] * [1 -1; -1 1]
        # Vetor de conectividades
        cnt = el["cnt"]
        # Montagem da matriz K global
        kg[cnt, cnt] .= kg[cnt, cnt] .+ ke
    end

    # Montagem do vetor f global
    fg = zeros(nnos)
    for i in 1:nnos
        if isempty(no[i]["f"]) # A chamada de índices de um dicionário é feita assim: 'dado["chave"]'
            fg[i] = 0
        else
            fg[i] = no[i]["f"]
        end
    end

    return fg, kg
end
