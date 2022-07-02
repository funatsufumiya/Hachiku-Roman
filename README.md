﻿# Hachiku - Windows で薙刀式を使うスクリプト

[【薙刀式】v14集大成版](http://oookaworks.seesaa.net/article/484704326.html#gsc.tab=0) 2021年12月10日付

Autohotkey に実装しました。

パソコンの日本語キーボード、英語キーボードの設定に自動で合わせます。
トレイアイコンを右クリックしたところに、縦書き・横書きモード切り替え、設定メニューがあります。
レジストリの変更はしません。
不要になったら Hachiku.exe と Hachiku.ini を削除してください。

## 実行ファイル

https://github.com/tor-nky/Hachiku/releases

## ソースコードを修正した場合

ディレクトリ source の下にあるファイルをすべて保存します。

Autohotkey をインストールし、ディレクトリ source にある Hachiku.ahk のスクリプトを実行してください。

Ahk2Exe.exe でコンパイルする場合は、Unicode版で出力してください。

# IME の設定

### 旧MS-IME

初期状態の設定のままでも使えますが、次の設定を行うことをおすすめします。

IME 入力モード切替の通知  → オフ: 画面中央に表示する

キー設定： 半角+全角	→	[入力/変換文字なし]IMEオフ, [他]半英固定

### 新MS-IME

初期状態の設定で使います。

### ATOK または Google 日本語入力

Hachiku.ahk にあるコメントを読み、キー設定をしてください。
さらに Hachiku のトレイアイコンを右クリックして設定を選び、IMEを選択します。

# 独自機能

* 方向キーだけリピートが働きます。
* 編集モードD+F+H、J+K+G、J+K+V、J+K+Bは変換中かどうかを問いません。
* 編集モードM+Comma+W、M+Comma+S、M+Comma+F、M+Cooma+B (後からカッコ付け)の後、クリップボードは空になります。
* 固有名詞ショートカットにシフト面（スペース押下）も設定できます。

スペースキーを押したまま、そこから3つのキーを一定時間内に押すと入力されます。

* 固有名詞ショートカットを最大５組切り替えられる。切り替えは M+Comma+1 で１番、M+Comma+2 で２番、など。

「固有名詞登録」画面が出ているときに切り替えると、登録内容がコピーされます。
(OK を押すと登録されます)

* スペースキーにリピートを設定できる

リピートで漢字変換が始まっても、文字キーを押せば変換を取り消して文字が入力されます。

* 左右の小指シフトの機能を「英数」・「かな」から選べる
* 「後置シフト」を設定可能
* CapsLock がオンでも配列変換する

オリジナルの DvorakJ版では、CapsLock をオンにすると薙刀式になりません。

# 不具合

* 薙刀式に変換が正しく行われないことがある

64ビット版で実行ファイル化したものは、まれに同時押しの変換に失敗する。

Autohotkey v1.1.33.03～v1.1.34.01 の一部で、新MS-IME(Win10 2004以降の標準)＋秀丸エディタ＋ノートパソコン内蔵キーボード の組み合わせで約1000文字に1回程度、英字に化けるようです。→コード修正しましたが再検証できていません。

* IMEの設定変更をしなければ、編集モードや固有名詞の入力でIME 入力モード切替の通知が出る。

一部の記号を出力するために一旦、IMEをオフにしているためです。
MS-IMEをお使いでしたら、上の IME の設定を行うと消すことができます。

* 「選択範囲にカッコをつける」が正常に動作しないソフトがある。

* (新MS-IME) かな変換中に英数入力に切り替え、確定しないでキーを押すと最初の文字が入力されない。

新MS-IME の仕様です。

* (新MS-IME) メモ帳で一切かな入力できなくなる

メモ帳以外のウインドウをマウスで選び、もう一度メモ帳に切り替えても直らないことがあるので、他の IME や他のかな配列変更ソフトをお使いください。

* (Google 日本語入力) 左右シフト英数に設定していると、左右シフトを離した後の英字がローマ字のよう

Google 日本語入力 が一時的に英数入力になっていることを検出できないからです。

# 動作確認

* Windows 10 Home version 21H2 64-bit + AutoHotkey (v1.1.33.02) + 新旧MS-IME あるいは ATOK 2017

実行ファイル化は 32ビット版を使用

Windows 7 の頃の古いIMEでは記号、固有名詞ショートカットが正しく入力できないことがあります。

# 参考

* [【薙刀式】v14集大成版](http://oookaworks.seesaa.net/article/484704326.html#gsc.tab=0)
* [【薙刀式】v14仮のバグフィックス](http://oookaworks.seesaa.net/article/483884499.html#gsc.tab=0)
* [ 【薙刀式】v15 fix版（仮）](http://oookaworks.seesaa.net/article/486333027.html#gsc.tab=0)

## 詳細メニューを出現させるには

設定ファイル Hachiku.ini をエディタで下記のように編集します。そして、Hachiku を再起動してください。

[general]

AdvancedMenu=1

## src¥KanaTable¥*.ahk で使えるキーや記号の書き方

次の半角文字は書き換えが必要です。
* 0 → {0}
* ! → {!}
* \# → {#}
* ^ → {^}
* + → {+}
* ` → ``
* { → {{}
* } → {}}
* " → ""

このほかの文字(全角文字も)はそのまま登録できます。

特殊キーは http://ahkwiki.net/Send のものが使えます。

{Enter} {Esc} {Space} {Tab} {BS} {Del} など

このほか、
{→} {->} {右} {←} {<-} {左} {↑} {上} {↓} {下} {ペースト} {貼付} {貼り付け} {カット} {切取} {切り取り} {コピー} {無変換} {変換} {ひらがな} {カタカナ} {改行} {後退} {取消} {削除} {全角} {タブ} {空白} {メニュー} {Caps Lock} {Back Space}
{確定} {IMEOFF} {IMEON} {全英} {半ｶﾅ} {C_Clr} {C_Bkup} {C_Rstr} などを用意しました。

ASCIIコード以外の文字や {直接} から後の文字列は、一度 IME をオフにして出力し、最後に IME を元に戻します。

## 動作速度

* 最初の読み込み

２～３秒程度

* 英数、かなの普通の文字(スペースを除く)

通常 10 ms 以内、エクスプローラー 78 ms 以内。
(ローマ字の文字数によって変わる)

* 記号

最大 0.7秒。
