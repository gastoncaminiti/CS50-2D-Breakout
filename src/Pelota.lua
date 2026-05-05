Pelota = Class{}

function Pelota:init()
    self.ancho = 8
    self.alto = 8
    self.dx = 0
    self.dy = 0
end

function Pelota:collides(target)
    if self.x > target.x + target.ancho or target.x > self.x + self.ancho then
        return false
    end

    if self.y > target.y + target.alto or target.y > self.y + self.alto then
        return false
    end

    return true
end

function Pelota:reset()
    self.x = VIRTUAL_ANCHO / 2 - 2
    self.y = VIRTUAL_ALTO / 2 - 2
    self.dx = 0
    self.dy = 0
end


function Pelota:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if self.x <= 0 then
        self.x = 0
        self.dx = -self.dx
        Sonidos['wall-hit']:play()
    end

    if self.x >= VIRTUAL_ANCHO - 8 then
        self.x = VIRTUAL_ANCHO - 8
        self.dx = -self.dx
        Sonidos['wall-hit']:play()
    end

    if self.y <= 0 then
        self.y = 0
        self.dy = -self.dy
        Sonidos['wall-hit']:play()
    end
end

function Pelota:render()
    love.graphics.draw(Texturas['ball'], self.x, self.y)
end