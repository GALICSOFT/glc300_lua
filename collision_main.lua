
-- game data -------------------------------------------------------------------

-- texture list
g_tex ={}

--sprite collector
g_spc= {}

-- rendering and system data ---------------------------------------------------

-- Window System
g_window ={
			x = -1, y = -1						-- center position -1, -1
			, w = 800, h = 480					-- dc size 800 * 480
			, cls ="GALICSOFT INC"				-- class name
			, full=0							-- screen window mode
			}


-- setup the game system -------------------------------------------------------
function Lua_Create()

	Lsys.ScriptFile(1, "main.lua")			-- setup the lua script file

	Lsys.SetClearColor("0xFF006699")			-- clear color A, R, G, B
	Lsys.ShowCursor(1)							-- show? mouse cursor
	Lsys.ShowState(1)							-- show? system state
	Lsys.ConsoleSet(0)							-- console mode for d3d

	Lsys.CreateWindow(g_window.x, g_window.y	-- window position for pc
					, g_window.w, g_window.h	-- window dc size
					, g_window.cls				-- window class and title
					, g_window.full				-- full mode for d3d
					)

	return 0
end -- Lua_Create




-- Initialize ... --------------------------------------------------------------
function Lua_Init()

	return 0
end -- Lua_Init




-- Release ... -----------------------------------------------------------------
function Lua_Destroy()

	return 0
end -- Lua_Destroy




-- Update data ... -------------------------------------------------------------
function Lua_FrameMove()

	local center1x = 214.0
	local center1y = 100.0
	local a1       = -0.12
	local w1       = 200.0
	local h1       = 100.0

	local center2x = 452.0
	local center2y = 230.0
	local a2       =  0.88
	local w2       = 350.0
	local h2       = 80.00


	if true == Collision2DRect(center1x, center1y, a1, w1, h1
							 , center2x, center2y, a2, w2, h2) then
		print("충돌\n")
	end

	return 0
end -- Lua_FrameMove




-- Rendering ... ---------------------------------------------------------------
function Lua_Render()

	-- test for performance


	return 0
end -- Lua_Render



--Rotation ------------------------------------------------------------

function ToRadian(v)

	return v* 0.017453292
end



--Collision 2D OBB ------------------------------------------------------------

function Collision2DRect(center1x, center1y, a1, w1, h1,
						 center2x, center2y, a2, w2, h2)
	local	rc1={}
	local	rc2={}

	local	D={x=0, y=0}
	local	K={x=0, y=0}

	local	i=0
	local	j=0

	local	det = 1
	local	xx = 0
	local	yy = 0

	local	cosT1 = math.cos(a1)
	local	sinT1 = math.sin(a1)
	local	cosT2 = math.cos(a2)
	local	sinT2 = math.sin(a2)


	rc1[1] = {x = -w1 * 0.5,  y = -h1 * 0.5}
	rc1[2] = {x =  w1 * 0.5,  y = -h1 * 0.5}
	rc1[3] = {x =  w1 * 0.5,  y =  h1 * 0.5}
	rc1[4] = {x = -w1 * 0.5,  y =  h1 * 0.5}

	rc2[1] = {x = -w2 * 0.5,  y = -h2 * 0.5}
	rc2[2] = {x =  w2 * 0.5,  y = -h2 * 0.5}
	rc2[3] = {x =  w2 * 0.5,  y =  h2 * 0.5}
	rc2[4] = {x = -w2 * 0.5,  y =  h2 * 0.5}


	-- 중심점 회전, 이동
	for i=1, 4 do
		xx = rc1[i].x
		yy = rc1[i].y

		rc1[i].x = cosT1 *xx - sinT1 *yy + center1x
		rc1[i].y = sinT1 *xx + cosT1 *yy + center1y

		xx = rc2[i].x
		yy = rc2[i].y

		rc2[i].x = cosT2 *xx - sinT2 *yy + center2x
		rc2[i].y = sinT2 *xx + cosT2 *yy + center2y
	end


	--memcpy(g_rc1, rc1, sizeof(rc1) );
	--memcpy(g_rc2, rc2, sizeof(rc2) );


	for i=1, 4 do
		D.y = -rc1[i].x + rc1[1+ (i+2)%4].x
		D.x =  rc1[i].y - rc1[1+ (i+2)%4].y


		det = 1

		for j=1, 4 do
			K.x = rc2[j].x - rc1[i].x
			K.y = rc2[j].y - rc1[i].y

			if 0 >= D.x * K.x + D.y * K.y then
				det =0
				break
			end

		end


		if 1== det then return false end



		D.y = -rc2[i].x + rc2[1+ (i+2)%4].x
		D.x =  rc2[i].y - rc2[1+ (i+2)%4].y


		det = 1

		for j=1, 4 do
			K.x = rc1[j].x - rc2[i].x
			K.y = rc1[j].y - rc2[i].y

			if 0 >= D.x * K.x + D.y * K.y then
				det =0
				break
			end

		end


		if 1== det then return false end

	end -- for


	return true
end


