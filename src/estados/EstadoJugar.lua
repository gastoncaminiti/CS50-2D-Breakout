EstadoJugar = Class{__includes = EstadoBase}

function EstadoJugar:init()
    self.paleta = Paleta()
    self.pausado = false
end

function EstadoJugar:update(dt)
    if self.pausado then
        if love.keyboard.wasPressed('space') then
            self.pausado = false
            Sonidos['pause']:play()
        else
            return
        end
    elseif love.keyboard.wasPressed('space') then
        self.pausado = true
        Sonidos['pause']:play()
        return
    end

    -- update positions based on velocity
    self.paleta:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end 
end

function EstadoJugar:render()
    self.paleta:render()

    -- pause text, if paused
    if self.pausado then
        love.graphics.setFont(Fuentes['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_ANCHO / 2 - 16, VIRTUAL_ANCHO, 'center')
    end
end