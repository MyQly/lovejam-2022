-- state
-- LOVE Jam 2022
-- Theme: Earthquake

require ("gametitle")
require ("gameover")

--[[local state = {
	[1] = "GameTitle",
	[2] = "GameLoop",
	[3] = "GameOver"
}]]--

currentState = "GameTitle"
baseSpeed = 10
font = love.graphics.newFont("fnt/Kenney High Square.ttf", 40)
bigFont = love.graphics.newFont("fnt/Kenney High Square.ttf", 120)
love.graphics.setFont(font)

gameTime = 0

function ControlState(key, scancode, isrepeat)
	-- Handle Player Jump
	if scancode == "return" and currentState ~= "GameLoop" then 
			ResetGameState()
			currentState = "GameLoop"
	end
end

function RunState(baseSpeed, dt)
	-- UpdateParallaxLayers(layers, baseSpeed, dt)
	UpdateGround(ground, baseSpeed, dt)
	
	if currentState == "GameLoop" then
		UpdatePlayer(player, dt)
		UpdateObstacles(dt, baseSpeed)
		gameTime = gameTime + dt
	end

end

function DrawState()
	--love.graphics.setDefaultFilter("nearest", "nearest")
	-- love.graphics.print(currentState, 10, 0) -- DEBUG
	DrawGround(ground)
	if currentState == "GameTitle" then
		DrawGameTitle()
	end
	if currentState == "GameLoop" then
		love.graphics.print(gameTime, 10, 50)
		DrawPlayer(player)
		DrawObstacles()
	end
	if currentState == "GameOver" then
		DrawGameOver()
	end
end

function ResetGameState()
	InitPlayer(player, "gfx/player.png")
	InitObstacles()
	gameTime = 0
end