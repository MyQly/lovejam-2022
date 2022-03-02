-- obstacles

local obstacles = {}
local obstacle = {}
obstacle.type = nil
obstacle.speed = 20 -- Same as ground, maybe faster for flying type.
obstacle.max = 3
obstacle.current = 0
obstacle.x = 1280 + 200 -- subject to change
obstacle.y = 600 -- should be different for ground obstacles

function UpdateObstacles(dt)
	if obstacle.current < obstacle.max then
		-- generate an obstacle in the obstacles table
	end
	if obstacle.x < -200 then
		-- delete obstacle from the obstacles table
		obstacle.current = obstacle.current - 1
	end
end

function DrawObstacles()
end

function GenerateObstacle()
	obs = obstacle
	return obs
end