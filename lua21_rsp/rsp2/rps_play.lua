


function GamePlayFrameMove()

	local s_buf = nil
	local play = 0



	if   30 < g_mouse_x and g_mouse_x <130 and
		330 < g_mouse_y and g_mouse_y <450 then

		if g_mouse_e == KEY_DOWN then
			play = 1

			g_handCom = Laux.Rand(3)
			g_handUsr = PLAY_R

			s_buf = nil
			s_buf = string.format("[User, Computer]:%d %d\n", g_handUsr, g_handCom)
			print(s_buf)
		end
	end


	if  170 < g_mouse_x and g_mouse_x <260 and
		330 < g_mouse_y and g_mouse_y <450 then

		if g_mouse_e == KEY_DOWN then
			play = 1

			g_handCom = Laux.Rand(3)
			g_handUsr = 2

			s_buf = nil
			s_buf = string.format("[User, Computer]:%d %d\n", g_handUsr, g_handCom)
			print(s_buf)
		end
	end

	if  290 < g_mouse_x and g_mouse_x <400 and
		330 < g_mouse_y and g_mouse_y <450 then

		if g_mouse_e == KEY_DOWN then
			play = 1

			g_handCom = Laux.Rand(3)
			g_handUsr = 3

			s_buf = nil
			s_buf = string.format("[User, Computer]:%d %d\n", g_handUsr, g_handCom)
			print(s_buf)
		end
	end


	if 0 < g_handUsr and 0 < play  then
		-- ����
		if     g_handUsr == PLAY_R then
			if g_handCom == PLAY_R then
				Lfont.String(g_fntMsg, "[����(��) - ����(��)]: �����ϴ�. �ٽ��մϴ�.")

			elseif g_handCom == PLAY_S then
				g_score = g_score + 1000

				s_buf = nil
				s_buf = string.format("%d", g_score)
				Lfont.String(g_fntScore, s_buf)
				Lfont.String(g_fntMsg, "[����(��) - ����(��)]: ����� �̰���ϴ�.")

			else
				g_win = -1
				Lfont.String(g_fntMsg, "[����(��) - ��(��)]: ������.")
			end

		-- ����
		elseif g_handUsr == PLAY_S then

			if g_handCom == PLAY_R then
				g_win = -1
				Lfont.String(g_fntMsg, "[����(��) - ����(��)]: ������.")

			elseif g_handCom == PLAY_S then
				Lfont.String(g_fntMsg, "[����(��) - ����(��)]: �����ϴ�. �ٽ��մϴ�.")
			else
				g_score = g_score + 1000

				s_buf = nil
				s_buf = string.format("%d", g_score)
				Lfont.String(g_fntScore, s_buf)
				Lfont.String(g_fntMsg, "[����(��) - ��(��)]: ����� �̰���ϴ�.")
			end

		-- ��
		elseif g_handUsr == PLAY_P then
			if g_handCom == PLAY_R then

				print "[��(��) - ����(��)]: ����� �̰���ϴ�.\n"
				g_score = g_score + 1000

				s_buf = nil
				s_buf = string.format("%d", g_score)
				Lfont.String(g_fntScore, s_buf)
				Lfont.String(g_fntMsg, "[��(��) - ����(��)]: ����� �̰���ϴ�.")

			elseif g_handCom == PLAY_S then
				g_win = -1
				Lfont.String(g_fntMsg, "[��(��) - ����(��)]: ������.")
			else
				Lfont.String(g_fntMsg, "[��(��) - ��(��)]: �����ϴ�. �ٽ��մϴ�.")
			end
		end
	end


	if 0 == g_win and g_mouse_e == KEY_DOWN then
		g_gamePhase = GAMEPHASE_BEGIN
		InitGameData()
	end

	if 0 >	g_win then
		g_win = 0
	end

end



function GamePlayRender()

	local UI_SCORE     = 3
	local UI_ROCK_S    = 4
	local UI_SCISSOR_S = 5
	local UI_PAPER_S   = 6

	local st_tx

	st_tx = g_uibg[1];				Ltex.Draw( st_tx.n, st_tx.x, st_tx.y, 0)
	st_tx = g_uibg[UI_SCORE];		Ltex.Draw( st_tx.n, st_tx.x, st_tx.y, 0)


	if 0 < g_win then

		st_tx = g_uibtn[UI_ROCK_S]
		if   30 < g_mouse_x and g_mouse_x <130 and
			330 < g_mouse_y and g_mouse_y <450 then

			Ltex.Draw( st_tx.o, st_tx.x, st_tx.y, 0)
		else
			Ltex.Draw( st_tx.n, st_tx.x, st_tx.y, 0)
		end

		st_tx = g_uibtn[UI_SCISSOR_S]
		if  170 < g_mouse_x and g_mouse_x <260 and
			330 < g_mouse_y and g_mouse_y <450 then

			Ltex.Draw( st_tx.o, st_tx.x, st_tx.y, 0)
		else
			Ltex.Draw( st_tx.n, st_tx.x, st_tx.y, 0)
		end

		st_tx = g_uibtn[UI_PAPER_S]
		if  290 < g_mouse_x and g_mouse_x <400 and
			330 < g_mouse_y and g_mouse_y <450 then
			Ltex.Draw( st_tx.o, st_tx.x, st_tx.y, 0)
		else
			Ltex.Draw( st_tx.n, st_tx.x, st_tx.y, 0)
		end
	end




	Lfont.Draw(g_fntScore)



	if 0 > g_handUsr then
		return
	end

	st_tx = g_tex[g_handUsr];		Ltex.Draw( st_tx.n, st_tx.x, st_tx.y, 0)
	st_tx = g_tex[g_handCom+3];		Ltex.Draw( st_tx.n, st_tx.x, st_tx.y, 0)

	
	Lfont.Draw(g_fntMsg)

end

