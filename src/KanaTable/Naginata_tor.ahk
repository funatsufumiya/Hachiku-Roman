﻿; 薙刀式配列2022年11月20日付v15新候補版 から改造
; **********************************************************************
; 【薙刀式】「から」＝「ぶ」化けを解消する解
; http://oookaworks.seesaa.net/article/488841086.html#gsc.tab=0
; (2022年6月12日)より
; 【薙刀式】新候補版とB1版の決勝戦？
; http://oookaworks.seesaa.net/article/494282239.html#gsc.tab=0
; (2022年12月1日)より 配列
;
; 【薙刀式】固有名詞モードのバインドを検討中
; http://oookaworks.seesaa.net/article/490310455.html#gsc.tab=0
; (2022年08月03日)
; 【薙刀式】薙刀式アルペジオ漢直というのを思いついた
; http://oookaworks.seesaa.net/article/492843479.html#gsc.tab=0
; (2022年10月25日)より 固有名詞ショートカットのキー
;
; 【薙刀式】句点確定にもう慣れた
; http://oookaworks.seesaa.net/article/493333195.html#gsc.tab=0
; (2022年11月09日)より 句点確定
;
; 【薙刀式】編集モードをテキストだけで説明してみる
; http://oookaworks.seesaa.net/article/493626506.html#gsc.tab=0
; (2022年11月20日)より 編集モード
;
; DvorakJ版からの変更部分：
;	記号はすべて全角文字を出力する
;	編集モードD+F+H、J+K+Q、J+K+G、J+K+V、J+K+Bは変換中かどうかを問わない
;	切り取りと貼り付けを使う編集モードの前後で、クリップボードの内容を保つ
;	固有名詞ショートカットの発動キーを変更	第一面：T、Y 第二面：RT、YU
;	固有名詞ショートカットを最大５組を切り替えられる。切り替えは T+1 で１番、T+2 で２番、など。
;	Q+W に横書きモード、Q+A に縦書きモード を割り当て
; **********************************************************************

#Include %A_ScriptDir%/KanaTable/StandardLayout.ahk	; キーボード初期配列
;#Include %A_ScriptDir%/KanaTable/WorkmanLayout.ahk	; Workman配列

; ----------------------------------------------------------------------
; 英数／かな配列の定義ファイル 【すべて縦書き用で書くこと】
;
; 例：	SetKana( KC_Q | KC_L | KC_SPC		,"xwa"	, R)	; (ゎ)
;		~~~~~~~  ~~~~~~~~~~~~~~~~~~~~		  ~~~	  ~ 	  ~~~~
;		かな定義	スペース+Q+L	   縦書き用の出力 ↑	コメント
;													  ｜
			;						リピートあり(省略はリピートなし)
;
; 例：	 SetEisu( KC_H | KC_J			,"{vkF2 2}" )		; IME ON
;		 ~~~~~~~
;		 英数定義
;
;	※再読み込みか、再起動で有効になります
;	※全角空白の違いが見えるエディタを使うことをおすすめします
;	※UTF-8(BOM付)で保存してください
;	※順序はグループ内で自由です。同じキーの組み合わせは、後の方が有効になります。
; ----------------------------------------------------------------------

; 薙刀式配列固有名詞ショートカットを実装するためのルーチン
#Include %A_ScriptDir%/Sub/Naginata-Koyu.ahk
; 特別出力
#Include %A_ScriptDir%/KanaTable/SendSP.ahk

; かな配列読み込み
ReadLayout()	; () -> Void
{
	#IncludeAgain %A_ScriptDir%/Sub/KeyBit_h.ahk	; 配列定義で使う定数
	global layoutName, koyuNumber

	layoutName := "薙刀式v15B1版*改造"

	ReadStandardLayout()	; キーボード初期配列を読み込み
;	ReadWorkmanLayout()		; Workman配列

	; -----------------------------------------
	; 別名登録	Int64型
	; -----------------------------------------
	AL_ヴ				:= AL_小	:= KC_Q
	AL_き	:= AL_ぬ				:= KC_W
	AL_て	:= AL_り				:= KC_E
	AL_し	:= AL_ね				:= KC_R
	AL_左							:= KC_T
	AL_右							:= KC_Y
	AL_BS	:= AL_さ				:= KC_U
	AL_る	:= AL_よ				:= KC_I
	AL_す	:= AL_え				:= KC_O
	AL_へ	:= AL_ゆ				:= KC_P

	AL_ろ	:= AL_せ				:= KC_A
	AL_け	:= AL_め				:= KC_S
	AL_と	:= AL_に				:= KC_D
	AL_か	:= AL_ま	:= AL_左濁	:= KC_F
	AL_っ	:= AL_ち				:= KC_G
	AL_く	:= AL_や				:= KC_H
	AL_あ	:= AL_の	:= AL_右濁	:= KC_J
	AL_い	:= AL_も				:= KC_K
	AL_う	:= AL_つ				:= KC_L
	AL_ー	:= AL_ふ				:= KC_SCLN

	AL_ほ							:= KC_Z
	AL_ひ							:= KC_X
	AL_は	:= AL_を				:= KC_C
	AL_こ	:= AL_、	:= AL_左半	:= KC_V
	AL_そ	:= AL_み				:= KC_B
	AL_た	:= AL_お				:= KC_N
	AL_な	:= AL_。	:= AL_右半	:= KC_M
	AL_ん	:= AL_む				:= KC_COMM
	AL_ら	:= AL_わ				:= KC_DOT
	AL_れ							:= KC_SLSH
	; -----------------------------------------


;**********************************************
;**********************************************
; メイン部分; 単打とシフト
;**********************************************
;**********************************************

; 単打
kanaGroup := ""	; グループなし
	SetKana( AL_ヴ	,"vu"		)		; ヴ
	SetKana( AL_き	,"ki"		)		; き
	SetKana( AL_て	,"te"		)		; て
	SetKana( AL_し	,"si"		)		; し
	SetKana( AL_左	,"{←}"		, R)	; 左
	SetKana( AL_右	,"{→}"		, R)	; 右
	SetKana( AL_BS	,"{BS}" 	, R)	; 前文字削除
	SetKana( AL_る	,"ru"		)		; る
	SetKana( AL_す	,"su"		)		; す
	SetKana( AL_へ	,"he"		)		; へ
	SetKana( AL_ろ	,"ro"		)		; ろ
	SetKana( AL_け	,"ke"		)		; け
	SetKana( AL_と	,"to"		)		; と
	SetKana( AL_か	,"ka"		)		; か
	SetKana( AL_っ	,"xtu"		)		; (っ)
	SetKana( AL_く	,"ku"		)		; く
	SetKana( AL_あ	,"a"		)		; あ
	SetKana( AL_い	,"i"		)		; い
	SetKana( AL_う	,"u"		)		; う
	SetKana( AL_ー	,"-"		)		; ー
	SetKana( AL_ほ	,"ho"		)		; ほ
	SetKana( AL_ひ	,"hi"		)		; ひ
	SetKana( AL_は	,"ha"		)		; は
	SetKana( AL_こ	,"ko"		)		; こ
	SetKana( AL_そ	,"so"		)		; そ
	SetKana( AL_た	,"ta"		)		; た
	SetKana( AL_な	,"na"		)		; な
	SetKana( AL_ん	,"nn"		)		; ん
	SetKana( AL_ら	,"ra"		)		; ら
	SetKana( AL_れ	,"re"		)		; れ

; センターシフト
	SetKana( AL_ヴ | KC_SPC		,"vu"		)		; ヴ
	SetKana( AL_ぬ | KC_SPC		,"nu"		)		; ぬ
	SetKana( AL_り | KC_SPC		,"ri"		)		; り
	SetKana( AL_ね | KC_SPC		,"ne"		)		; ね
	SetKana( AL_左 | KC_SPC		,"+{←}"	, R)	; シフト + 左
	SetKana( AL_右 | KC_SPC		,"+{→}"	, R)	; シフト + 右
	SetKana( AL_さ | KC_SPC		,"sa"		)		; さ
	SetKana( AL_よ | KC_SPC		,"yo"		)		; よ
	SetKana( AL_え | KC_SPC		,"e"		)		; え
	SetKana( AL_ゆ | KC_SPC		,"yu"		)		; ゆ
	SetKana( AL_せ | KC_SPC		,"se"		)		; せ
	SetKana( AL_め | KC_SPC		,"me"		)		; め
	SetKana( AL_に | KC_SPC		,"ni"		)		; に
	SetKana( AL_ま | KC_SPC		,"ma"		)		; ま
	SetKana( AL_ち | KC_SPC		,"ti"		)		; ち
	SetKana( AL_や | KC_SPC		,"ya"		)		; や
	SetKana( AL_の | KC_SPC		,"no"		)		; の
	SetKana( AL_も | KC_SPC		,"mo"		)		; も
	SetKana( AL_つ | KC_SPC		,"tu"		)		; つ
	SetKana( AL_ふ | KC_SPC		,"hu"		)		; ふ
	SetKana( AL_ほ | KC_SPC		,"ho"		)		; ほ
	SetKana( AL_ひ | KC_SPC		,"hi"		)		; ひ
	SetKana( AL_を | KC_SPC		,"wo"		)		; を
	SetKana( AL_、 | KC_SPC		,",{Enter}"	)		; 、
	SetKana( AL_み | KC_SPC		,"mi"		)		; み
	SetKana( AL_お | KC_SPC		,"o"		)		; お
	SetKana( AL_。 | KC_SPC		,".{Enter}"	)		; 。
	SetKana( AL_む | KC_SPC		,"mu"		)		; む
	SetKana( AL_わ | KC_SPC		,"wa"		)		; わ
	SetKana( AL_れ | KC_SPC		,"re"		)		; れ

;**********************************************
;**********************************************
; 同時押し; 濁音、半濁音、小書き、拗音、外来音
;**********************************************
;**********************************************

;****************************
; 濁音： 逆手の人差指中段
; 連続シフト中も有効

; 右手の濁音
kanaGroup := "DA"
	SetKana( AL_左濁 | AL_さ			,"za"	)	; ざ
	SetKana( AL_左濁 | AL_す			,"zu"	)	; ず
	SetKana( AL_左濁 | AL_へ			,"be"	)	; べ
	SetKana( AL_左濁 | AL_く			,"gu"	)	; ぐ
	SetKana( AL_左濁 | AL_つ			,"du"	)	; づ
	SetKana( AL_左濁 | AL_ふ			,"bu"	)	; ぶ
	SetKana( AL_左濁 | AL_た			,"da"	)	; だ

; 左手の濁音
	SetKana( AL_右濁 | AL_き			,"gi"	)	; ぎ
	SetKana( AL_右濁 | AL_て			,"de"	)	; で
	SetKana( AL_右濁 | AL_し			,"zi"	)	; じ
	SetKana( AL_右濁 | AL_せ			,"ze"	)	; ぜ
	SetKana( AL_右濁 | AL_け			,"ge"	)	; げ
	SetKana( AL_右濁 | AL_と			,"do"	)	; ど
	SetKana( AL_右濁 | AL_か			,"ga"	)	; が
	SetKana( AL_右濁 | AL_ち			,"di"	)	; ぢ
	SetKana( AL_右濁 | AL_ほ			,"bo"	)	; ぼ
	SetKana( AL_右濁 | AL_ひ			,"bi"	)	; び
	SetKana( AL_右濁 | AL_は			,"ba"	)	; ば
	SetKana( AL_右濁 | AL_こ			,"go"	)	; ご
	SetKana( AL_右濁 | AL_そ			,"zo"	)	; ぞ

;****************************
; 半濁音： 逆手の下段人差し指
; 連続シフト中も有効

; 右の半濁音
kanaGroup := "HA"
	SetKana( AL_左半 | AL_へ			,"pe"	)	; ぺ
	SetKana( AL_左半 | AL_ふ			,"pu"	)	; ぷ

; 左の半濁音
	SetKana( AL_右半 | AL_ほ			,"po"	)	; ぽ
	SetKana( AL_右半 | AL_ひ			,"pi"	)	; ぴ
	SetKana( AL_右半 | AL_は			,"pa"	)	; ぱ

;****************************
; 小書き： Qと同時押し
kanaGroup := "KO"
	SetKana( AL_小 | AL_よ				,"xyo"	)	; (ょ)
	SetKana( AL_小 | AL_え				,"xe"	)	; (ぇ)
	SetKana( AL_小 | AL_ゆ				,"xyu"	)	; (ゅ)
	SetKana( AL_小 | AL_や				,"xya"	)	; (ゃ)
	SetKana( AL_小 | AL_あ				,"xa"	)	; (ぁ)
	SetKana( AL_小 | AL_い				,"xi"	)	; (ぃ)
	SetKana( AL_小 | AL_う				,"xu"	)	; (ぅ)
	SetKana( AL_小 | AL_お				,"xo"	)	; (ぉ)
	SetKana( AL_小 | AL_わ				,"xwa"	)	; (ゎ)

;**********************************************
; 拗音、外来音(３キー同時を含む)
;**********************************************
;****************************
; 清音拗音; やゆよと同時押しで、ゃゅょが付く
kanaGroup := ""	; グループなし
	SetKana( AL_き | AL_や				,"kya"	)	; きゃ
	SetKana( AL_り | AL_や				,"rya"	)	; りゃ
	SetKana( AL_し | AL_や				,"sya"	)	; しゃ
	SetKana( AL_に | AL_や				,"nya"	)	; にゃ
	SetKana( AL_ち | AL_や				,"tya"	)	; ちゃ
	SetKana( AL_ひ | AL_や				,"hya"	)	; ひゃ
	SetKana( AL_み | AL_や				,"mya"	)	; みゃ

	SetKana( AL_き | AL_ゆ				,"kyu"	)	; きゅ
	SetKana( AL_り | AL_ゆ				,"ryu"	)	; りゅ
	SetKana( AL_し | AL_ゆ				,"syu"	)	; しゅ
	SetKana( AL_に | AL_ゆ				,"nyu"	)	; にゅ
	SetKana( AL_ち | AL_ゆ				,"tyu"	)	; ちゅ
	SetKana( AL_ひ | AL_ゆ				,"hyu"	)	; ひゅ
	SetKana( AL_み | AL_ゆ				,"myu"	)	; みゅ

	SetKana( AL_き | AL_よ				,"kyo"	)	; きょ
	SetKana( AL_り | AL_よ				,"ryo"	)	; りょ
	SetKana( AL_し | AL_よ				,"syo"	)	; しょ
	SetKana( AL_に | AL_よ				,"nyo"	)	; にょ
	SetKana( AL_ち | AL_よ				,"tyo"	)	; ちょ
	SetKana( AL_ひ | AL_よ				,"hyo"	)	; ひょ
	SetKana( AL_み | AL_よ				,"myo"	)	; みょ

;****************************
; 濁音拗音
kanaGroup := "DA"
	SetKana( AL_右濁 | AL_き | AL_や			,"gya"		)	; ぎゃ
	SetKana( AL_右濁 | AL_し | AL_や			,"ja"		)	; じゃ
	SetKana( AL_右濁 | AL_ち | AL_や			,"dya"		)	; ぢゃ
	SetKana( AL_右濁 | AL_ひ | AL_や			,"bya"		)	; びゃ

	SetKana( AL_右濁 | AL_き | AL_ゆ			,"gyu"		)	; ぎゅ
	SetKana( AL_右濁 | AL_し | AL_ゆ			,"ju"		)	; じゅ
	SetKana( AL_右濁 | AL_ち | AL_ゆ			,"dyu"		)	; ぢゅ
	SetKana( AL_右濁 | AL_ひ | AL_ゆ			,"byu"		)	; びゅ

	SetKana( AL_右濁 | AL_き | AL_よ			,"gyo"		)	; ぎょ
	SetKana( AL_右濁 | AL_し | AL_よ			,"jo"		)	; じょ
	SetKana( AL_右濁 | AL_ち | AL_よ			,"dyo"		)	; ぢょ
	SetKana( AL_右濁 | AL_ひ | AL_よ			,"byo"		)	; びょ

;****************************
; 半濁音拗音
kanaGroup := "HA"
	SetKana( AL_右半 | AL_ひ | AL_よ			,"pyo"		)	; ぴょ
	SetKana( AL_右半 | AL_ひ | AL_ゆ			,"pyu"		)	; ぴゅ
	SetKana( AL_右半 | AL_ひ | AL_や			,"pya"		)	; ぴゃ

;*************************************
; 外来音は3キー同時押しに統一しました
;*************************************
; 清音外来音は半濁音キーと使用二音の三音同時
; 濁音外来音は濁音キーと使用二音の三音同時
;****************************

; テ; ティテュディデュ
kanaGroup := "HA"
	SetKana( AL_右半 | AL_て | AL_ゆ			,"thu"		)	; てゅ
	SetKana( AL_右半 | AL_て | AL_い			,"thi"		)	; てぃ

kanaGroup := "DA"
	SetKana( AL_右濁 | AL_て | AL_ゆ			,"dhu"		)	; でゅ
	SetKana( AL_右濁 | AL_て | AL_い			,"dhi"		)	; でぃ

; ト; トゥドゥ
kanaGroup := "HA"
	SetKana( AL_右半 | AL_と | AL_う			,"twu"		)	; とぅ
kanaGroup := "DA"
	SetKana( AL_右濁 | AL_と | AL_う			,"dwu"		)	; どぅ

; シチ ェ; シェジェチェヂェ
kanaGroup := "HA"
	SetKana( AL_右半 | AL_し | AL_え			,"sye"		)	; しぇ
	SetKana( AL_右半 | AL_ち | AL_え			,"tye"		)	; ちぇ
kanaGroup := "DA"
	SetKana( AL_右濁 | AL_し | AL_え			,"je"		)	; じぇ
	SetKana( AL_右濁 | AL_ち | AL_え			,"dye"		)	; ぢぇ

;****************************
; フ; ファフィフェフォフュ
kanaGroup := "HA"
	SetKana( AL_左半 | AL_ふ | AL_え			,"fe"		)	; ふぇ
	SetKana( AL_左半 | AL_ふ | AL_ゆ			,"fyu"		)	; ふゅ
	SetKana( AL_左半 | AL_ふ | AL_あ			,"fa"		)	; ふぁ
	SetKana( AL_左半 | AL_ふ | AL_い			,"fi"		)	; ふぃ
	SetKana( AL_左半 | AL_ふ | AL_お			,"fo"		)	; ふぉ

; ヴ; ヴァヴィヴェヴォヴュ
;kanaGroup := "DA"
	SetKana( AL_右半 | AL_ヴ | AL_え			,"ve"		)	; ヴぇ
	SetKana( AL_右半 | AL_ヴ | AL_ゆ			,"vuxyu"	)	; ヴゅ
	SetKana( AL_右半 | AL_ヴ | AL_あ			,"va"		)	; ヴぁ
	SetKana( AL_右半 | AL_ヴ | AL_い			,"vi"		)	; ヴぃ
	SetKana( AL_右半 | AL_ヴ | AL_お			,"vo"		)	; ヴぉ

; う; ウィウェウォ　い；イェ
;kanaGroup := "HA"
	SetKana( AL_左半 | AL_う | AL_え			,"we"		)	; うぇ
	SetKana( AL_左半 | AL_う | AL_い			,"wi"		)	; うぃ
	SetKana( AL_左半 | AL_う | AL_お			,"uxo"		)	; うぉ

	SetKana( AL_左半 | AL_い | AL_え			,"ye"		)	; いぇ

; ク; クァクィクェクォ
	SetKana( AL_左半 | AL_く | AL_え			,"kuxe"		)	; くぇ
	SetKana( AL_左半 | AL_く | AL_あ			,"kuxa"		)	; くぁ
	SetKana( AL_左半 | AL_く | AL_い			,"kuxi"		)	; くぃ
	SetKana( AL_左半 | AL_く | AL_お			,"kuxo"		)	; くぉ
	SetKana( AL_左半 | AL_く | AL_わ			,"kuxwa"	)	; くゎ

; グ; グァグィグェグォ
kanaGroup := "DA"
	SetKana( AL_左濁 | AL_く | AL_え			,"guxe"		)	; ぐぇ
	SetKana( AL_左濁 | AL_く | AL_あ			,"gwa"		)	; ぐぁ
	SetKana( AL_左濁 | AL_く | AL_い			,"guxi"		)	; ぐぃ
	SetKana( AL_左濁 | AL_く | AL_お			,"guxo"		)	; ぐぉ
	SetKana( AL_左濁 | AL_く | AL_わ			,"guxwa"	)	; ぐゎ

; ツ; ツァツィツェツォ
kanaGroup := "HA"
;	SetKana( AL_左半 | AL_つ | AL_え			,"tse"		)	; つぇ
	SetKana( AL_左半 | AL_つ | AL_あ			,"tsa"		)	; つぁ
;	SetKana( AL_左半 | AL_つ | AL_い			,"tsi"		)	; つぃ
;	SetKana( AL_左半 | AL_つ | AL_お			,"tso"		)	; つぉ

; IME ON/OFF
; 事前に、MS-IMEのプロパティで、
; ひらがなカタカナキー：IME ON、無変換キー：IME OFFに設定のこと
; HJ: ON / FG: OFF

kanaGroup := ""	; グループなし
	SetKana( KC_H | KC_J			,"{ひらがな}")				; IME ON
	SetEisu( KC_H | KC_J			,"{ひらがな 2}")
	SetKana( KC_F | KC_G			,"{確定}{全角}"	)			; IME OFF
	SetEisu( KC_F | KC_G			,"{確定}{ひらがな}{全角}")	; (ATOK)英語入力ON は "{ひらがな 2}{英数}")
;	SetKana( KC_H | KC_J | KC_SPC	,"{ひらがな}{カタカナ}")	; カタカナ入力
;	SetEisu( KC_H | KC_J | KC_SPC	,"{ひらがな 2}{カタカナ}")
;	SetKana( KC_F | KC_G | KC_SPC	,"{全英}"	)				; 全角英数入力
;	SetEisu( KC_F | KC_G | KC_SPC	,"{全英}"	)

; Enter
; VとMの同時押し
kanaGroup := "HA"
	SetKana( KC_V | KC_M			,"{Enter}"	)	; 行送り
	SetKana( KC_V | KC_M | KC_SPC	,"{Enter}"	)
	SetEisu( KC_V | KC_M			,"{Enter}"	)	; 行送り
	SetEisu( KC_V | KC_M | KC_SPC	,"{Enter}"	)

;***********************************
;***********************************
; 編集モード、固有名詞ショートカット
;***********************************
;***********************************

; 編集モード１
; 中段人差し指＋中指を押しながら
; 「て」の部分は定義できない。「ディ」があるため

; 左手
kanaGroup := "1L"
	SetKana( KC_J | KC_K | KC_Q		,"{確定}^{End}"						)	; 最新部へ移動
	SetKana( KC_J | KC_K | KC_A		,"……{確定}"						)	; ……
	SetKana2(KC_J | KC_K | KC_Z		,"││{確定}", "──{確定}"			)	; ──
	SetKana( KC_J | KC_K | KC_W		,"『』{確定}{↑}"					)	; 『』
	SetKana2(KC_J | KC_K | KC_S		,"（）{確定}{↑}", "(){確定}{←}"	)	; （）
	SetKana( KC_J | KC_K | KC_X		,"《》{確定}{↑}"					)	; 《》
;	SetKana( KC_J | KC_K | KC_E		,"dhi"								)	; ディ
	SetKana2(KC_J | KC_K | KC_D		,"？{確定}", "?{確定}"				)	; ？
	SetKana2(KC_J | KC_K | KC_C		,"！{確定}", "{!}{確定}"			)	; ！
	SetKana( KC_J | KC_K | KC_R		,"^s"								)	; 保存
	SetKana2(KC_J | KC_K | KC_F		,"「」{確定}{↑}", "[]{確定}{←}"	)	; 「」
	SetKana( KC_J | KC_K | KC_V		,"{確定}{↓}"						)	; 確定次の文字
	SetKana( KC_J | KC_K | KC_T		,"【】{確定}{↑}"					)	; 【】
	SetKana( KC_J | KC_K | KC_G		,"/"								)	; ・未確定
	SetKana( KC_J | KC_K | KC_B		,"／{確定}"							)	; ／

	SetEisu( KC_J | KC_K | KC_Q		,"{確定}^{End}"						)	; 最新部へ移動
	SetEisu( KC_J | KC_K | KC_A		,"……{確定}"						)	; ……
	SetEisu2(KC_J | KC_K | KC_Z		,"││{確定}", "──{確定}"			)	; ──
	SetEisu( KC_J | KC_K | KC_W		,"『』{確定}{↑}"					)	; 『』
	SetEisu2(KC_J | KC_K | KC_S		,"（）{確定}{↑}", "(){確定}{←}"	)	; （）
	SetEisu( KC_J | KC_K | KC_X		,"《》{確定}{↑}"					)	; 《》
;	SetEisu( KC_J | KC_K | KC_E		,"dhi"								)	; ディ
	SetEisu2(KC_J | KC_K | KC_D		,"？{確定}", "?{確定}"				)	; ？
	SetEisu2(KC_J | KC_K | KC_C		,"！{確定}", "{!}{確定}"			)	; ！
	SetEisu( KC_J | KC_K | KC_R		,"^s"								)	; 保存
	SetEisu( KC_J | KC_K | KC_F		,"「」{確定}{↑}"					)	; 「」
	SetEisu( KC_J | KC_K | KC_V		,"{確定}{↓}"						)	; 確定次の文字
	SetEisu( KC_J | KC_K | KC_T		,"【】{確定}{↑}"					)	; 【】
	SetEisu( KC_J | KC_K | KC_G		,"・"								)	; ・未確定
	SetEisu( KC_J | KC_K | KC_B		,"／{確定}"							)	; ／
; 右手
kanaGroup := "1R"
	SetKana( KC_D | KC_F | KC_Y		,"{Home}"			)		; ホーム
	SetKana( KC_D | KC_F | KC_H		,"{確定}{End}"		)		; 確定エンド
	SetKana( KC_D | KC_F | KC_N		,"{End}"			)		; エンド
	SetKana( KC_D | KC_F | KC_U		,"+{End}{BS}"		)		; 文末まで消去
	SetKana( KC_D | KC_F | KC_J		,"{↑}"				, R)	; 一文字前へ
	SetKana( KC_D | KC_F | KC_M		,"{↓}"				, R)	; 一文字後へ
	SetKana( KC_D | KC_F | KC_I		,"#/"				)		; 再変換
	SetKana( KC_D | KC_F | KC_K		,"+{↑}"			, R)	; 一文字前を選択
	SetKana( KC_D | KC_F | KC_COMM	,"+{↓}"			, R)	; 一文字後を選択
	SetKana( KC_D | KC_F | KC_O		,"{Del}"			, R)	; 一文字後を削除
	SetKana( KC_D | KC_F | KC_L		,"+{↑ 7}"			, R)	; 七文字前まで選択
	SetKana( KC_D | KC_F | KC_DOT	,"+{↓ 7}"			, R)	; 七文字後まで選択
	SetKana( KC_D | KC_F | KC_P		,"{Esc 3}",		  "ESCx3")	; 入力キャンセル
	SetKana( KC_D | KC_F | KC_SCLN	,"^i"				)		; カタカナ変換
	SetKana( KC_D | KC_F | KC_SLSH	,"^u"				)		; ひらがな変換

	SetEisu( KC_D | KC_F | KC_Y		,"{Home}"			)		; ホーム
	SetEisu( KC_D | KC_F | KC_H		,"{確定}{End}"		)		; 確定エンド
	SetEisu( KC_D | KC_F | KC_N		,"{End}"			)		; エンド
	SetEisu( KC_D | KC_F | KC_U		,"+{End}{BS}"		)		; 文末まで消去
	SetEisu( KC_D | KC_F | KC_J		,"{↑}"				, R)	; 一文字前へ
	SetEisu( KC_D | KC_F | KC_M		,"{↓}"				, R)	; 一文字後へ
	SetEisu( KC_D | KC_F | KC_I		,"#/"				)		; 再変換
	SetEisu( KC_D | KC_F | KC_K		,"+{↑}"			, R)	; 一文字前を選択
	SetEisu( KC_D | KC_F | KC_COMM	,"+{↓}"			, R)	; 一文字後を選択
	SetEisu( KC_D | KC_F | KC_O		,"{Del}"			, R)	; 一文字後を削除
	SetEisu( KC_D | KC_F | KC_L		,"+{↑ 7}"			, R)	; 七文字前まで選択
	SetEisu( KC_D | KC_F | KC_DOT	,"+{↓ 7}"			, R)	; 七文字後まで選択
	SetEisu( KC_D | KC_F | KC_P		,"{Esc 3}",		  "ESCx3")	; 入力キャンセル
	SetEisu( KC_D | KC_F | KC_SCLN	,"^i"				)		; カタカナ変換
	SetEisu( KC_D | KC_F | KC_SLSH	,"^u"				)		; ひらがな変換

; 編集モード２
; 下段人差指＋中指

; 左手
kanaGroup := "2L"
	SetKana( KC_M | KC_COMM | KC_Q	,"{End}{Del 4}"								)	; ト書き改行戻し
	SetKana( KC_M | KC_COMM | KC_A	,"　　　×　　　×　　　×{確定}{改行}"		)	; x   x   x
	SetKana( KC_M | KC_COMM | KC_Z	,"{End}{Del 2}"								)	; 台詞改行戻し
	SetKana( KC_M | KC_COMM | KC_W	,"{C_Bkup}^x『^v』{確定}{C_Rstr}"			)	; +『』
	SetKana2(KC_M | KC_COMM | KC_S	,"{C_Bkup}^x（^v）{確定}{C_Rstr}"
									,"{C_Bkup}^x(^v){確定}{C_Rstr}"				)	; +（）
	SetKana( KC_M | KC_COMM | KC_X	,"{C_Bkup}^x｜{確定}^v《》{確定}{↑}{C_Rstr}")	; +｜《》
	SetKana( KC_M | KC_COMM | KC_E	,"{Home}{改行}　　　{End}"					)	; ト書き改行
	SetKana( KC_M | KC_COMM | KC_D	,"　　　"									)	; 空白三文字
	SetKana( KC_M | KC_COMM | KC_C	,"{Home}{改行}　{End}"						)	; 台詞改行
	SetKana2(KC_M | KC_COMM | KC_R	,"{確定}{End}{改行}「」{確定}{↑}"
									,"{確定}{End}{改行}[]{確定}{←}"			)	; 次行「」
	SetKana2(KC_M | KC_COMM | KC_F	,"{C_Bkup}^x「^v」{確定}{C_Rstr}"
									,"{C_Bkup}^x[^v]{確定}{C_Rstr}"				)	; +「」
	SetKana2(KC_M | KC_COMM | KC_V	,"{確定}{End}{改行}「」{確定}{↑}"
									,"{確定}{End}{改行}[]{確定}{←}"			)	; 確定次行「」
	SetKana( KC_M | KC_COMM | KC_T	,"{確定}{End}{改行}　"						)	; 次行□
	SetKana( KC_M | KC_COMM | KC_G	,"〇{確定}"									)	; ○
	SetKana( KC_M | KC_COMM | KC_B	,"{確定}{End}{改行}　"						)	; 確定次行□

	SetEisu( KC_M | KC_COMM | KC_Q	,"{End}{Del 4}"								)	; ト書き改行戻し
	SetEisu( KC_M | KC_COMM | KC_A	,"　　　×　　　×　　　×{確定}{改行}"		)	; x   x   x
	SetEisu( KC_M | KC_COMM | KC_Z	,"{End}{Del 2}"								)	; 台詞改行戻し
	SetEisu( KC_M | KC_COMM | KC_W	,"{C_Bkup}^x『^v』{確定}{C_Rstr}"			)	; +『』
	SetEisu2(KC_M | KC_COMM | KC_S	,"{C_Bkup}^x（^v）{確定}{C_Rstr}"
									,"{C_Bkup}^x(^v){確定}{C_Rstr}"				)	; +（）
	SetEisu( KC_M | KC_COMM | KC_X	,"{C_Bkup}^x｜{確定}^v《》{確定}{↑}{C_Rstr}")	; +｜《》
	SetEisu( KC_M | KC_COMM | KC_E	,"{Home}{改行}　　　{End}"					)	; ト書き改行
	SetEisu( KC_M | KC_COMM | KC_D	,"　　　"									)	; 空白三文字
	SetEisu( KC_M | KC_COMM | KC_C	,"{Home}{改行}　{End}"						)	; 台詞改行
	SetEisu( KC_M | KC_COMM | KC_R	,"{確定}{End}{改行}「」{確定}{↑}"			)	; 次行「」
	SetEisu( KC_M | KC_COMM | KC_F	,"{C_Bkup}^x「^v」{確定}{C_Rstr}"			)	; +「」
	SetEisu( KC_M | KC_COMM | KC_V	,"{確定}{End}{改行}「」{確定}{↑}"			)	; 確定次行「」
	SetEisu( KC_M | KC_COMM | KC_T	,"{確定}{End}{改行}　"						)	; 次行□
	SetEisu( KC_M | KC_COMM | KC_G	,"〇{確定}"									)	; ○
	SetEisu( KC_M | KC_COMM | KC_B	,"{確定}{End}{改行}　"						)	; 確定次行□

; 右手
kanaGroup := "2R"
	SetKana( KC_C | KC_V | KC_Y		,"+{Home}"	)		; ホーム選択
	SetKana( KC_C | KC_V | KC_H		,"^c"		)		; コピー
	SetKana( KC_C | KC_V | KC_N		,"+{End}"	)		; エンド選択
	SetKana( KC_C | KC_V | KC_U		,"^x"		)		; カット
	SetKana( KC_C | KC_V | KC_J		,"{→ 5}"	, R)	; 五行前へ移動
	SetKana( KC_C | KC_V | KC_M		,"{← 5}"	, R)	; 五行後へ移動
	SetKana( KC_C | KC_V | KC_I		,"^z"		)		; アンドゥ
	SetKana( KC_C | KC_V | KC_K		,"+{→}"	, R)	; 一行前まで選択
	SetKana( KC_C | KC_V | KC_COMM	,"+{←}"	, R)	; 一行後まで選択
	SetKana( KC_C | KC_V | KC_O		,"^y"		)		; リドゥ
	SetKana( KC_C | KC_V | KC_L		,"+{→ 5}"	, R)	; 五行前まで選択
	SetKana( KC_C | KC_V | KC_DOT	,"+{← 5}"	, R)	; 五行後まで選択
	SetKana( KC_C | KC_V | KC_P		,"^v"		)		; ペースト
	SetKana( KC_C | KC_V | KC_SCLN	,"+{→ 20}"	)		; 二十行前まで選択
	SetKana( KC_C | KC_V | KC_SLSH	,"+{← 20}"	)		; 二十行後まで選択

	SetEisu( KC_C | KC_V | KC_Y		,"+{Home}"	)		; ホーム選択
	SetEisu( KC_C | KC_V | KC_H		,"^c"		)		; コピー
	SetEisu( KC_C | KC_V | KC_N		,"+{End}"	)		; エンド選択
	SetEisu( KC_C | KC_V | KC_U		,"^x"		)		; カット
	SetEisu( KC_C | KC_V | KC_J		,"{→ 5}"	, R)	; 五行前へ移動
	SetEisu( KC_C | KC_V | KC_M		,"{← 5}"	, R)	; 五行後へ移動
	SetEisu( KC_C | KC_V | KC_I		,"^z"		)		; アンドゥ
	SetEisu( KC_C | KC_V | KC_K		,"+{→}"	, R)	; 一行前まで選択
	SetEisu( KC_C | KC_V | KC_COMM	,"+{←}"	, R)	; 一行後まで選択
	SetEisu( KC_C | KC_V | KC_O		,"^y"		)		; リドゥ
	SetEisu( KC_C | KC_V | KC_L		,"+{→ 5}"	, R)	; 五行前まで選択
	SetEisu( KC_C | KC_V | KC_DOT	,"+{← 5}"	, R)	; 五行後まで選択
	SetEisu( KC_C | KC_V | KC_P		,"^v"		)		; ペースト
	SetEisu( KC_C | KC_V | KC_SCLN	,"+{→ 20}"	)		; 二十行前まで選択
	SetEisu( KC_C | KC_V | KC_SLSH	,"+{← 20}"	)		; 二十行後まで選択

kanaGroup := ""	; グループなし
	SetKana( KC_Q | KC_W			,"Null"		,"横書き")
	SetEisu( KC_Q | KC_W			,"Null"		,"横書き")
	SetKana( KC_Q | KC_A			,"Null"		,"縦書き")
	SetEisu( KC_Q | KC_A			,"Null"		,"縦書き")


	; 設定がUSキーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver = "kbd101.dll")
	{
	; おまけ
		SetEisu( JP_YEN				,"\"	)	; ￥
		SetEisu( KC_INT1			,"\"	)	; ￥
		SetEisu( JP_YEN | KC_SPC	,"|"	)	; ｜	スペース押しながら
		SetEisu( KC_INT1 | KC_SPC	,"_"	)	; ＿	スペース押しながら

		SetKana( JP_YEN				,"\"	)	; ￥
		SetKana( JP_YEN | KC_SPC	,"|"	)	; ｜	スペース押しながら
	}

	If (usLike > 0)
		USLikeLayout()	; USキーボード風の配列へ

	KoyuReadAndRegist(koyuNumber)	; 固有名詞ショートカットの読み込み・登録

	Return
}

; USキーボード風の配列へ
USLikeLayout()	; () -> Void
{
	#IncludeAgain %A_ScriptDir%/Sub/KeyBit_h.ahk	; 配列定義で使う定数

	; 設定がUSキーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver = "kbd101.dll")
		Return

kanaGroup := ""	; グループなし
	SetEisu( KC_EQL				,"+{sc0C}"	)	; =
	SetEisu( KC_LBRC			,"{sc1B}"	)	; [
	SetEisu( KC_RBRC			,"{sc2B}"	)	; ]
	SetEisu( KC_QUOT			,"+{sc08}"	)	; '
	SetEisu( KC_NUHS			,"+{sc1A}"	)	; `

	SetEisu( KC_SPC | KC_2		,"{sc1A}"	)	; @
	SetEisu( KC_SPC | KC_6		,"{sc0D}"	)	; ^
	SetEisu( KC_SPC | KC_7		,"+{sc07}"	)	; &
	SetEisu( KC_SPC | KC_8		,"+{sc28}"	)	; *
	SetEisu( KC_SPC | KC_9		,"+{sc09}"	)	; (
	SetEisu( KC_SPC | KC_0		,"+{sc0A}"	)	; )
	SetEisu( KC_SPC | KC_MINS	,"+{sc73}"	)	; _
	SetEisu( KC_SPC | KC_EQL	,"+{sc27}"	)	; +
	SetEisu( KC_SPC | KC_LBRC	,"+{sc1B}"	)	; {
	SetEisu( KC_SPC | KC_RBRC	,"+{sc2B}"	)	; }
	SetEisu( KC_SPC | KC_SCLN	,"{sc28}"	)	; :
	SetEisu( KC_SPC | KC_QUOT	,"+{sc03}"	)	; "
	SetEisu( KC_SPC | KC_NUHS	,"+{sc0D}"	)	; ~


	SetKana( KC_EQL				,"+{sc0C}"	)	; =
	SetKana( KC_LBRC			,"{sc1B}"	)	; [
	SetKana( KC_RBRC			,"{sc2B}"	)	; ]
	SetKana( KC_QUOT			,"+{sc08}"	)	; '
	SetKana( KC_NUHS			,"+{sc1A}"	)	; `

	SetKana( KC_SPC | KC_2		,"{sc1A}"	)	; @
	SetKana( KC_SPC | KC_6		,"{sc0D}"	)	; ^
	SetKana( KC_SPC | KC_7		,"+{sc07}"	)	; &
	SetKana( KC_SPC | KC_8		,"+{sc28}"	)	; *
	SetKana( KC_SPC | KC_9		,"+{sc09}"	)	; (
	SetKana( KC_SPC | KC_0		,"+{sc0A}"	)	; )
	SetKana( KC_SPC | KC_MINS	,"+{sc73}"	)	; _
	SetKana( KC_SPC | KC_EQL	,"+{sc27}"	)	; +
	SetKana( KC_SPC | KC_LBRC	,"+{sc1B}"	)	; {
	SetKana( KC_SPC | KC_RBRC	,"+{sc2B}"	)	; }
;	SetKana( KC_SPC |  KC_SCLN	,"{sc28}"	)	; :	(薙刀式で使用)
	SetKana( KC_SPC | KC_QUOT	,"+{sc03}"	)	; "
	SetKana( KC_SPC | KC_NUHS	,"+{sc0D}"	)	; ~

	; 設定がPC-9800キーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver = "kbdnec.dll")
	{
		SetEisu( KC_NUHS			,"+{sc0D}"	)	; `
		SetEisu( KC_NUHS | KC_SPC	,"+{sc1A}"	)	; ~

		SetKana( KC_NUHS			,"+{sc0D}"	)	; `
		SetKana( KC_NUHS | KC_SPC	,"+{sc1A}"	)	; ~
	}

	Return
}

; 固有名詞ショートカットの登録
KoyuRegist()	; () -> Void
{
	#IncludeAgain %A_ScriptDir%/Sub/KeyBit_h.ahk	; 配列定義で使う定数
	#IncludeAgain %A_ScriptDir%/Sub/Naginata-Koyu_h.ahk

	If (D05 != "")
		MsgBox, 固有名詞ショートカット`n──第一面──`n“Ｔ” の定義は無効です

	; 固有名詞ショートカット(Y+U)を押し続けて
	; 前文字削除(U)のリピートが起きる場合があるので対策
	kanaGroup := ""	; グループなし
		SetKana( KC_Y | KC_U	,"{Null}")	; ダミー

;**************************************
; 固有名詞ショートカット
; 上段人差指＋中指

; 第一面
	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_1		,"{直接}" . E01)
		SetKana(KC_Y | KC_2		,"{直接}" . E02)
		SetKana(KC_Y | KC_3		,"{直接}" . E03)
		SetKana(KC_Y | KC_4		,"{直接}" . E04)
		SetKana(KC_Y | KC_5		,"{直接}" . E05)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_T | KC_6		,"{直接}" . E06)
		SetKana(KC_T | KC_7		,"{直接}" . E07)
		SetKana(KC_T | KC_8		,"{直接}" . E08)
		SetKana(KC_T | KC_9		,"{直接}" . E09)
		SetKana(KC_T | KC_0		,"{直接}" . E10)
		SetKana(KC_T | KC_MINS	,"{直接}" . E11)
		SetKana(KC_T | KC_EQL	,"{直接}" . E12)
		SetKana(KC_T | JP_YEN	,"{直接}" . E13)

	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_Q		,"{直接}" . D01)
		SetKana(KC_Y | KC_W		,"{直接}" . D02)
		SetKana(KC_Y | KC_E		,"{直接}" . D03)
		SetKana(KC_Y | KC_R		,"{直接}" . D04)
		SetKana(KC_Y | KC_T		,"{直接}" . D05)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_T | KC_Y		,"{直接}" . D06)
		SetKana(KC_T | KC_U		,"{直接}" . D07)
		SetKana(KC_T | KC_I		,"{直接}" . D08)
		SetKana(KC_T | KC_O		,"{直接}" . D09)
		SetKana(KC_T | KC_P		,"{直接}" . D10)
		SetKana(KC_T | KC_LBRC	,"{直接}" . D11)
		SetKana(KC_T | KC_RBRC	,"{直接}" . D12)

	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_A		,"{直接}" . C01)
		SetKana(KC_Y | KC_S		,"{直接}" . C02)
		SetKana(KC_Y | KC_D		,"{直接}" . C03)
		SetKana(KC_Y | KC_F		,"{直接}" . C04)
		SetKana(KC_Y | KC_G		,"{直接}" . C05)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_T | KC_H		,"{直接}" . C06)
		SetKana(KC_T | KC_J		,"{直接}" . C07)
		SetKana(KC_T | KC_K		,"{直接}" . C08)
		SetKana(KC_T | KC_L		,"{直接}" . C09)
		SetKana(KC_T | KC_SCLN	,"{直接}" . C10)
		SetKana(KC_T | KC_QUOT	,"{直接}" . C11)
		SetKana(KC_T | KC_NUHS	,"{直接}" . C12)

	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_Z		,"{直接}" . B01)
		SetKana(KC_Y | KC_X		,"{直接}" . B02)
		SetKana(KC_Y | KC_C		,"{直接}" . B03)
		SetKana(KC_Y | KC_V		,"{直接}" . B04)
		SetKana(KC_Y | KC_B		,"{直接}" . B05)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_T | KC_N		,"{直接}" . B06)
		SetKana(KC_T | KC_M		,"{直接}" . B07)
		SetKana(KC_T | KC_COMM	,"{直接}" . B08)
		SetKana(KC_T | KC_DOT	,"{直接}" . B09)
		SetKana(KC_T | KC_SLSH	,"{直接}" . B10)
		SetKana(KC_T | KC_INT1	,"{直接}" . B11)

; 第二面
	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_U | KC_1		,"{直接}" . E01S)
		SetKana(KC_Y | KC_U | KC_2		,"{直接}" . E02S)
		SetKana(KC_Y | KC_U | KC_3		,"{直接}" . E03S)
		SetKana(KC_Y | KC_U | KC_4		,"{直接}" . E04S)
		SetKana(KC_Y | KC_U | KC_5		,"{直接}" . E05S)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_R | KC_T | KC_6		,"{直接}" . E06S)
		SetKana(KC_R | KC_T | KC_7		,"{直接}" . E07S)
		SetKana(KC_R | KC_T | KC_8		,"{直接}" . E08S)
		SetKana(KC_R | KC_T | KC_9		,"{直接}" . E09S)
		SetKana(KC_R | KC_T | KC_0		,"{直接}" . E10S)
		SetKana(KC_R | KC_T | KC_MINS	,"{直接}" . E11S)
		SetKana(KC_R | KC_T | KC_EQL	,"{直接}" . E12S)
		SetKana(KC_R | KC_T | JP_YEN	,"{直接}" . E13S)

	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_U | KC_Q		,"{直接}" . D01S)
		SetKana(KC_Y | KC_U | KC_W		,"{直接}" . D02S)
		SetKana(KC_Y | KC_U | KC_E		,"{直接}" . D03S)
		SetKana(KC_Y | KC_U | KC_R		,"{直接}" . D04S)
		SetKana(KC_Y | KC_U | KC_T		,"{直接}" . D05S)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_R | KC_T | KC_Y		,"{直接}" . D06S)
		SetKana(KC_R | KC_T | KC_U		,"{直接}" . D07S)
		SetKana(KC_R | KC_T | KC_I		,"{直接}" . D08S)
		SetKana(KC_R | KC_T | KC_O		,"{直接}" . D09S)
		SetKana(KC_R | KC_T | KC_P		,"{直接}" . D10S)
		SetKana(KC_R | KC_T | KC_LBRC	,"{直接}" . D11S)
		SetKana(KC_R | KC_T | KC_RBRC	,"{直接}" . D12S)

	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_U | KC_A		,"{直接}" . C01S)
		SetKana(KC_Y | KC_U | KC_S		,"{直接}" . C02S)
		SetKana(KC_Y | KC_U | KC_D		,"{直接}" . C03S)
		SetKana(KC_Y | KC_U | KC_F		,"{直接}" . C04S)
		SetKana(KC_Y | KC_U | KC_G		,"{直接}" . C05S)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_R | KC_T | KC_H		,"{直接}" . C06S)
		SetKana(KC_R | KC_T | KC_J		,"{直接}" . C07S)
		SetKana(KC_R | KC_T | KC_K		,"{直接}" . C08S)
		SetKana(KC_R | KC_T | KC_L		,"{直接}" . C09S)
		SetKana(KC_R | KC_T | KC_SCLN	,"{直接}" . C10S)
		SetKana(KC_R | KC_T | KC_QUOT	,"{直接}" . C11S)
		SetKana(KC_R | KC_T | KC_NUHS	,"{直接}" . C12S)

	kanaGroup := "KL"	; 左手側
		SetKana(KC_Y | KC_U | KC_Z		,"{直接}" . B01S)
		SetKana(KC_Y | KC_U | KC_X		,"{直接}" . B02S)
		SetKana(KC_Y | KC_U | KC_C		,"{直接}" . B03S)
		SetKana(KC_Y | KC_U | KC_V		,"{直接}" . B04S)
		SetKana(KC_Y | KC_U | KC_B		,"{直接}" . B05S)
	kanaGroup := "KR"	; 右手側
		SetKana(KC_R | KC_T | KC_N		,"{直接}" . B06S)
		SetKana(KC_R | KC_T | KC_M		,"{直接}" . B07S)
		SetKana(KC_R | KC_T | KC_COMM	,"{直接}" . B08S)
		SetKana(KC_R | KC_T | KC_DOT	,"{直接}" . B09S)
		SetKana(KC_R | KC_T | KC_SLSH	,"{直接}" . B10S)
		SetKana(KC_R | KC_T | KC_INT1	,"{直接}" . B11S)

	; 設定がUSキーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver == "kbd101.dll")
	{
		SetKana(KC_T | KC_BSLS			,"{直接}" . E13)
		SetKana(KC_T | KC_GRV			,"{直接}" . C12)
		SetKana(KC_R | KC_T | KC_BSLS	,"{直接}" . E13S)
		SetKana(KC_R | KC_T | KC_GRV	,"{直接}" . C12S)
	}

	kanaGroup := "2L"
		; 固有名詞ショートカットを切り替える
		SetKana( KC_T | KC_1	, 1, "KoyuChange")	; 固有名詞ショートカット１
		SetKana( KC_T | KC_2	, 2, "KoyuChange")	; 固有名詞ショートカット２
		SetKana( KC_T | KC_3	, 3, "KoyuChange")	; 固有名詞ショートカット３
		SetKana( KC_T | KC_4	, 4, "KoyuChange")	; 固有名詞ショートカット４
		SetKana( KC_T | KC_5	, 5, "KoyuChange")	; 固有名詞ショートカット５

	kanaGroup := ""	; グループなし
	Return
}

; ----------------------------------------------------------------------
; 追加のホットキー
; ----------------------------------------------------------------------
+^sc0B::Suspend, On		; 薙刀式中断 Shift+Ctrl+0
+^sc02::Suspend, Off	; 薙刀式再開 Shift+Ctrl+1

; 新MS-IME使用で
#If (DetectIME() == "NewMSIME")
; 変換
sc79::Send, {sc79 9}
+sc79::Send, +{sc79 9}
#If		; End #If ()
