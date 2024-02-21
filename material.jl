struct Material
    id::Int64
    young_modulus::Float64

    function Material(id::Int64, young_modulus::Float64)
        if id <= 0
            throw(ArgumentError("The 'id' must be greater than 0"))
        end
        
        if young_modulus <= 0
            throw(ArgumentError("The 'young_modulus' must be greater than 0"))
        end

        new(id, young_modulus)
    end
end