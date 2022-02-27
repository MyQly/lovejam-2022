-- parallax
-- LOVE Jam 2022
-- Theme: Earthquake

function createParallaxLayer(t, speed, image, x, y)
	t.speed = speed
	t.image = love.graphics.newImage(image)
	t.x = x
	t.y = y
end

function updateParallaxLayers(t, baseSpeed, dt)
	-- Cool, found reference on https://stackoverflow.com/questions/13081620/for-each-loop-in-a-lua-table-with-key-value-pairs
	-- Updated to take a table of my laters and then get to the actual values. 
	for key,value in pairs(t) do --actualcode
   		t[key].x = t[key].x - baseSpeed*t[key].speed*dt
	end
end

function drawParallaxLayers(t)
	for key,value in pairs(t) do --actualcode
   		love.graphics.draw(t[key].image,t[key].x,t[key].y)
	end
end