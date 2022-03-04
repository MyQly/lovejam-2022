-- main
-- LOVE Jam 2022
-- Theme: Earthquake

require "conf"
require "state"
require "parallax"
require "player"
require "ground"
require "obstacles"

delta = nil

--[[
bg3.speed = 1 -- This is the same as bg3["speed"] = 1
bg2.speed = 2
bg1.speed = 3
fg1.speed = 5
]]--

--local bg3 = {} --love.graphics.newImage("gfx/bg3.png"),100,0}
--local bg2 = {} --love.graphics.newImage("gfx/bg2.png"),100,26}
--local bg1 = {} --love.graphics.newImage("gfx/bg1.png"),100,60}
-- local fg1 = {} --love.graphics.newImage("gfx/fg1.png"),100,74}

--layers = {bg3, bg2, bg1}

function love.load()
	-- InitParallaxLayer(bg3, 1, "gfx/bg3.png", 0, 0)
	-- InitParallaxLayer(bg2, 2, "gfx/bg2.png", 0, 16)
	-- InitParallaxLayer(bg1, 3, "gfx/bg1.png", 0, 32)

	--	InitGroundFactory(ground, "gfx/fg1.png")

	InitPlayer(player, "gfx/player.png")

	--love.graphics.setBackgroundColor( .5, .7, 1, 0 )
end

function love.update(dt)
	if love.window.hasFocus() then
		RunState(baseSpeed, dt)
	end
end

function love.draw() 
	if love.window.hasFocus() then
		-- love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 0)
		--  DrawParallaxLayers(layers)
		DrawState()
	end
end

function love.keypressed( key, scancode, isrepeat )
	if scancode == "escape" then
		love.event.quit()
	end
	ControlState(key, scancode, isrepeat)
	ControlPlayer(key, scancode, isrepeat)
end

function love.quit()
	return false
end