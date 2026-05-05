EstadoJugar = Class{__includes = EstadoBase}

function EstadoJugar:init()
    self.paleta = Paleta()
    
    self.pelota = Pelota()
    self.pelota.dx = math.random(-200, 200)
    self.pelota.dy = math.random(-50, -60)
    -- give ball position in the center
    self.pelota.x = VIRTUAL_ANCHO / 2 - 4
    self.pelota.y = VIRTUAL_ALTO - 42

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
    -- Actualizar objetos
    self.paleta:update(dt)
    self.pelota:update(dt)

     if self.pelota:collides(self.paleta) then
        -- invertir direccion de movimiento
        self.pelota.dy = -self.pelota.dy
        Sonidos['paddle-hit']:play()
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end 
end

function EstadoJugar:render()
    self.paleta:render()
    self.pelota:render()

    -- pause text, if paused
    if self.pausado then
        love.graphics.setFont(Fuentes['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_ANCHO / 2 - 16, VIRTUAL_ANCHO, 'center')
    end
end