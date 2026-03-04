Paleta = Class{}

function Paleta:init()
    -- x se coloca en el medio
    self.x = VIRTUAL_ANCHO / 2 - 32
    -- y se coloca un poco por encima del borde inferior de la pantalla
    self.y = VIRTUAL_ALTO - 32
    -- empezamos sin velocidad
    self.nuevax = 0
    -- dimensiones iniciales
    self.ancho = 102
    self.alto = 16
    -- la skin solo tiene efecto de cambiar nuestra textura
    self.skin = 3
end

function Paleta:update(dt)
     -- Input de teclado
    if love.keyboard.isDown('left') then
        self.nuevax = -PALETA_VELOCIDAD
    elseif love.keyboard.isDown('right') then
        self.nuevax = PALETA_VELOCIDAD
    else
        self.nuevax = 0
    end

    if self.nuevax < 0 then
        self.x = math.max(0, self.x + self.nuevax * dt)
    else
        self.x = math.min(VIRTUAL_ANCHO - self.ancho, self.x + self.nuevax * dt)
    end
end

function Paleta:render()
    love.graphics.draw(
        Texturas['main'], 
        Frames['paddles'][self.skin],
   self.x, self.y)
   --love.graphics.rectangle("fill", self.x,self.y, self.ancho,self.alto)
end