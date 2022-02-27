-- main
-- LOVE Jam 2022
-- Theme: Earthquake

require "conf"
require "parallax"
require "player"

local posX, posY
local isJumping = false
local onGround = true

local gravity = 5
local baseSpeed = 10
local bg3 = {} --love.graphics.newImage("gfx/bg3.png"),100,0}
local bg2 = {} --love.graphics.newImage("gfx/bg2.png"),100,26}
local bg1 = {} --love.graphics.newImage("gfx/bg1.png"),100,60}
local fg1 = {} --love.graphics.newImage("gfx/fg1.png"),100,74}

--[[
bg3.speed = 1 -- This is the same as bg3["speed"] = 1
bg2.speed = 2
bg1.speed = 3
fg1.speed = 5
]]--

local layers = {bg3, bg2, bg1, fg1}
local player = {}

local groundChunk = {
	x = 0,
	y = 0,
	solid = true
}
local ground = {}

local scale = 8

function love.load()
	posX = 100 --1280/8
	posY = 74 --720/8

	CreateParallaxLayer(bg3, 1, "gfx/bg3.png", 100, 0)
	CreateParallaxLayer(bg2, 2, "gfx/bg2.png", 100, 26)
	CreateParallaxLayer(bg1, 3, "gfx/bg1.png", 100, 60)
	CreateParallaxLayer(fg1, 5, "gfx/fg1.png", 100, 74)
	love.graphics.setBackgroundColor( .5, .7, 1, 1 )
	love.graphics.setDefaultFilter("nearest", "nearest")

end

-- This is really repetitive. Refactor later for readability time permitting.
function love.update(dt)
	UpdateParallaxLayers(layers, baseSpeed, dt)
	--updateParallax(bg2, dt)
	--updateParallax(bg1, dt)
	--updateParallax(fg1, dt)
end

function love.draw()
	--love.graphics.setDefaultFilter("nearest")

	love.graphics.scale(scale,scale)
	DrawParallaxLayers(layers)
	--[[
	love.graphics.draw(bg3.image,bg3.x,bg3.y)
	love.graphics.draw(bg2.image,bg2.x,bg2.y)
	love.graphics.draw(bg1.image,bg1.x,bg1.y)
	love.graphics.draw(fg1.image,fg1.x,fg1.y)
	]]--
	--[[
	love.graphics.rectangle("fill", bg3[3],bg3[4], 16,16)
	love.graphics.rectangle("fill", bg2[3],bg2[4], 16,16)
	love.graphics.rectangle("fill", bg1[3],bg1[4], 16,16)
	love.graphics.rectangle("fill", fg1[3],fg1[4], 16,16)
	]]--
end

function love.keypressed( key, scancode, isrepeat )
	if scancode == "escape" then
		love.event.quit()
	end
	-- Handle Player Jump
	if scancode == "space" then
		isJumping = true
		onGround = false
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