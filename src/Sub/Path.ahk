﻿/************************************************************************
	ファイルパス関数群	(Path.ahk)

	DllCallにてAPIを使用 (\ ダメ文字対応)
   (上位からの引数に問題がない限り本関数内で新たに文字化けを起こすことはない筈)
	  グローバル変数 : なし
	  各関数の依存性 : なし(必要関数だけ切出してコピペでも使えます)

	AHKL Ver:		1.1.08.01
	Language:		Japanease
	Platform:		WinNT  IE 4以上 (SHLWAPI.DLL使用)
	Author: 		eamat.	  2008.01.30
 ************************************************************************
 2008.12.10
 2009.01.24  コメント修正
 2009.06.20  関数名修正   PathIs_Relative() → Path_IsRelative()
 2009.07.26  パラメータ修正 Path_Canonicalize()
 2009.10.22  SplitPath() 追加 (AHK本来の SplitPathコマンド互換)
 2012.08.20  UTF-8保存 暫定
 2012.11.08  Unicode対応 DllCall時の末尾A削除(A,W自動判別)
			 msvcrt.dll\_mbscpy廃止 UInt & → Str
			 MAX_PATH 260 → 520
*/


;=============================================================================
;	変換系
;=============================================================================

;---- パス名がスペースを含む時に""でくくる ---
Path_QuoteSpaces(path)	{
	DllCall("SHLWAPI.DLL\PathQuoteSpaces", Str, path)
	return path
}

;-----------------------------------------------------------
;  フルパス名から拡張子だけを変更したパス名を取得する
;	path	対象パス
;	ext 	変更する拡張子
;-----------------------------------------------------------
Path_RenameExtension(path,ext)	{
	ext := ("." != SubStr(ext,1,1)) ? "." ext : ext 	;"."がない時は付加
	DllCall("SHLWAPI.DLL\PathRenameExtension", Str,path, Str,ext)
	Return path
}
