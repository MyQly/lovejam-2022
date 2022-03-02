-- player
-- LOVE Jam 2022
-- Theme: Earthquake

player = {}
--player.isJumping = false
--player.onGround = true

gravity = 5

function InitPlayer(t, image)
	t.x = 352 --1280/4+32
	t.y = 496 --720-96-128
	t.width = 64
	t.height = 128
	t.isJumping = false
	t.onGround = true
	t.image = love.graphics.newImage(image)
	t.jumpSpeed = 4
	t.yv = 0
	t.jumpSnd = love.audio.newSource("snd/jump.wav", "static")
	t.slidewidth = 128
	t.slideheight = 64
	t.isSliding = false
	t.slideTime = 3
	t.slideTimeLeft = 0
	t.hasDoubleJumped = false
end

function UpdatePlayer(t,dt)
	if t.y > 496 then --720-96-128
		t.y = 496
		t.isJumping = false
		t.onGround = true
		t.hasDoubleJumped = false
	end
	if t.isJumping and t.onGround == false then
		t.yv = t.yv - gravity*dt
		t.y = t.y - t.yv
	end

	if t.isSliding then
		t.slideTimeLeft = t.slideTimeLeft - 5*dt
		if t.slideTimeLeft <= 0 then
			t.isSliding = false
			t.slideTimeLeft = 0
		end
	end

	--[[
	if t.collides with obstacle
		gameover
	end
	]]--

end


function DrawPlayer(t)
	if player.isSliding then
		love.graphics.rectangle("fill", t.x-64, t.y+64, t.slidewidth, t.slideheight)
	else
		love.graphics.rectangle("fill", t.x, t.y, t.width, t.height)
	end
	-- love.graphics.draw(t.image,t.x,t.y)
end

function ControlPlayer(key, scancode, isrepeat)
		-- Handle Player Jump
	if scancode == "space" and player.isSliding == false then 
		if player.isJumping == false and player.onGround == true then
			player.isJumping = true
			player.onGround = false
			player.yv = player.jumpSpeed
			love.audio.play(player.jumpSnd)
		else 
			if player.hasDoubleJumped == false then
				player.yv = player.jumpSpeed
				love.audio.play(player.jumpSnd)
				player.hasDoubleJumped = true
			end
		end
	end

	if scancode == "lctrl" and player.isSliding == false and player.isJumping == false then
		player.isSliding = true
		player.slideTimeLeft = player.slideTime
	end
end