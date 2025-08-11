-- safety_hud.lua (para usar como script local)
-- Muestra en pantalla un contador de incidentes solo en carrera

local incident_count = 0
local sessionType

-- Callback que recibe información de sesión
function script.onSessionInfo(info)
    sessionType = info.type  -- "practice", "qualify", "race"
end

-- Callback genérico para registrar un incidente
local function registerIncident()
    if sessionType ~= "race" then return end
    incident_count = incident_count + 1
end

-- Ejemplo: conectarse a eventos reales (collision, offtrack, etc.)
function script.onCollision(data)
    registerIncident()
end

function script.onOfftrack(data)
    registerIncident()
end

-- HUD: dibuja el contador en pantalla
function script.update(dt)
    if sessionType == "race" then
        ui.drawText(10, 10, "Incidentes esta sesión: " .. incident_count)
    end
end

function script.update(dt)
    ui.drawText(10, 10, "SCRIPT ACTIVO")
end