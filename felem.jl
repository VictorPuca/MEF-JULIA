function felem(elem, u, alfa)
    nelem = length(elem)
    for i in 1:nelem
        noi = elem[i].cnt[1]
        noj = elem[i].cnt[2]
        du = u[noj] - u[noi]
        elem[i].f = alfa * elem[i].k * du
    end
    return elem
end
