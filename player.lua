-- player
-- LOVE Jam 2022
-- Theme: Earthquake

player = {}
--player.isJumping = false
--player.onGround = true

gravity = 5

function InitPlayer(t, image)
	t.x = 352 --1280/4+32
	t.y = 560 --720-96-64
	t.isJumping = false
	t.onGround = true
	t.image = love.graphics.newImage(image)
	t.jumpSpeed = 4
	t.yv = 0
end

function UpdatePlayer(t,dt)
	if t.y > 560 then --720-96-64
		t.y = 560
		t.isJumping = false
		t.onGround = true
	end
	if t.isJumping and t.onGround == false then
		t.yv = t.yv - gravity*dt
		t.y = t.y - t.yv
	end
end


function DrawPlayer(t)
	love.graphics.rectangle("fill", t.x, t.y, 64, 64)
	-- love.graphics.draw(t.image,t.x,t.y)
end