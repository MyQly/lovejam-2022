-- main
-- LOVE Jam 2022
-- Theme: Earthquake

require "conf"

local posX, posY
local isJumping = false
local gravity = .5
local baseSpeed = .125
local bg3 = {1,"",100,14}
local bg2 = {2,"",100,34}
local bg1 = {4,"",100,54}
local fg1 = {8,"",100,74}

function love.load()
	posX = 100 --1280/8
	posY = 74 --720/8
end

-- This is really repetitive. Refactor later for readability time permitting.
function love.update(dt)
	bg3[3] = bg3[3] - baseSpeed*bg3[1]
	bg2[3] = bg2[3] - baseSpeed*bg2[1]
	bg1[3] = bg1[3] - baseSpeed*bg1[1]
	fg1[3] = fg1[3] - baseSpeed*fg1[1]
end

function love.draw()
	love.graphics.scale(8,8)
	love.graphics.rectangle("fill", bg3[3],bg3[4], 16,16)
	love.graphics.rectangle("fill", bg2[3],bg2[4], 16,16)
	love.graphics.rectangle("fill", bg1[3],bg1[4], 16,16)
	love.graphics.rectangle("fill", fg1[3],fg1[4], 16,16)
end

function love.keypressed( key, scancode, isrepeat )
	if scancode == "escape" then
		love.event.quit()
	end
--[[   local dx, dy = 0, 0
   if scancode == "d" then -- move right
      dx = 1
   elseif scancode == "a" then -- move left
      dx = -1
   elseif scancode == "s" then -- move down
      dy = 1
   elseif scancode == "w" then -- move up
      dy = -1
   end
   move (dx, dy) -- need to be some function to move the active object
]]--
end

function love.quit()
	return false
end