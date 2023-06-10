# Hachiku - Windows で薙刀式を使うスクリプト
2023年4月13日付[【薙刀式】最近の版をまとめてみる](http://oookaworks.seesaa.net/article/498994569.html#gsc.tab=0)
から、__薙刀式（4/13 D版）__ を Autohotkey に実装しました。  
ソースコードから実行します。  

---
パソコンの日本語キーボード、英語キーボードの設定に自動で合わせます。  
トレイアイコンを右クリックしたところに、縦書き・横書きモード切り替え、設定メニューがあります。  
レジストリの変更はしません。  
不要になったら Hachiku.exe と Hachiku.ini を削除してください。

キーカスタマイズができる IME では「Shift+Ctrl+変換キー」に「全確定」、「Shift+Ctrl+無変換キー」に「全消去」を割り当てると動作を改善できます。
## 実行ファイル(薙刀式v14集大成版)
https://github.com/tor-nky/Hachiku/releases
## ソースコードを直接実行する方法
ディレクトリ src の下にあるファイルをすべて保存します。  
Autohotkey をインストールし、ディレクトリ src にある Hachiku.ahk のスクリプトを実行してください。
# IME の設定
Hachiku のトレイアイコンを右クリックして設定を選び、IMEを選択します。
### 旧MS-IME
初期状態の設定のままでも使えますが、次の設定を行うと編集モードで選択範囲を意図せず消してしまうことがなくなります。
(全角英数などIMEオンでかな入力でないときのみ)

Microsoft IME の設定 → IME 入力モード切替の通知 → __オフ__: 画面中央に表示する

(キー設定をユーザー定義にしている場合)  
Microsoft IME の設定 → 詳細設定(A) → キー設定(Y)
|* キー|入力/変換済み文字なし|入力文字のみ|変換済み|候補一覧表示中|文節長変更中|変換済み文節内入力文字|
|---|:---:|:---:|:---:|:---:|:---:|:---:|
|半角/全角|IME-オン/オフ|__半英固定__|__半英固定__|__半英固定__|__半英固定__|__半英固定__|
|Ctrl+Shift+無変換| - |__全消去__|__全消去__|__全消去__|__全消去__|__全消去__|
|Ctrl+Shift+変換| - |__全確定__|__全確定__|__全確定__|__全確定__|__全確定__|

Ctrl+Shift+変換 は Ctrl+Enter を選択してキー追加すると簡単です。

そして Hachiku設定で「キー設定利用」をオンにしてください。
### 新MS-IME
IMEの設定に関係なく使えます。  
Hachiku設定「キー設定利用」は無視されます。
### ATOK
Hachiku のトレイアイコンを右クリックして設定を選び、ATOKを選択します。  
__必ず__ IMEの設定とキーカスタマイズをしてください。

ATOK プロパティ → 入力･変換 → 設定項目(Y) → 入力補助 → 特殊 → 設定一覧(L)
   - __なし__: 日本語入力オンで変更したモードを元に戻す

ATOK プロパティ → キー･ローマ字･色 → キーカスタマイズ(K)
|キー|機能|
|---|---|
|Shift+Esc|[_変換中_][_次候補表示中_]__変換取消__|
|Shift+Ctrl+変換|__Enter と同じ__|
|Shift+Ctrl+無変換|[_入力中_][_変換中_][_次候補表示中_][_文節区切り直し中_]__全文字削除__ [_全候補表示中_]__全候補選択取消__|
|半角／全角|[_文字未入力_][_記号入力_]日本語入力ON/OFF [_他_]__入力文字種半角無変換(A)__|

そして Hachiku設定で「キー設定利用」をオンにしてください。
### Google 日本語入力
初期状態の設定のままでも使えますが、次の設定を行うと編集モードで選択範囲を意図せず消してしまうことがなくなります。
(全角英数などIMEオンでかな入力でないときのみ)

|モード|入力キー|コマンド|
|---|:---:|:---:|
|変換前入力中|Ctrl Shift Henkan|確定|
|変換中|〃|〃|
|変換前入力中|Ctrl Shift Muhenkan|入力キャンセル|
|変換中|〃|〃|
|変換前入力中|Shift Muhenkan|全角英数に入力切替|
|変換中|〃|〃|
|入力文字なし|〃|〃|

そして Hachiku設定で「キー設定利用」をオンにしてください。
# 独自機能
* 方向キー、BS、Del を割り当てたキーにはリピートが働きます。
* Q+W に横書きモード、Q+A に縦書きモード を割り当て
* 編集モードD+F+H、J+K+Q、J+K+G、J+K+V、J+K+Bは、かな変換中かどうかを問いません。
* 固有名詞ショートカットに第二面（スペース押下）も設定できます。  
スペースキーを押したまま、そこから3つのキーを素早く押すと入力されます。
* 固有名詞ショートカットを最大５組切り替えられる。  
切り替えは E+R+1 で１番、E+R+2 で２番、など。  
「固有名詞登録」画面が出ているときに切り替えると、登録内容がコピーされます。
(OK を押すと登録されます)
* スペースキーにリピートを設定できる  
リピートで漢字変換が始まっても、文字キーを押せば変換を取り消して文字が入力されます。
* 「後置シフト」を設定可能
## 仕様
* かな入力中にアプリケーションのメニューをキーボードで操作できない  
英数入力に切り替えてください
* 記号入力、固有名詞ショートカットで不要な＿（アンダースコア）が入力されている。  
全角入力と半角入力モードでは、記号を入力する際に ＿（アンダースコア）→エンター→前文字削除 を送ることがあり、「元に戻す」と ＿が見えることがあります。設定によって発生しなくできます。
* 編集モードや固有名詞の入力でIME 入力モード切替の通知が出る。  
全角記号を出力するために一旦、IMEをオフにしているためです。IMEの設定でなくすことができます。
# 不具合
* (秀丸エディタ)「名前を付けて保存」で IMEオフの状態だと、2文字目以降に大文字を入力してから何も入力ができない
* 入力したキーがまれに無視される  
超高速で打鍵すると起きる可能性があります。
* (新MS-IME) かな変換中に英数入力に切り替え、確定しないでキーを押すと最初の文字が入力されない。  
新MS-IME の仕様です。
* (新MS-IME) かな入力できなくなったり、入力中のかなが消せなくなることがある  
まず、他のウインドウをマウスで選び、再び元のソフトに切り替えてください。  
それでも直らないときは、ファイルに保存してソフトを一度終了してください。
* (Google 日本語入力) 左右シフト英数に設定していると、左右シフトを離した後の英字がローマ字  
Google 日本語入力 が一時的に英数入力になっていることを検出できないからです。
* ブラウザで GitHub 上のファイルを直接編集すると、誤動作する編集モードがある  
[Issue #28](https://github.com/tor-nky/Hachiku/issues/28)
# 動作確認
* Windows 10 Home version 22H2 64-bit + AutoHotkey (v1.1.36.02) U64 Unicode 64-bit.bin  
新旧MS-IME、ATOK 2017、Google 日本語入力  
__AutoHotkey v2以降では使えません__

# 参考
* [【薙刀式】v14集大成版](http://oookaworks.seesaa.net/article/484704326.html#gsc.tab=0)
* [【薙刀式】v15（仮最終候補）](http://oookaworks.seesaa.net/article/495043083.html#gsc.tab=0)
* [【薙刀式】最新版で困らなくなってきた](http://oookaworks.seesaa.net/article/498162337.html#gsc.tab=0)
## src¥KanaTable¥*.ahk で使えるキーや記号の書き方
次の半角文字は書き換えが必要です。
```
0 → {0}
! → {!}
\# → {#}
^ → {^}
+ → {+}
` → ``
{ → {{}
} → {}}
" → ""
```
このほかの文字(全角文字も)はそのまま登録できます。

特殊キーは http://ahkwiki.net/Send のものが使えます。
```
{Enter} {Esc} {Space} {Tab} {BS} {Del} など
```
このほか、
```
{→} {->} {右} {←} {<-} {左} {↑} {上} {↓} {下}
{ペースト} {貼付} {貼り付け} {カット} {切取} {切り取り} {コピー}
{無変換} {変換} {ひらがな} {カタカナ} {改行} {後退} {取消} {削除}
{全角} {タブ} {空白} {メニュー} {Caps Lock} {Back Space}
{確定} {IMEOFF} {IMEON} {全英} {半ｶﾅ} {C_Clr} {C_Bkup} {C_Rstr}
```
などがあります。

ASCIIコード以外の文字や {直接} から後の文字列は、一度 IME をオフにして出力したあと IME を元に戻します。
## 動作速度
* 最初の読み込み
1～2秒程度
* 英数、かなの普通の文字(スペースを除く)
通常 10 ms 以内、エクスプローラー 78 ms 以内。
(ローマ字の文字数によって変わる)
* 記号
最大 0.7秒。
