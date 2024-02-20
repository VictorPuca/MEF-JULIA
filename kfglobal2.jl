function kfglobal(elem, no)
    nelem = length(elem)
    nnos = length(no)

    kg = sparse(I, I, zeros(nnos, nnos))

    for i in 1:nelem
        ke = elem[i].k * [1 -1; -1 1]
        cnt = elem[i].cnt
        kg[cnt, cnt] .= kg[cnt, cnt] .+ ke
    end

    fg = zeros(nnos)
    for i in 1:nnos
        if isempty(no[i].fp)
            fg[i] = 0
        else
            fg[i] = no[i].fp
        end
    end

    fg = fg'
    return fg, kg
end
