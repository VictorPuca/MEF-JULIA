function kfglobal(elem, no)
    # Número de elementos e de graus de liberdade
    nelem = length(elem)
    nnos = length(no)

    # Definição da matriz K como esparsa
    kg = sparse(I, I, zeros(nnos, nnos))

    for i in 1:nelem
        # Matriz local dos elementos
        ke = elem[i].k * [1 -1; -1 1]
        # Vetor de conectividades
        cnt = elem[i].cnt
        # Montagem da matriz K global
        kg[cnt, cnt] .= kg[cnt, cnt] .+ ke
    end

    # Montagem do vetor f global
    fg = zeros(nnos)
    for i in 1:nnos
        if isempty(no[i].f)
            fg[i] = 0
        else
            fg[i] = no[i].f
        end
    end

    return fg, kg
end
