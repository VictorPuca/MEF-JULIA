function fnodal(no, u, kg)
    nnos = length(no)
    for i in 1:nnos
        if isempty(no[i].f)
            no[i].f = dot(kg[i, :], u)
        else
            no[i].u = u[i]
        end
    end
    return no
end
