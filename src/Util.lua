function GenerarPaletas(atlas)
    local x = 0
    local y = 32
    local ancho = 104
    local alto = 32

    local contador = 1
    local frames = {}
    -- Skin 1
    frames[contador] = love.graphics.newQuad(x, y, ancho, alto,
            atlas:getDimensions())
    contador = contador + 1
     -- Skin 2
    frames[contador] = love.graphics.newQuad(x + ancho, y, ancho, alto,
            atlas:getDimensions())
    contador = contador + 1
     -- Skin 3
    frames[contador] = love.graphics.newQuad(x + (ancho * 2), y, ancho, alto,
            atlas:getDimensions())
    contador = contador + 1
    return frames
end