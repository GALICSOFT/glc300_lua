
function Lua_Create()

	Lsys.ScriptFile( 1, "main.lua")

	Lsys.SetClearColor("0xFFFFFFFF")
	Lsys.ShowCursor(1)
	Lsys.ShowState(1)
	Lsys.ConsoleSet(0)

	return Lsys.CreateWindow(-1, -1, 480, 320, "GalicSoft. Inc / 2011-1", 0)
end


function Lua_Init()
	g_Font = {}
	g_Font[1] = Lfont.New("seoul_hangang_l08.ttf", 24)

	Lfont.Scale(g_Font[1], 1.0, 1.0);


	return 0
end


function Lua_Destroy()

	return 0
end


function Lua_FrameMove()
	return 0
end



function Lua_Render()

-- ����(Rect)
--	(x,y)
--	+------+
--	|      |
--	|      |
--	|      |
--	+------+ (r,b)

	local x	-- ���� x
	local y	-- ���� y
	local r	-- �� r
	local b	-- �� b

	Lfont.Setup(g_Font[1], "�ȳ��ϼ��� �ݰ����ϴ�", 5, 50, 0, "0xFF00FFFF")

	-- ������ 4���� ���� ��ȯ
	-- �ε����� -1�̸� ��ü ������ ��ȯ�ϸ�
	-- �� �ε����� �ش� ������ ��ȯ
	-- ���� ū �� �뷫 10000�� ������ ���� ���� �ִ� ������ ��ȯ��

	local index = 2
	x, y, r, b = Lfont.Rect(g_Font[1], index)

	count = Lfont.Count(g_Font[1])
	idx = -1
	Lfont.Draw(g_Font[1])
	Lfont.Draw(g_Font[1], idx, x, y + 15, "0XFF0000FF")
	Lfont.Draw(g_Font[1], idx, r, y + 45, "0XFF0000FF")

	return 0
end

