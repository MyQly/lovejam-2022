-- obstacles

local obstacles = {}
local obstacle = {}
obstacle.type = nil -- regular, tall or floating
obstacle.speed = 20 -- Same as ground, maybe faster for flying type.
obstacle.max = 3
obstacle.current = 0
obstacle.x = 1280 + 200 -- subject to change
obstacle.y = 496 -- should be different for ground obstacles
obstacle.delay = 3 -- time which should pass between obstacles (so we don't have 2/3 right together)

obstacles = {
	[1] = {x = 1400, y = 496, w = 128, h = 128},
	[2] = {x = 2200, y = 368, w = 128, h = 256},
	[3] = {x = 3000, y = 432, w = 128, h = 128}
}

-- table.insert(obstacles, {1480, 496, false}) -- 496 on the ground, 396 floats

function UpdateObstacles(dt)
	if obstacle.current < obstacle.max then
		-- generate an obstacle in the obstacles table
		-- GenerateObstacle()
	end

	for obs,value in pairs(obstacles) do --actualcode
		obstacles[obs].x = obstacles[obs].x - obstacle.speed*20*dt
	end

	
	if obstacle.x < -200 then
		-- delete obstacle from the obstacles table
		obstacle.current = obstacle.current - 1
	end
	--[[
		update ground obstacles to fall like the ground. Add a counter-clockwise rotation/tumble
	]]--

	--[[ do not compute collisions after the objects have moved behind the player ]]--
	--[[if obstacles[1][1] <= player.x+player.width and obstacles[1][1]+128 >= player.x+player.width then
		obstacles[1][3] = true
	else
		obstacles[1][3] = false
	end]]--
end

function DrawObstacles()
	for obs,value in pairs(obstacles) do --actualcode
		love.graphics.rectangle("line", obstacles[obs].x, obstacles[obs].y, obstacles[obs].w, obstacles[obs].h)
	end
	-- love.graphics.rectangle("fill", obstacles[1][1], obstacles[1][2], 128, 128)
	if obstacles[1][3] == true then
		love.graphics.print(table.maxn(obstacles))
	end
end

function GenerateObstacle()
	--
	--table.insert(obstacles, {1480, 496, false}) -- 496 on the ground, 396 floats
	table.insert(obstacles, {1500, 296, false}) -- 496 on the ground, 396 floats
	--table.insert(obstacles, {1480, 496, false}) -- 496 on the ground, 396 floats
end