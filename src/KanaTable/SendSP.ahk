﻿; 特別出力
SendSP(strIn, ctrlName)	; (strIn: String, ctrlName: String) -> Void
{
	global koyuNumber, version, layoutName, layoutNameE, iniFilePath
		, lastSendTime

	SetKeyDelay, -1, -1

	If (ctrlName == "ESCx3")
		SendESCx3()
	Else If (ctrlName == "そのまま")
	{
		Send, % strIn
		lastSendTime := QPC()	; 出力した時間を記録
	}
	Else If (ctrlName == "横書き")
		ChangeVertical(0)
	Else If (ctrlName == "縦書き")
		ChangeVertical(1)
	; 固有名詞ショートカットを切り替える
	Else If (ctrlName == "KoyuChange")
	{
		; 番号が変わらない時
		If (strIn == koyuNumber)
		{
			MsgBox, , , 固有名詞セット%koyuNumber%
			Return
		}
		MsgBox, 1, , 固有名詞 セット%koyuNumber% → %strIn%
		; キャンセル
		IfMsgBox, Cancel
			Return

		koyuNumber := strIn
		; 設定ファイル書き込み
		IniWrite, %koyuNumber%, %iniFilePath%, Naginata, KoyuNumber
		; ツールチップを変更する
		If (layoutNameE)
			Menu, TRAY, Tip, Hachiku %version%`n%layoutNameE%`n+ %layoutName%`n固有名詞セット%koyuNumber%
		Else
			Menu, TRAY, Tip, Hachiku %version%`n%layoutName%`n固有名詞セット%koyuNumber%

		; 固有名詞ショートカットの読み込み・登録
		KoyuReadAndRegist(koyuNumber)
		; 出力確定する定義に印をつける
		SettingLayout()
	}
	; その他、未定義のもの。念のため。
	Else
		SendEachChar(strIn)
}

SendESCx3()	; () -> Void
{
	global	usingKeyConfig, goodHwnd, lastSendTime, keyDriver
;	local hwnd		; Int型
;		, class		; String型
;		, process	; String型
;		, imeName	; String型
;		, delay		; Int型
;		, IME_Get_Interval				; Int型
;		, IME_GetConverting_Interval	; Int型

	WinGet, hwnd, ID, A
	WinGetClass, class, ahk_id %hwnd%
	WinGet, process, ProcessName, ahk_id %hwnd%
	imeName := DetectIME()

	; Shift+Ctrl+無変換 のキー設定利用して良いか
	; (秀丸エディタ、あるいはPC-9801キーボードでは使えないので除外)
	If (usingKeyConfig
	 && imeName != "OldMSIME" && imeName != "NewMSIME"
	 && class != "Hidemaru32Class" && keyDriver != "kbdnec.dll")
	{
		Send, +^{vk1D 2}	; ※ Shift+Ctrl+無変換
		lastSendTime := QPC()	; 出力した時間を記録
	}
	; IME窓検出が当てになる時(入力中のかながないのと変換1回目の区別がつく)
	Else If (hwnd == goodHwnd)
	{
		; Send から IME_GET() までに Sleep で必要な時間(ミリ秒)
		IME_Get_Interval := 40
		; Send から IME_GetConverting() までに Sleep で必要な時間(ミリ秒)
		IME_GetConverting_Interval := (imeName == "Google" ? 30
			: (imeName == "OldMSIME" || imeName == "CustomMSIME" ? 100 : 70))

		delay := IME_Get_Interval - Floor(QPC() - lastSendTime)
		; 時間を空けてIME検出へ
		If (delay > 0)
			Sleep, % delay
		;　IME ONだが、無変換ではない
		If (IME_GET() && IME_GetSentenceMode())
		{
			; 時間を空けてIME窓検出へ
			delay := IME_GetConverting_Interval - Floor(QPC() - lastSendTime)
			If (delay > 0)
				Sleep, % delay
			Loop, 5 {
				If (!IME_GetConverting())
					; IME窓がなければループ終了
					Break
				Send, {Esc}
				lastSendTime := QPC()	; 出力した時間を記録
				Sleep, % IME_GetConverting_Interval
			}
		}
	}
	; その他
	Else
	{
		Send, {Esc 5}
		; 一太郎のメニューを消す
		If (SubStr(process, 1, 4) = "Taro")
		{
			Sleep, 500
			IfWinActive, ahk_class #32770
				Send, a
		}
		lastSendTime := QPC()	; 出力した時間を記録
	}
}
