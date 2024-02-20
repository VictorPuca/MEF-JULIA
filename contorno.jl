function contorno(kg, fg, no)
    nnos = length(no)
    beta = 1e12 * maximum(diag(kg))
    kga = copy(kg)
    fga = copy(fg)

    for i in 1:nnos
        if isempty(no[i].f)
            kga[i, i] = kg[i, i] + beta
            fga[i] = beta * no[i].u
        end
    end

    return fga, kga
end
