require 'src.Dependencias'

function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Breakout')
    
    math.randomseed(os.time())
    
    -- Inicializacion de fuentes
    Fuentes = {
        ['small']   = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium']  = love.graphics.newFont('fonts/font.ttf', 16),
        ['large']   = love.graphics.newFont('fonts/font.ttf', 32)
    }
    -- Inicializacion de texturas
    Texturas = {
        ['background'] = love.graphics.newImage('graphics/background.png'),
        ['main'] = love.graphics.newImage('graphics/breakout.png'),
        ['arrows'] = love.graphics.newImage('graphics/arrows.png'),
        ['hearts'] = love.graphics.newImage('graphics/lives.png'),
        ['particle'] = love.graphics.newImage('graphics/ball.png')
    }
    -- Inicializacion de sonidos
    Sonidos = {
        ['paddle-hit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
        ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
        ['wall-hit'] = love.audio.newSource('sounds/wall_hit.wav', 'static'),
        ['confirm'] = love.audio.newSource('sounds/confirm.wav', 'static'),
        ['select'] = love.audio.newSource('sounds/select.wav', 'static'),
        ['no-select'] = love.audio.newSource('sounds/no-select.wav', 'static'),
        ['brick-hit-1'] = love.audio.newSource('sounds/brick-hit-1.wav', 'static'),
        ['brick-hit-2'] = love.audio.newSource('sounds/brick-hit-2.wav', 'static'),
        ['hurt'] = love.audio.newSource('sounds/hurt.wav', 'static'),
        ['victory'] = love.audio.newSource('sounds/victory.wav', 'static'),
        ['recover'] = love.audio.newSource('sounds/recover.wav', 'static'),
        ['high-score'] = love.audio.newSource('sounds/high_score.wav', 'static'),
        ['pause'] = love.audio.newSource('sounds/pause.wav', 'static'),
        ['music'] = love.audio.newSource('sounds/music.wav', 'static')
    }
    -- Inicializacion de ventana
    Push:setupScreen(
        VIRTUAL_ANCHO,
        VIRTUAL_ALTO,
        VENTANA_ANCHO,
        VENTANA_ALTO, {
            fullscreen = false,
            resizable = true,
            vsync = true
    })
    -- Inicializacion de MaquinaEstado
    MaquinaEstadoGlobal = MaquinaEstado {
        ['start']   = function() return EstadoStart() end,
        ['play']   = function() return EstadoJugar() end
    }
    -- Configurar Estado Inicial
    MaquinaEstadoGlobal:cambiar('start')
    -- Tabla de teclas presionadas
    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    Push:resize(w, h)
end

function love.update(dt)
    -- Actualizar estado actual
    MaquinaEstadoGlobal:update(dt)
    -- Reiniciar teclas presionadas en cada frame
    love.keyboard.keysPressed = {}
end
-- Funcion para registrar tecla presionada
function love.keypressed(key)
    -- Registrar tecla presionada en Tabla
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end
-- Funcion para determinar si una tecla esta presionada
function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.draw()
    -- begin drawing with push, in our virtual resolution
    Push:start()
        love.graphics.draw(Texturas['background'], 0, 0)
        -- Dibujar Estado Actual
        MaquinaEstadoGlobal:render()
        -- display FPS for debugging; simply comment out to remove
        displayFPS()
    Push:finish()
end

function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(Fuentes['small'])
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
    love.graphics.setColor(1, 1, 1, 1)
end