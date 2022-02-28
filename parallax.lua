-- parallax
-- LOVE Jam 2022
-- Theme: Earthquake

function InitParallaxLayer(t, speed, image, x, y)
	--love.graphics.setDefaultFilter("nearest", "nearest")
	t.speed = speed
	t.image = love.graphics.newImage(image)
	t.x = x
	t.y = y
end

function UpdateParallaxLayers(t, baseSpeed, dt)
	-- Cool, found reference on https://stackoverflow.com/questions/13081620/for-each-loop-in-a-lua-table-with-key-value-pairs
	-- Updated to take a table of my laters and then get to the actual values. 
	for layer,value in pairs(t) do --actualcode
   		t[layer].x = t[layer].x - baseSpeed*t[layer].speed*dt
   		if t[layer].x <= -160 then
   			t[layer].x = 0
   		end
	end
end

function DrawParallaxLayers(t)
	for layer,value in pairs(t) do --actualcode
   		love.graphics.draw(t[layer].image,t[layer].x,t[layer].y)
	end
end