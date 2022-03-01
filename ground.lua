-- ground
-- LOVE Jam 2022
-- Theme: Earthquake

--local groundImage = love.graphics.newImage("gfx/fg1.png")
--local groundChunks = 10

-- Don't store image on each chunk since it's identical. Just load it once and draw it.
local groundChunk = {
--	solid = true,
	speed = 20,
--	image = love.graphics.newImage("gfx/fg1.png")
	startY = 624
}

ground = {
	[1] = {x = 0, y = groundChunk.startY},
	[2] = {x = 64, y =  groundChunk.startY},
	[3] = {x = 64*2, y =  groundChunk.startY},
	[4] = {x = 64*3, y =  groundChunk.startY},
	[5] = {x = 64*4, y =  groundChunk.startY},
	[6] = {x = 64*5, y =  groundChunk.startY},
	[7] = {x = 64*6, y =  groundChunk.startY},
	[8] = {x = 64*7, y =  groundChunk.startY},
	[9] = {x = 64*8, y =  groundChunk.startY},
	[10] = {x = 64*9, y =  groundChunk.startY},
	[11] = {x = 64*10, y =  groundChunk.startY},
	[12] = {x = 64*11, y =  groundChunk.startY},
	[13] = {x = 64*12, y =  groundChunk.startY},
	[14] = {x = 64*13, y =  groundChunk.startY},
	[15] = {x = 64*14, y =  groundChunk.startY},
	[16] = {x = 64*15, y =  groundChunk.startY},
	[17] = {x = 64*16, y =  groundChunk.startY},
	[18] = {x = 64*17, y =  groundChunk.startY},
	[19] = {x = 64*18, y =  groundChunk.startY},
	[20] = {x = 64*19, y =  groundChunk.startY},
	[21] = {x = 64*20, y =  groundChunk.startY}
}



function InitGroundFactory(t, image)
	--groundImage = love.graphics.newImage(image)
--	for i = 1, 10 do
--		table.insert(t,i,InitGroundChunk(i))
--	end
end

function InitGroundChunk(i)
--	chunk = groundChunk
--	chunk.x = chunk.x + i*128
--	return chunk
end

function UpdateGround(t, baseSpeed, dt)
	for chunk,value in pairs(ground) do --actualcode
   		ground[chunk].x = ground[chunk].x - baseSpeed*groundChunk.speed*dt
		if ground[chunk].x <= -64 then
			if chunk == 1 then
				ground[chunk].x = ground[21].x + 64
			else
				ground[chunk].x = ground[chunk-1].x+64
			end
			ground[chunk].y = groundChunk.startY
		end
		if ground[chunk].x <= 256 then -- 1280/4 - 64
			ground[chunk].y = ground[chunk].y + baseSpeed*6*dt
		end
	end
end

function DrawGround(t)
	-- love.graphics.rectangle("line", groundChunk.x, groundChunk[1], 64, 96)
	for chunk,value in pairs(t) do --actualcode
		love.graphics.rectangle("line", t[chunk].x, t[chunk].y, 64, 96)
	end
end