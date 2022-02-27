-- main
-- LOVE Jam 2022
-- Theme: Earthquake

require "conf"

local posX, posY
local baseSpeed = .125
local bg3 = {1,""}
local bg2 = {2,""}
local bg1 = {3,""}
local fg1 = {6,""}

function love.load()
	posx = 100 --1280/8
	posy = 10 --720/8
end

function love.update(dt)
	posx = posx - baseSpeed*bg2[1]
end

function love.draw()
	love.graphics.set
	love.graphics.scale(8,8)
	love.graphics.rectangle("fill", posx,posy, 16,16)
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