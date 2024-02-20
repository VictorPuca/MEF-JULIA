# Definição de alfa
alfa = 1

# Dados dos elementos
elem = [
    Dict("k" => 300, "cnt" => [1, 2]),
    Dict("k" => 200, "cnt" => [2, 3]),
    Dict("k" => 300, "cnt" => [2, 3]),
    Dict("k" => 200, "cnt" => [2, 4]),
    Dict("k" => 300, "cnt" => [3, 4])
]

# Dados nodais
no = [
    Dict("u" => 0),
    Dict("f" => 0),
    Dict("f" => 0),
    Dict("f" => 10)
]

# Matriz K e vetor f global
fg, kg = kfglobal(elem, no)

# Condições de contorno
fga, kga = contorno(kg, fg, no)

# Vetor dos deslocamentos
u = kga \ fga

# Vetor das forças normais (elemento)
elem = felem(elem, u, alfa)

# Cálculo das grandezas f e u nos nós
no = fnodal(no, u, kg)
