; **********************************************************************
; 【薙刀式】v15fix版、発表
; http://oookaworks.seesaa.net/article/500180437.html#gsc.tab=0
; (2023年7月28日)より
;
; DvorakJ版からの変更部分：
;	冗長シフトを削除
;	編集モードD+F+H、J+K+Q、J+K+G、J+K+V、J+K+Bは変換中かどうかを問わない
;	編集モードM+Comma+W、M+Comma+S、M+Comma+F、M+Cooma+B の動作後にはクリップボードは空になる。ダミーの空白も入らない。
;	固有名詞ショートカットの第二面（スペース押下）を追加
;	固有名詞ショートカットを最大５組を切り替えられる。切り替えは E+R+1 で１番、E+R+2 で２番、など。
;	Q+W に横書きモード、Q+A に縦書きモード を割り当て
; **********************************************************************

#Include %A_ScriptDir%/KanaTable/StandardLayout.ahk	; キーボード初期配列

; ----------------------------------------------------------------------
; 英数／かな配列の定義ファイル
;
;【縦書き用だけ書き、横書き用は自動変換する方法】
;
; 例：	SetKana( KC_Q | KC_L | KC_SPC		,"xwa"	, R)	; (ゎ)
;		~~~~~~~  ~~~~~~~~~~~~~~~~~~~~		  ~~~	  ~ 	  ~~~~
;		かな定義	スペース+Q+L	   縦書き用の出力 ↑	コメント
;													  ｜
;									リピートあり(省略はリピートなし)
;
; 例：	 SetEisu( KC_H | KC_J			,"{vkF2 2}" )		; IME ON
;		 ~~~~~~~
;		 英数定義
;
; 【縦書き用と横書き用を分けて書く方法】
;
; 例：	SetKana2(KC_J | KC_K | KC_Z		,"││{確定}", "──{確定}")
; 例：	SetEisu2(KC_J | KC_K | KC_Z		,"││{確定}", "──{確定}")
;		~~~~~~~  ~~~~~~~~~~~~~~~~~~		  ~~~~~~~~~~	~~~~~~~~~~
;		かな定義	   J+K+Z		   縦書き用の出力   横書き用の出力
;		英数定義
;
;	※ "(){確定}" はIMEに合わせ、"{一時半角}()" は半角になり、全角で定義した "（）" は全角になります
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

	layoutName := "薙刀式配列`nv15fix版"

	ReadStandardLayout()	; キーボード初期配列を読み込み

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
	SetEisu( AL_ヴ	,"vu"		)		; ヴ
	SetEisu( AL_き	,"ki"		)		; き
	SetEisu( AL_て	,"te"		)		; て
	SetEisu( AL_し	,"si"		)		; し
	SetEisu( AL_左	,"{←}"		, R)	; 左
	SetEisu( AL_右	,"{→}"		, R)	; 右
	SetEisu( AL_BS	,"{BS}" 	, R)	; 前文字削除
	SetEisu( AL_る	,"ru"		)		; る
	SetEisu( AL_す	,"su"		)		; す
	SetEisu( AL_へ	,"he"		)		; へ
	SetEisu( AL_ろ	,"ro"		)		; ろ
	SetEisu( AL_け	,"ke"		)		; け
	SetEisu( AL_と	,"to"		)		; と
	SetEisu( AL_か	,"ka"		)		; か
	SetEisu( AL_っ	,"xtu"		)		; (っ)
	SetEisu( AL_く	,"ku"		)		; く
	SetEisu( AL_あ	,"a"		)		; あ
	SetEisu( AL_い	,"i"		)		; い
	SetEisu( AL_う	,"u"		)		; う
	SetEisu( AL_ー	,"-"		)		; ー
	SetEisu( AL_ほ	,"ho"		)		; ほ
	SetEisu( AL_ひ	,"hi"		)		; ひ
	SetEisu( AL_は	,"ha"		)		; は
	SetEisu( AL_こ	,"ko"		)		; こ
	SetEisu( AL_そ	,"so"		)		; そ
	SetEisu( AL_た	,"ta"		)		; た
	SetEisu( AL_な	,"na"		)		; な
	SetEisu( AL_ん	,"nn"		)		; ん
	SetEisu( AL_ら	,"ra"		)		; ら
	SetEisu( AL_れ	,"re"		)		; れ

; センターシフト
	SetEisu( AL_ヴ | KC_SPC		,"vu"		)		; ヴ
	SetEisu( AL_ぬ | KC_SPC		,"nu"		)		; ぬ
	SetEisu( AL_り | KC_SPC		,"ri"		)		; り
	SetEisu( AL_ね | KC_SPC		,"ne"		)		; ね
	SetEisu( AL_左 | KC_SPC		,"+{←}"	, R)	; シフト + 左
	SetEisu( AL_右 | KC_SPC		,"+{→}"	, R)	; シフト + 右
	SetEisu( AL_さ | KC_SPC		,"sa"		)		; さ
	SetEisu( AL_よ | KC_SPC		,"yo"		)		; よ
	SetEisu( AL_え | KC_SPC		,"e"		)		; え
	SetEisu( AL_ゆ | KC_SPC		,"yu"		)		; ゆ
	SetEisu( AL_せ | KC_SPC		,"se"		)		; せ
	SetEisu( AL_め | KC_SPC		,"me"		)		; め
	SetEisu( AL_に | KC_SPC		,"ni"		)		; に
	SetEisu( AL_ま | KC_SPC		,"ma"		)		; ま
	SetEisu( AL_ち | KC_SPC		,"ti"		)		; ち
	SetEisu( AL_や | KC_SPC		,"ya"		)		; や
	SetEisu( AL_の | KC_SPC		,"no"		)		; の
	SetEisu( AL_も | KC_SPC		,"mo"		)		; も
	SetEisu( AL_つ | KC_SPC		,"tu"		)		; つ
	SetEisu( AL_ふ | KC_SPC		,"hu"		)		; ふ
	SetEisu( AL_ほ | KC_SPC		,"ho"		)		; ほ
	SetEisu( AL_ひ | KC_SPC		,"hi"		)		; ひ
	SetEisu( AL_を | KC_SPC		,"wo"		)		; を
	SetEisu( AL_、 | KC_SPC		,",{Enter}"	)		; 、
	SetEisu( AL_み | KC_SPC		,"mi"		)		; み
	SetEisu( AL_お | KC_SPC		,"o"		)		; お
	SetEisu( AL_。 | KC_SPC		,".{Enter}"	)		; 。
	SetEisu( AL_む | KC_SPC		,"mu"		)		; む
	SetEisu( AL_わ | KC_SPC		,"wa"		)		; わ
	SetEisu( AL_れ | KC_SPC		,"re"		)		; れ

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
	SetEisu( AL_左濁 | AL_さ	,"za"	)	; ざ
	SetEisu( AL_左濁 | AL_す	,"zu"	)	; ず
	SetEisu( AL_左濁 | AL_へ	,"be"	)	; べ
	SetEisu( AL_左濁 | AL_く	,"gu"	)	; ぐ
	SetEisu( AL_左濁 | AL_つ	,"du"	)	; づ
	SetEisu( AL_左濁 | AL_ふ	,"bu"	)	; ぶ
	SetEisu( AL_左濁 | AL_た	,"da"	)	; だ

; 左手の濁音
	SetEisu( AL_右濁 | AL_き	,"gi"	)	; ぎ
	SetEisu( AL_右濁 | AL_て	,"de"	)	; で
	SetEisu( AL_右濁 | AL_し	,"zi"	)	; じ
	SetEisu( AL_右濁 | AL_せ	,"ze"	)	; ぜ
	SetEisu( AL_右濁 | AL_け	,"ge"	)	; げ
	SetEisu( AL_右濁 | AL_と	,"do"	)	; ど
	SetEisu( AL_右濁 | AL_か	,"ga"	)	; が
	SetEisu( AL_右濁 | AL_ち	,"di"	)	; ぢ
	SetEisu( AL_右濁 | AL_ほ	,"bo"	)	; ぼ
	SetEisu( AL_右濁 | AL_ひ	,"bi"	)	; び
	SetEisu( AL_右濁 | AL_は	,"ba"	)	; ば
	SetEisu( AL_右濁 | AL_こ	,"go"	)	; ご
	SetEisu( AL_右濁 | AL_そ	,"zo"	)	; ぞ

;****************************
; 半濁音： 逆手の下段人差し指
; 連続シフト中も有効

; 右の半濁音
kanaGroup := "HA"
	SetEisu( AL_左半 | AL_へ	,"pe"	)	; ぺ
	SetEisu( AL_左半 | AL_ふ	,"pu"	)	; ぷ

; 左の半濁音
	SetEisu( AL_右半 | AL_ほ	,"po"	)	; ぽ
	SetEisu( AL_右半 | AL_ひ	,"pi"	)	; ぴ
	SetEisu( AL_右半 | AL_は	,"pa"	)	; ぱ

;****************************
; 小書き： Qと同時押し
kanaGroup := "KO"
	SetEisu( AL_小 | AL_よ	,"xyo"	)	; (ょ)
	SetEisu( AL_小 | AL_え	,"xe"	)	; (ぇ)
	SetEisu( AL_小 | AL_ゆ	,"xyu"	)	; (ゅ)
	SetEisu( AL_小 | AL_や	,"xya"	)	; (ゃ)
	SetEisu( AL_小 | AL_あ	,"xa"	)	; (ぁ)
	SetEisu( AL_小 | AL_い	,"xi"	)	; (ぃ)
	SetEisu( AL_小 | AL_う	,"xu"	)	; (ぅ)
	SetEisu( AL_小 | AL_お	,"xo"	)	; (ぉ)
	SetEisu( AL_小 | AL_わ	,"xwa"	)	; (ゎ)

;**********************************************
; 拗音、外来音(３キー同時を含む)
;**********************************************
;****************************
; 清音拗音; やゆよと同時押しで、ゃゅょが付く
kanaGroup := ""	; グループなし
	SetEisu( AL_き | AL_や	,"kya"	)	; きゃ
	SetEisu( AL_り | AL_や	,"rya"	)	; りゃ
	SetEisu( AL_し | AL_や	,"sya"	)	; しゃ
	SetEisu( AL_に | AL_や	,"nya"	)	; にゃ
	SetEisu( AL_ち | AL_や	,"tya"	)	; ちゃ
	SetEisu( AL_ひ | AL_や	,"hya"	)	; ひゃ
	SetEisu( AL_み | AL_や	,"mya"	)	; みゃ

	SetEisu( AL_き | AL_ゆ	,"kyu"	)	; きゅ
	SetEisu( AL_り | AL_ゆ	,"ryu"	)	; りゅ
	SetEisu( AL_し | AL_ゆ	,"syu"	)	; しゅ
	SetEisu( AL_に | AL_ゆ	,"nyu"	)	; にゅ
	SetEisu( AL_ち | AL_ゆ	,"tyu"	)	; ちゅ
	SetEisu( AL_ひ | AL_ゆ	,"hyu"	)	; ひゅ
	SetEisu( AL_み | AL_ゆ	,"myu"	)	; みゅ

	SetEisu( AL_き | AL_よ	,"kyo"	)	; きょ
	SetEisu( AL_り | AL_よ	,"ryo"	)	; りょ
	SetEisu( AL_し | AL_よ	,"syo"	)	; しょ
	SetEisu( AL_に | AL_よ	,"nyo"	)	; にょ
	SetEisu( AL_ち | AL_よ	,"tyo"	)	; ちょ
	SetEisu( AL_ひ | AL_よ	,"hyo"	)	; ひょ
	SetEisu( AL_み | AL_よ	,"myo"	)	; みょ

;****************************
; 濁音拗音
kanaGroup := "DA"
	SetEisu( AL_右濁 | AL_き | AL_や	,"gya"		)	; ぎゃ
	SetEisu( AL_右濁 | AL_し | AL_や	,"ja"		)	; じゃ
	SetEisu( AL_右濁 | AL_ち | AL_や	,"dya"		)	; ぢゃ
	SetEisu( AL_右濁 | AL_ひ | AL_や	,"bya"		)	; びゃ

	SetEisu( AL_右濁 | AL_き | AL_ゆ	,"gyu"		)	; ぎゅ
	SetEisu( AL_右濁 | AL_し | AL_ゆ	,"ju"		)	; じゅ
	SetEisu( AL_右濁 | AL_ち | AL_ゆ	,"dyu"		)	; ぢゅ
	SetEisu( AL_右濁 | AL_ひ | AL_ゆ	,"byu"		)	; びゅ

	SetEisu( AL_右濁 | AL_き | AL_よ	,"gyo"		)	; ぎょ
	SetEisu( AL_右濁 | AL_し | AL_よ	,"jo"		)	; じょ
	SetEisu( AL_右濁 | AL_ち | AL_よ	,"dyo"		)	; ぢょ
	SetEisu( AL_右濁 | AL_ひ | AL_よ	,"byo"		)	; びょ

;****************************
; 半濁音拗音
kanaGroup := "HA"
	SetEisu( AL_右半 | AL_ひ | AL_よ	,"pyo"		)	; ぴょ
	SetEisu( AL_右半 | AL_ひ | AL_ゆ	,"pyu"		)	; ぴゅ
	SetEisu( AL_右半 | AL_ひ | AL_や	,"pya"		)	; ぴゃ

;*************************************
; 外来音は3キー同時押しに統一しました
;*************************************
; 清音外来音は半濁音キーと使用二音の三音同時
; 濁音外来音は濁音キーと使用二音の三音同時
;****************************

; テ; ティテュディデュ
kanaGroup := "HA"
	SetEisu( AL_右半 | AL_て | AL_ゆ	,"thu"		)	; てゅ
	SetEisu( AL_右半 | AL_て | AL_い	,"thi"		)	; てぃ

kanaGroup := "DA"
	SetEisu( AL_右濁 | AL_て | AL_ゆ	,"dhu"		)	; でゅ
	SetEisu( AL_右濁 | AL_て | AL_い	,"dhi"		)	; でぃ

; ト; トゥドゥ
kanaGroup := "HA"
	SetEisu( AL_右半 | AL_と | AL_う	,"twu"		)	; とぅ
kanaGroup := "DA"
	SetEisu( AL_右濁 | AL_と | AL_う	,"dwu"		)	; どぅ

; シチ ェ; シェジェチェヂェ
kanaGroup := "HA"
	SetEisu( AL_右半 | AL_し | AL_え	,"sye"		)	; しぇ
	SetEisu( AL_右半 | AL_ち | AL_え	,"tye"		)	; ちぇ
kanaGroup := "DA"
	SetEisu( AL_右濁 | AL_し | AL_え	,"je"		)	; じぇ
	SetEisu( AL_右濁 | AL_ち | AL_え	,"dye"		)	; ぢぇ

;****************************
; フ; ファフィフェフォフュ
kanaGroup := "HA"
	SetEisu( AL_左半 | AL_ふ | AL_え	,"fe"		)	; ふぇ
	SetEisu( AL_左半 | AL_ふ | AL_ゆ	,"fyu"		)	; ふゅ
	SetEisu( AL_左半 | AL_ふ | AL_あ	,"fa"		)	; ふぁ
	SetEisu( AL_左半 | AL_ふ | AL_い	,"fi"		)	; ふぃ
	SetEisu( AL_左半 | AL_ふ | AL_お	,"fo"		)	; ふぉ

; ヴ; ヴァヴィヴェヴォヴュ
	SetEisu( AL_右半 | AL_ヴ | AL_え	,"ve"		)	; ヴぇ
	SetEisu( AL_右半 | AL_ヴ | AL_ゆ	,"vuxyu"	)	; ヴゅ
	SetEisu( AL_右半 | AL_ヴ | AL_あ	,"va"		)	; ヴぁ
	SetEisu( AL_右半 | AL_ヴ | AL_い	,"vi"		)	; ヴぃ
	SetEisu( AL_右半 | AL_ヴ | AL_お	,"vo"		)	; ヴぉ

; う; ウィウェウォ　い；イェ
	SetEisu( AL_左半 | AL_う | AL_え	,"we"		)	; うぇ
	SetEisu( AL_左半 | AL_う | AL_い	,"wi"		)	; うぃ
	SetEisu( AL_左半 | AL_う | AL_お	,"uxo"		)	; うぉ

	SetEisu( AL_左半 | AL_い | AL_え	,"ye"		)	; いぇ

; ツァ行はウァ行と被るが、ツァだけ被らないので定義
	SetEisu( AL_左半 | AL_つ | AL_あ	,"tsa"		)	; つぁ

; ク; クァクィクェクォ
	SetEisu( AL_左半 | AL_く | AL_え	,"kuxe"		)	; くぇ
	SetEisu( AL_左半 | AL_く | AL_あ	,"kuxa"		)	; くぁ
	SetEisu( AL_左半 | AL_く | AL_い	,"kuxi"		)	; くぃ
	SetEisu( AL_左半 | AL_く | AL_お	,"kuxo"		)	; くぉ
	SetEisu( AL_左半 | AL_く | AL_わ	,"kuxwa"	)	; くゎ

; グ; グァグィグェグォ
kanaGroup := "DA"
	SetEisu( AL_左濁 | AL_く | AL_え	,"guxe"		)	; ぐぇ
	SetEisu( AL_左濁 | AL_く | AL_あ	,"gwa"		)	; ぐぁ
	SetEisu( AL_左濁 | AL_く | AL_い	,"guxi"		)	; ぐぃ
	SetEisu( AL_左濁 | AL_く | AL_お	,"guxo"		)	; ぐぉ
	SetEisu( AL_左濁 | AL_く | AL_わ	,"guxwa"	)	; ぐゎ

;****************************
; IME ON/OFF
; HJ: ON / FG: OFF
; 無変換{vkF2sc070} ひらがなカタカナ{vk1Dsc07B}
; LANG1{vkF2}  LANG2{vk1D}
kanaGroup := ""	; グループなし
	SetEisu( KC_H | KC_J	,"{ひらがな}"		)	; IME ON
	SetEisu( KC_F | KC_G	,"{全角}"			)	; IME OFF

; Enter
; VとMの同時押し
kanaGroup := "HA"
	SetEisu( KC_V | KC_M	,"{Enter}"	)	; 行送り

;***********************************
;***********************************
; 編集モード、固有名詞ショートカット
;***********************************
;***********************************

; 編集モード１
; 中段人差し指＋中指を押しながら
; 「て」の部分は定義できない。「ディ」があるため
; 右手
kanaGroup := "1R"
	SetEisu( KC_D | KC_F | KC_Y		,"{Home}"		)		; Home
	SetEisu( KC_D | KC_F | KC_H		,"{確定}{End}"	)		; 確定End
	SetEisu( KC_D | KC_F | KC_N		,"{End}"		)		; End
	SetEisu( KC_D | KC_F | KC_U		,"+{End}{BS}"	)		; 文末消去
	SetEisu( KC_D | KC_F | KC_J		,"{↑}"			, R)	; ↑
	SetEisu( KC_D | KC_F | KC_M		,"{↓}"			, R)	; ↓
	SetEisu( KC_D | KC_F | KC_I		,"#/"			)		; 再
	SetEisu( KC_D | KC_F | KC_K		,"+{↑}"		, R)	; +↑
	SetEisu( KC_D | KC_F | KC_COMM	,"+{↓}"		, R)	; +↓
	SetEisu( KC_D | KC_F | KC_O		,"{Del}"		, R)	; Del
	SetEisu( KC_D | KC_F | KC_L		,"+{↑ 7}"		, R)	; +7↑
	SetEisu( KC_D | KC_F | KC_DOT	,"+{↓ 7}"		, R)	; +7↓
	SetEisu( KC_D | KC_F | KC_P		,"{Esc 3}",	  "ESCx3")	; 入力キャンセル
	SetEisu( KC_D | KC_F | KC_SCLN	,"^i"			)		; カタカナ
	SetEisu( KC_D | KC_F | KC_SLSH	,"^u"			)		; ひらがな


; 左手
kanaGroup := "1L"
	SetEisu( KC_J | KC_K | KC_Q		,"{確定}^{End}"		)	; 新
	SetEisu( KC_J | KC_K | KC_A		,"……{確定}"		)	; ……
	SetEisu( KC_J | KC_K | KC_Z		,"――{確定}"		)	; ──
	SetEisu( KC_J | KC_K | KC_W		,"『』{確定}{↑}"	)	; 『』
	SetEisu( KC_J | KC_K | KC_S		,"(){確定}{↑}"		)	; （）
	SetEisu( KC_J | KC_K | KC_X		,"【】{確定}{↑}"	)	; 【】
;	SetEisu( KC_J | KC_K | KC_E		,"dhi"				)	; ディ
	SetEisu( KC_J | KC_K | KC_D		,"?{確定}"			)	; ？
	SetEisu( KC_J | KC_K | KC_C		,"{!}{確定}"		)	; ！
	SetEisu( KC_J | KC_K | KC_R		,"^s"				)	; 保
	SetEisu( KC_J | KC_K | KC_F		,"[]{確定}{↑}"		)	; 「」
	SetEisu( KC_J | KC_K | KC_V		,"{確定}{↓}"		)	; 確定↓
	SetEisu( KC_J | KC_K | KC_T		,"/"				)	; ・未確定
	SetEisu( KC_J | KC_K | KC_G		,"《》{確定}{↑}"	)	; 《》
	SetEisu( KC_J | KC_K | KC_B		,"{確定}{←}"		)	; 確定←



; 編集モード２
; 下段人差指＋中指
; 右手
kanaGroup := "2R"
	SetEisu( KC_C | KC_V | KC_Y		,"+{Home}"	)		; +Home
	SetEisu( KC_C | KC_V | KC_H		,"^c"		)		; Copy
	SetEisu( KC_C | KC_V | KC_N		,"+{End}"	)		; +End
	SetEisu( KC_C | KC_V | KC_U		,"^x"		)		; Cut
	SetEisu( KC_C | KC_V | KC_J		,"{→}"		, R)	; →
	SetEisu( KC_C | KC_V | KC_M		,"{←}"		, R)	; ←
	SetEisu( KC_C | KC_V | KC_I		,"^v"		)		; Paste
	SetEisu( KC_C | KC_V | KC_K		,"+{→}"	, R)	; +→
	SetEisu( KC_C | KC_V | KC_COMM	,"+{←}"	, R)	; +←
	SetEisu( KC_C | KC_V | KC_O		,"^y"		)		; Redo
	SetEisu( KC_C | KC_V | KC_L		,"+{→ 5}"	, R)	; +→5
	SetEisu( KC_C | KC_V | KC_DOT	,"+{← 5}"	, R)	; +←5
	SetEisu( KC_C | KC_V | KC_P		,"^z"		)		; Undo
	SetEisu( KC_C | KC_V | KC_SCLN	,"+{→ 20}"	)		; +→20
	SetEisu( KC_C | KC_V | KC_SLSH	,"+{← 20}"	)		; +←20


; 左手
kanaGroup := "2L"
	SetEisu( KC_M | KC_COMM | KC_Q	,"{Home}{→}{End}{Del 4}{←}"			)	; 前行につける(ト書き)
	SetEisu( KC_M | KC_COMM | KC_A	,"{Home}{→}{End}{Del 2}{←}"			)	; 前行につける(セリフ)
	SetEisu( KC_M | KC_COMM | KC_Z	,"　　　×　　　×　　　×{確定}{改行}"	)	; x   x   x
	SetEisu( KC_M | KC_COMM | KC_W	,"^x『^v』{確定}{C_Clr}"				)	; +『』
	SetEisu( KC_M | KC_COMM | KC_S	,"^x(^v){確定}{C_Clr}"					)	; +（）
	SetEisu( KC_M | KC_COMM | KC_X	,"^x【^v】{確定}{C_Clr}"				)	; +【】
	SetEisu( KC_M | KC_COMM | KC_E	,"{Home}{改行}　　　{←}"				)	; 行頭そろえ(ト書き)
	SetEisu( KC_M | KC_COMM | KC_D	,"{Home}{改行}　{←}"					)	; 行頭そろえ(セリフ)
	SetEisu( KC_M | KC_COMM | KC_C	,"／{確定}"								)	; ／
	SetEisu( KC_M | KC_COMM | KC_R	,"　　　"								)	; □□□
	SetEisu( KC_M | KC_COMM | KC_F	,"^x[^v]{確定}{C_Clr}"					)	; +「」
	SetEisu( KC_M | KC_COMM | KC_V	,"{確定}{End}{改行}[]{確定}{↑}"		)	; 確定「」
	SetEisu( KC_M | KC_COMM | KC_T	,"〇{確定}"								)	; ○
	SetEisu( KC_M | KC_COMM | KC_G	,"^x｜{確定}^v《》{確定}{↑}{C_Clr}"	)	; +｜《》
	SetEisu( KC_M | KC_COMM | KC_B	,"{確定}{End}{改行}　"					)	; 確定□



kanaGroup := ""	; グループなし
	SetEisu( KC_Q | KC_W	,"Null"	,"横書き")
	SetEisu( KC_Q | KC_A	,"Null"	,"縦書き")


	; 設定がUSキーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver = "kbd101.dll")
	{
	; おまけ

		SetEisu( JP_YEN				,"\"	)	; ￥
		SetEisu( JP_YEN | KC_SPC	,"|"	)	; ｜	スペース押しながら
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
;	SetEisu( KC_SPC |  KC_SCLN	,"{sc28}"	)	; :	(薙刀式で使用)
	SetEisu( KC_SPC | KC_QUOT	,"+{sc03}"	)	; "
	SetEisu( KC_SPC | KC_NUHS	,"+{sc0D}"	)	; ~

	; 設定がPC-9800キーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver = "kbdnec.dll")
	{

		SetEisu( KC_NUHS			,"+{sc0D}"	)	; `
		SetEisu( KC_NUHS | KC_SPC	,"+{sc1A}"	)	; ~
	}

	Return
}

; 固有名詞ショートカットの登録
KoyuRegist()	; () -> Void
{
	#IncludeAgain %A_ScriptDir%/Sub/KeyBit_h.ahk	; 配列定義で使う定数
	#IncludeAgain %A_ScriptDir%/Sub/Naginata-Koyu_h.ahk

;**************************************
; 固有名詞ショートカット
; 薙刀式のカナで始まる言葉を登録すると使いやすい */

; 第一面
; UIを押しながら左手*/
	kanaGroup := "KL"	; 左手側
		SetEisu(KC_U | KC_I | KC_1		,"{直接}" . E01)
		SetEisu(KC_U | KC_I | KC_2		,"{直接}" . E02)
		SetEisu(KC_U | KC_I | KC_3		,"{直接}" . E03)
		SetEisu(KC_U | KC_I | KC_4		,"{直接}" . E04)
		SetEisu(KC_U | KC_I | KC_5		,"{直接}" . E05)

		SetEisu(KC_U | KC_I | KC_Q		,"{直接}" . D01)
		SetEisu(KC_U | KC_I | KC_W		,"{直接}" . D02)
		SetEisu(KC_U | KC_I | KC_E		,"{直接}" . D03)
		SetEisu(KC_U | KC_I | KC_R		,"{直接}" . D04)
		SetEisu(KC_U | KC_I | KC_T		,"{直接}" . D05)

		SetEisu(KC_U | KC_I | KC_A		,"{直接}" . C01)
		SetEisu(KC_U | KC_I | KC_S		,"{直接}" . C02)
		SetEisu(KC_U | KC_I | KC_D		,"{直接}" . C03)
		SetEisu(KC_U | KC_I | KC_F		,"{直接}" . C04)
		SetEisu(KC_U | KC_I | KC_G		,"{直接}" . C05)

		SetEisu(KC_U | KC_I | KC_Z		,"{直接}" . B01)
		SetEisu(KC_U | KC_I | KC_X		,"{直接}" . B02)
		SetEisu(KC_U | KC_I | KC_C		,"{直接}" . B03)
		SetEisu(KC_U | KC_I | KC_V		,"{直接}" . B04)
		SetEisu(KC_U | KC_I | KC_B		,"{直接}" . B05)

; ERを押しながら右手
	kanaGroup := "KR"	; 右手側
		SetEisu(KC_E | KC_R | KC_6		,"{直接}" . E06)
		SetEisu(KC_E | KC_R | KC_7		,"{直接}" . E07)
		SetEisu(KC_E | KC_R | KC_8		,"{直接}" . E08)
		SetEisu(KC_E | KC_R | KC_9		,"{直接}" . E09)
		SetEisu(KC_E | KC_R | KC_0		,"{直接}" . E10)
		SetEisu(KC_E | KC_R | KC_MINS	,"{直接}" . E11)
		SetEisu(KC_E | KC_R | KC_EQL	,"{直接}" . E12)
		SetEisu(KC_E | KC_R | JP_YEN	,"{直接}" . E13)

		SetEisu(KC_E | KC_R | KC_Y		,"{直接}" . D06)
		SetEisu(KC_E | KC_R | KC_U		,"{直接}" . D07)
		SetEisu(KC_E | KC_R | KC_I		,"{直接}" . D08)
		SetEisu(KC_E | KC_R | KC_O		,"{直接}" . D09)
		SetEisu(KC_E | KC_R | KC_P		,"{直接}" . D10)
		SetEisu(KC_E | KC_R | KC_LBRC	,"{直接}" . D11)
		SetEisu(KC_E | KC_R | KC_RBRC	,"{直接}" . D12)

		SetEisu(KC_E | KC_R | KC_H		,"{直接}" . C06)
		SetEisu(KC_E | KC_R | KC_J		,"{直接}" . C07)
		SetEisu(KC_E | KC_R | KC_K		,"{直接}" . C08)
		SetEisu(KC_E | KC_R | KC_L		,"{直接}" . C09)
		SetEisu(KC_E | KC_R | KC_SCLN	,"{直接}" . C10)
		SetEisu(KC_E | KC_R | KC_QUOT	,"{直接}" . C11)
		SetEisu(KC_E | KC_R | KC_NUHS	,"{直接}" . C12)

		SetEisu(KC_E | KC_R | KC_N		,"{直接}" . B06)
		SetEisu(KC_E | KC_R | KC_M		,"{直接}" . B07)
		SetEisu(KC_E | KC_R | KC_COMM	,"{直接}" . B08)
		SetEisu(KC_E | KC_R | KC_DOT	,"{直接}" . B09)
		SetEisu(KC_E | KC_R | KC_SLSH	,"{直接}" . B10)
		SetEisu(KC_E | KC_R | KC_INT1	,"{直接}" . B11)

	; 設定がUSキーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver == "kbd101.dll")
	{
		SetEisu(KC_E | KC_R | KC_BSLS	,"{直接}" . E13)
		SetEisu(KC_E | KC_R | KC_GRV	,"{直接}" . C12)
	}

; 第二面
; UIを押しながら左手*/
	kanaGroup := "KL"	; 左手側
		SetEisu(KC_SPC | KC_U | KC_I | KC_1	,"{直接}" . E01S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_2	,"{直接}" . E02S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_3	,"{直接}" . E03S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_4	,"{直接}" . E04S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_5	,"{直接}" . E05S)

		SetEisu(KC_SPC | KC_U | KC_I | KC_Q	,"{直接}" . D01S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_W	,"{直接}" . D02S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_E	,"{直接}" . D03S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_R	,"{直接}" . D04S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_T	,"{直接}" . D05S)

		SetEisu(KC_SPC | KC_U | KC_I | KC_A	,"{直接}" . C01S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_S	,"{直接}" . C02S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_D	,"{直接}" . C03S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_F	,"{直接}" . C04S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_G	,"{直接}" . C05S)

		SetEisu(KC_SPC | KC_U | KC_I | KC_Z	,"{直接}" . B01S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_X	,"{直接}" . B02S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_C	,"{直接}" . B03S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_V	,"{直接}" . B04S)
		SetEisu(KC_SPC | KC_U | KC_I | KC_B	,"{直接}" . B05S)

; ERを押しながら右手
	kanaGroup := "KR"	; 右手側
		SetEisu(KC_SPC | KC_E | KC_R | KC_6		,"{直接}" . E06S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_7		,"{直接}" . E07S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_8		,"{直接}" . E08S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_9		,"{直接}" . E09S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_0		,"{直接}" . E10S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_MINS	,"{直接}" . E11S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_EQL	,"{直接}" . E12S)
		SetEisu(KC_SPC | KC_E | KC_R | JP_YEN	,"{直接}" . E13S)

		SetEisu(KC_SPC | KC_E | KC_R | KC_Y		,"{直接}" . D06S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_U		,"{直接}" . D07S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_I		,"{直接}" . D08S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_O		,"{直接}" . D09S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_P		,"{直接}" . D10S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_LBRC	,"{直接}" . D11S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_RBRC	,"{直接}" . D12S)

		SetEisu(KC_SPC | KC_E | KC_R | KC_H		,"{直接}" . C06S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_J		,"{直接}" . C07S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_K		,"{直接}" . C08S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_L		,"{直接}" . C09S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_SCLN	,"{直接}" . C10S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_QUOT	,"{直接}" . C11S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_NUHS	,"{直接}" . C12S)

		SetEisu(KC_SPC | KC_E | KC_R | KC_N		,"{直接}" . B06S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_M		,"{直接}" . B07S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_COMM	,"{直接}" . B08S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_DOT	,"{直接}" . B09S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_SLSH	,"{直接}" . B10S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_INT1	,"{直接}" . B11S)

	; 設定がUSキーボードの場合	参考: https://ixsvr.dyndns.org/blog/764
	If (keyDriver == "kbd101.dll")
	{
		SetEisu(KC_SPC | KC_E | KC_R | KC_BSLS	,"{直接}" . E13S)
		SetEisu(KC_SPC | KC_E | KC_R | KC_GRV	,"{直接}" . C12S)
	}

; 固有名詞ショートカットを切り替える
	kanaGroup := ""	; グループなし
		SetEisu( KC_E | KC_R | KC_1	, 1, "KoyuChange")	; 固有名詞ショートカット１
		SetEisu( KC_E | KC_R | KC_2	, 2, "KoyuChange")	; 固有名詞ショートカット２
		SetEisu( KC_E | KC_R | KC_3	, 3, "KoyuChange")	; 固有名詞ショートカット３
		SetEisu( KC_E | KC_R | KC_4	, 4, "KoyuChange")	; 固有名詞ショートカット４
		SetEisu( KC_E | KC_R | KC_5	, 5, "KoyuChange")	; 固有名詞ショートカット５

	Return
}

; ----------------------------------------------------------------------
; 追加のホットキー
; ----------------------------------------------------------------------
+^sc0B::Suspend, On		; 薙刀式中断 Shift+Ctrl+0
+^sc02::Suspend, Off	; 薙刀式再開 Shift+Ctrl+1
