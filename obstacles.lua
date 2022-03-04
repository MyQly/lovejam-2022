-- obstacles
-- LOVE Jam 2022
-- Theme: Earthquake

local obstacles = {}
local obstacle = {}
obstacle.type = nil -- regular, tall or floating
obstacle.speed = 40 -- Same as ground, maybe faster for flying type.
obstacle.max = 3
obstacle.current = 0
obstacle.x = 1280 + 200 -- subject to change
obstacle.y = 496 -- should be different for ground obstacles
obstacle.delay = 3 -- time which should pass between obstacles (so we don't have 2/3 right together)
obstacle.lastType = nil -- notes what the last obstacle generated was so we won't have 2 in a row.

--[[
	[1] = {x = 1400, y = 496, w = 128, h = 128}, -- short
	[2] = {x = 1800, y = 368, w = 128, h = 256}, -- tall
	[3] = {x = 2200, y = 416, w = 128, h = 128}  -- floating
]]--

obstacles = {}

-- table.insert(obstacles, {1480, 496, false}) -- 496 on the ground, 396 floats

function UpdateObstacles(dt, baseSpeed)
	if obstacle.current < obstacle.max then
		-- generate an obstacle in the obstacles table
		-- GenerateObstacle()
	end

	for obs,value in pairs(obstacles) do --actualcode

		if (CheckForCollision(obstacles[obs])) then
			currentState = "GameOver"
		end

		obstacles[obs].x = obstacles[obs].x - obstacle.speed*baseSpeed*dt
		if obstacles[obs].x <= 192 then -- 1280/4 - 64
			obstacles[obs].y = obstacles[obs].y - baseSpeed*24*dt
		end

		if obstacles[obs].x <= -200 then
			-- delete obstacle from the obstacles table
			obstacles[obs].x = 1400
			-- obstacles[obs].y = 496
			obsType = love.math.random(1,3)
			while(obsType == obstacles.lastType)
				do
   				obsType = love.math.random(1,3)
			end
			--obsType = love.math.random(1,3)
			obstacle.lastType = obsType
			obstacles[obs].t = obsType
			if obstacles[obs].t == 1 then
				obstacles[obs].h = 128
				obstacles[obs].y = 496
			elseif obstacles[obs].t == 2 then
				obstacles[obs].h = 256
				obstacles[obs].y = 368		
			else
				obstacles[obs].h = 128
				obstacles[obs].y = 416			
			end

			obstacles[obs].t = obsType
		end

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
	love.graphics.setColor( 255, 0, 0, 1 )
	for obs,value in pairs(obstacles) do --actualcode
		love.graphics.rectangle("fill", obstacles[obs].x, obstacles[obs].y, obstacles[obs].w, obstacles[obs].h)
	end
	-- love.graphics.rectangle("fill", obstacles[1][1], obstacles[1][2], 128, 128)
	--if obstacles[1][3] == true then
	--	love.graphics.print(table.maxn(obstacles))
	--end
	love.graphics.setColor( 255, 255, 255, 1)
end

--function GenerateObstacle()
	--
	--table.insert(obstacles, {1480, 496, false}) -- 496 on the ground, 396 floats
	--table.insert(obstacles, {1500, 296, false}) -- 496 on the ground, 396 floats
	--table.insert(obstacles, {1480, 496, false}) -- 496 on the ground, 396 floats
--end

function CheckForCollision(obs)
		if obs.t == 1 or obs.t == 2 then
			-- test horizontal first (if fails move on)
			if (obs.x <= player.x and obs.x+obs.w >= player.x) or (obs.x <= player.x+player.width and obs.x+obs.w >= player.x+player.width) then --we caught either the top-left or top-right corner
				if (obs.y <= player.y+player.height and obs.y+obs.h >= player.y+player.height) then -- just test for the bottom
					return true
				end
			end
		else
			if (obs.x <= player.x and obs.x+obs.w >= player.x) or (obs.x <= player.x+player.width and obs.x+obs.w >= player.x+player.width) then --we caught either the top-left or top-right corner
				if (obs.y <= player.y+player.height and obs.y+obs.h >= player.y+player.height) or (obs.y <= player.y and obs.y+obs.h >= player.y) then -- test for top & bottom
					return true
				end
			end
		end
		return false
end

function InitObstacles()
	obstacles = {
		[1] = {x = 1400, y = 496, w = 128, h = 128, t=1}, -- short
		[2] = {x = 1900, y = 368, w = 128, h = 256, t=2}, -- tall
		[3] = {x = 2400, y = 416, w = 128, h = 128, t=3}  -- floating
	}
end