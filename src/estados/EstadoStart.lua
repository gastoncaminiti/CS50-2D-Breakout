EstadoStart = Class{__includes = EstadoBase}

local highlighted = 1

function EstadoStart:update(dt)
    -- Alternar highlighted segun flecha
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlighted = highlighted == 1 and 2 or 1
        Sonidos['paddle-hit']:play()
    end
    -- Salir del Juego
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function EstadoStart:render()
    -- Titulo
    love.graphics.setFont(Fuentes['large'])
    love.graphics.printf('BREAKOUT', 0, VIRTUAL_ALTO / 3,
        VIRTUAL_ANCHO, 'center')
    -- Instrucciones
    love.graphics.setFont(Fuentes['medium'])

    -- If highlighted 1
    if highlighted == 1 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end

    love.graphics.printf('JUGAR', 0, VIRTUAL_ALTO / 2 + 70,
        VIRTUAL_ANCHO, 'center')

    -- reiniciar color
    love.graphics.setColor(1, 1, 1, 1)

    -- If highlighted 2
    if highlighted == 2 then
        love.graphics.setColor(103/255, 1, 1, 1)
    end
    love.graphics.printf('PUNTAJES', 0, VIRTUAL_ALTO / 2 + 90,
        VIRTUAL_ANCHO, 'center')
    -- reset the color
    love.graphics.setColor(1, 1, 1, 1)
end