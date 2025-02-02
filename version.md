## おもな修正履歴

### 2023年8月19日 v1.11.1
* Edge の文字が入力できないところで「ひらがな」「カタカナ」を定義したキーを押すと、かな入力オンになっていたので修正  
反対に、入力できるところでオンにしたまま入力できないところをクリックすると、かな入力オンのままになる。前もってオフにするより他はない。

### 2023年8月18日 v1.11
* IME_GetConvMode() の値が 0 になった直後を英数モードに  
Excel で右クリックした時のメニューでは IME の状態が取れないが、すぐ英数入力にしたい。  
Excel、PowerPoint のコメント欄も IME の状態が取れないので一度英数モードになるが、かな入力に切り替えることはできる。

### 2023年8月18日 v1.10.4
* IME の状態の検出を間違うことがあったので修正
* Shift+矢印 → Shift+矢印 でShiftがバタバタしないようにした
* 一太郎のカーソル移動対策  
ジャストシステム製品は矢印キーの上げ下げをエミュレートしない方が良いらしい
* かな定義がアルファベットかハイフンだけなら {? down}{? up} 形式で出力して、入力の取りこぼしを軽減

### 2023年8月16日 v1.10.3
* Excel の日本語入力を無効にしたセル上で、IMEオフにならなくなっていたので修正

### 2023年8月11日 v1.10.2
* (旧MS-IMEでキー設定利用すると)開き括弧、閉じ括弧を書いて中に入るような定義がうまく動作しないことがあったので改善  
ATOK、Google日本語入力、秀丸エディタを使わない、全角英数入力にしない大多数の人には、キー設定利用をしない方が動作が速くなります。

### 2023年8月5日 v1.10.1
* 新MS-IME のキーテンプレート「ATOK」ではIMEオン、IMEオフ が使えなかったので改善
* PC-9801キーボードでは Shift+Ctrl+無変換 のキー設定を使えないので対策

### 2023年7月31日 v1.10
* IME_GetConvMode() が 0 を返す場合への対応  
Excel、PowerPoint のコメント欄にかな入力できます  
編集モードには一部のみの対応です
* メモ帳にはゆっくり出力する  
Windows 11 版への対応です
* v.1.19.12 の変更で、上キー、下キーの回数指定がうまく働かなくなったので対策
* 設定ファイルに規定外の値が書かれていたら初期値にする

### 2023年7月24日 v1.9.13
* Windows 11 の標準MS-IMEで "{確定}" を含むキーを押すと、余計な改行が起きることがあったので対策
* IMEを変えたことを設定した直後に、正しく反映されないことがあるのを修正

### 2023年7月13日 v1.9.12
* Microsoft 365版 OneNote で上キー、下キーが働かなくなることの対策
* ATOKとGoogle日本語入力の入力モードによっては、意図せずユニコードを変換してしまうので対策  
低速だが確実な v1.9-beta.16 以前の方法に戻した
* 固有名詞ショートカットに {→} など方向を表すものを入れると、横書き用で向きが変わっていたので修正

### 2023年7月3日 v1.9.11
* 一時IMEをオフにした間にアスキー文字を出力すると、IMEを元に戻したときにシフトが押されたままになることがあるので修正
* テストモードで、「文字出力後に IME の状態を検出しない時間」を設定できるようにした

### 2023年6月3日 v1.9.10
* 定義が"{確定}"から始まるときは、ATOKには"{確定}"を2度出力する  
「全候補表示」中は、一回では「確定」しないので対策
* まれに、かな入力が英字になることがあるので修正

### 2023年3月12日 v1.9.9
* 文字キーシフト「ずっと」の設定で、F押→K押→O押が「かいず」とならないなどを修正

### 2023年1月28日 v1.9.8
* ~~ロールオーバー入力で[入力したキーが無視される](https://github.com/tor-nky/Hachiku/issues/33)ことがあったのを改善~~ v1.9.9で解消しました
* 文字キーシフト「途切れるまで」の設定で、「ぶがい」をロールオーバーで書けるように  
濁音の繰り返しがつながらなかくて、編集モードになっていたのを1キー文字になるようにした
* 「あ→れ」では、「あ」が確定するので「れ」で2キー同時の検索は不要  
次の文字を打ったことで直前の1キー文字が確定したら、2キー同時以上の検索をしないようにした

### 2022年12月28日 v1.9.7
* ディレイ再調整

### 2022年12月11日 v1.9.6
* 変換1回目のIME窓検出用フラグが入のままになることがあった  
JK+D「？」、JK+C「！」の直後にスペースキーを押すと、IME窓の検出が当てにならないと誤判定した
* DF+P「入力キャンセル」の動作の修正

### 2022年12月11日 v1.9.5
* 対応しているどのIMEでも、かな入力中なら _{確定}_ で選択範囲を消さないように修正  
ただし、Google日本語入力では半角カタカナには対応していません
* 編集モードをより失敗しにくく調整した

### 2022年12月4日 v1.9.4
* 秀丸エディタをGoogle日本語入力で使うと、薙刀式v14のJK+FとJK+Gなどが動作しないのを修正  
編集モード内にある、{Enter}からの文字入力ができなかった  
v1.9.1 でGoogle日本語入力でも、IMEをオフにしないで編集モードの記号を出すようにしたせいでした

### 2022年12月4日 v1.9.3
* 秀丸エディタを新旧MS-IMEで使うと、JK+F で「」内にカーソルが入らないことがあるのを修正

### 2022年11月21日 v1.9.2
* v1.9.1 の修正が、_{確定}_ から始まるかな定義でも _{Enter}_ で置き換えていたので修正
* Google日本語入力以外でかな入力中なら、_{確定}_ で選択範囲を消さないように修正  
Google日本語入力のとき、あるいは IMEオンで英数入力中でも選択範囲を消さないようにするには、キー設定利用 (Ctrl+Shift+無変換⇒全消去、Ctrl+Shift+変換⇒全確定) 可能な IME をご利用ください
* Google日本語入力と Visual Studio Code とで「選択範囲を括弧で括る」を正常に動くようにした
* ATOK に加えて Google日本語入力でも、IMEをオフにしないで編集モードの記号を出すようにして高速化  

### 2022年11月3日 v1.9.1
* かな定義の中にある _アスキー文字→{確定}_ の _{確定}_ は _{Enter}_ で置き換える  
なお、__Ctrl+Shift+変換⇒全確定__ のキー設定が優先される

### 2022年10月22日 v1.9
* 設定メニューの書き換え

### 2022年10月19日 v1.9-beta.20
* 別の英語配列を使っていて、固有名詞セットを変えたときにツールチップに英語配列が反映されるようにした
* 設定メニューの書き換え

### 2022年10月10日 v1.9-beta.19
* キーを上げて同グループ優先が白紙になる条件を追加  
1キー決まりの定義にグループを設定すると、同時押しが不可能になるバグがあった

### 2022年10月10日 v1.9-beta.18
* キー設定利用 (Ctrl+Shift+無変換⇒全消去、Ctrl+Shift+変換⇒全確定) を隠しメニュー（詳細メニュー）内の選択制にし、利用しないのを初期設定にした

### 2022年9月20日 v1.9-beta.17
* 後置シフトでリピートを使うと Shift+Space の連続になるのを修正
* 秀丸エディタで、スペースキーを押してもカーソル移動が止まらない可能性を潰した
* スペースキーを押しているときの左右シフトを、空白キャンセルとして使えるようにした
* ATOK ではIMEをオフにしないで編集モードの記号を出すようにして高速化

### 2022年9月9日 v1.9-beta.16
* 判定期限を設けると、「キーを離すとシフト全復活」が働かない不具合を解消 
* 固有名詞を定義していないキーバインドでは普通のかなを出力するようにした  
定義を不要なのに登録していたためです
* ~~ATOK と Google日本語入力では、IMEをオフにしないで編集モードの記号を出すようにして高速化~~  
Visual Studio Code で「選択範囲を括弧で括る」が正常に動かず、元の方法に戻す

### 2022年8月30日 v1.9-beta.15
* Windows 11 の標準(新)MS-IME への対応
* IME操作ができる {vk19} のような定義の取り扱いを追加
* 下記の仕様変更で不要になったコードを削除  
旧MS-IME、ATOK、Google日本語入力 で Shift+Ctrl+変換キー を Enterキー と同じキー設定にしたこと(_v1.9-beta.12_)  
IME状態の取得をする前になるべく Sleep を使わない(_v1.9-beta.14_)

### 2022年8月22日 v1.9-beta.14
* 英語配列を変えているときはトレイチップに表示
* 設定「英数入力時のSandS」をオフにすると大文字が書けなくなっていたので修正
* ATOK で貼り付けを含む編集モードを使えるようにした
* IME状態の取得をする前になるべく Sleep を使わないようにした  
~~新MS-IMEで Sleep を使った後に、IME状態を正しく取得できないことがあるためです。~~効果はありませんでした。

### 2022年8月9日 v1.9-beta.13
* Issue #18 の改修で不具合があったので直した

### 2022年7月31日 v1.9-beta.12
* 旧MS-IME、ATOK、Google日本語入力 では Shift+Ctrl+変換キー を Enterキー と同じキー設定にすることで
{確定}する際に選択範囲を消さなくて済むようにした
(v1.9-beta.11 と方式を変えました)
* 文字キーシフト「同グループのみ継続」を改善(Issue #18)
* IME窓の検出が当てにできるかの調べるのに、スリープ利用からタイマーに変えてスペースキーの反応を改善した
* 変数名変更
* 関数 StoreBuf() の引数順変更

### 2022年7月17日 v1.9-beta.11
* Google日本語入力で、{確定}する際に選択範囲を消さなくする

### 2022年7月17日 v1.9-beta.10
多数のソフトウェアで正常に動作しないため、廃止

### 2022年7月9日 v1.9-beta.9
* 同時押しのキーを全部離してからキーを押したときの検索の無駄をなくした
* 配列を読み直すときにはトレイアイコンを変える
* 「キーを離せば常に全部出力する」を標準で切るにした(Issue #23)

### 2022年7月2日 v1.9-beta.8
* 各種ディレイを調整
* 英数→かな、または かな→英数 の次のキーを新しいモードで処理

シフト+英数 で一時的に英数入力し改行となるキーからのロールオーバーしても、かな入力にならない不具合が残っています。

### 2022年6月9日 v1.9-beta.7
* ゲームモードの暴発を低減

### 2022年6月8日 v1.9-beta.6
* 薙刀式中断・再開で左右シフトが残る現象を対策 → ゲームモード暴発が増えた
* 1字ごとに Sleep, -1 または Sleep, 0 を入れられるようにした

### 2022年5月17日 v1.9-beta.5
* 秀丸エディタで"＿"が残る問題を修正

### 2022年5月15日 v1.9-beta.4
* 秀丸エディタでのディレイを修正

### 2022年5月7日 v1.9-beta.3
* Google 日本語入力対応の設定を追加
* 左右のシフトを押しながらアルファベットを押すと、一時的に半角英数入力ができるのを初期設定とした。（左右シフト「英数」）
* 「ので」を打ちやすくしていたのを、初期設定では DvorakJ 版に合わせるために取りやめた。

### 2022年3月28日 v1.8.5
* ATOKで「後でカッコ付け」が失敗する問題を解消

### 2022年3月21日 v1.8.4
* 編集モードの記号入力の速度改善(ブラウザを除く)
* 「後からカッコ付け」の動作修復

### 2022年3月19日 v1.8.3
* IME窓検知の修復
* ブラウザ上でGitHubのファイル修正するときに、編集モードの記号入力が予期せぬ動作を引き起こさないようにした。

### 2022年3月6日 v1.8.2
* 「以前のバージョンの Microsoft IME を使う」設定があるのに一度もオンにしたことがないパソコンで不具合を修正
* 「シフト+スペース」と「シフト+矢印」と、押した後の動作修正

### 2022年3月3日 v1.8.1
* 縦書き・横書きでタスクトレイのアイコンが変化するようにした
* Hachiku があるパス名にスペースが含まれると iniファイルの読み書きができなかったのを修正

### 2022年3月1日 v1.8

* 秀丸エディタのカーソル加速への対応(方向キーのリピートが、キーを上げることなく連打するように)
* 左右シフト「英数２」にした時のレジストリの編集を不要にした
* 設定によっては、キーの上げ下げのタイミングから出力が持ち越しになってしまう不具合を解消
* 左右シフトを押しながら英字を入力し始め、わずかでも間をおいてから超高速で英字を入力したときは、ローマ字にならなくした

間を開けずに、超高速英字入力すると誤作動を避けられません。

### 2022年2月6日 v1.7.6
* 「後置シフトの待ち時間」「同時打鍵判定」の時間が「未満」だったのを「以下」にした
* ログ表示(直前のキー入力31個分)を追加
* 新MS-IMEで、変換候補窓が最大のときに、確定せず編集モードの記号を入力すると、未変換のまま記号が前に入るを修正
* 配列変換しないでまれに素通りするのを対策
* テストモードを見えなくした

### 2022年1月4日 v1.7.5
* 後置シフト、同時打鍵判定 Issue #21 の修正
* タイマー割込みとキー割込みの行き違いが起きうる Issue #19 のを修正
* 文字キーシフト「同グループのみ継続」の動作を再修正

### 2021年12月31日 v1.7.3
* 1キー→2キー の時、1キーの文字が確定しているのに出力されなかったので修正
薙刀式で、I押→J押→E押 の時点で「る」は出力したい。「で」はまだ確定していない。

### 2021年12月29日 v1.7.2
* 文字キーシフト「同グループのみ継続」の動作を修正
* キーリピートが始まる時に2文字出力されることがないようにした

### 2021年12月20日 v1.7.1
* 入力取りこぼしを減らした

### 2021年12月11日 v1.7

### 2021年11月23日
* 英数時の同時打鍵期限を強制する設定を作った

### 2021年11月3日
* スペースキーの長押しを 0: 何もしない, 1: 空白キャンセル, 2: 空白リピート から設定で選ぶ
* 詳細メニューの変更
1. 同時打鍵の判定期限を通常面、スペース押下時それぞれでオンオフ切り替え可能に
2. 文字キーシフトを 0: ずっと, 1: 途切れるまで, 2: 同グループのみ継続, 3: 1回のみ から選べる
3. キーを離したときに文字キーシフトを 0: 全復活, 1: そのまま, 2: 全解除 から選べる
4. これまで「出力済みのキーを上げても全部出力する」だけだったが、しなくもできる
* かな定義に使えるものを追加
1. {NoIME}、{UndoIME}：
{NoIME} でユニコード文字を出力するために入力モードを控えてから IMEオフ にし、対する {UndoIME} は IMEオンにして入力モードを元に戻す。
通常、ユニコード文字が定義にあると自動で適用されるので、IME にローマ字を渡して入力モードに合わせた変換をしたいときなどに {UndoIME} を使う。
2. {IMEOFF}：
IME.ahk の関数で IMEオフ にする
3. {IMEON}：
IME.ahk の関数で IMEオン にする
4. {全英}：
IME.ahk の関数で 全角英数入力モード にする
5. {半ｶﾅ}：
IME.ahk の関数で 半角カタカナモード にする

### 2021年10月24日
 * (10日より)IME窓の有無をIME.ahkを使って判定していいかを見極めるルーチンを追加、(24日)見極めの精度を上げた

### 2021年10月17日
* 英数入力時のSandSをオフにする設定項目を作った

### 2021年10月2日
* 縦書き・横書きでまるで違う定義を登録する関数を追加

SetKana2(キービットの集合, 縦書き, 横書き, コントロール)

SetEisu2(キービットの集合, 縦書き, 横書き, コントロール)

従来からの SetKana()、SetEisu() は縦書き用からカーソル移動の向きを変換しています。

### 2021年10月1日
* スペースキーのリピートをオンオフできる設定を追加

スペースキーのリピート中の日本語入力は、変換取消してシフト側文字が出力されます。

### 2021年9月21日
* 固有名詞ショートカットのシフト面（スペース押下）を追加

### 2021年9月8日
* 配列の定義を書き換えるのに src¥KanaTable¥ 内の定義1ファイルだけで良くなるよう、サブルーチンを関数に書き換え、ファイル構成を改めた。
* そのため、これまでのバージョンの配列定義ファイルからは書き換えが必要です。
* MS-IMEの新旧バージョンをときどき自動検知して、編集モード、固有名詞ショートカットの速さを最適化 (将来の Windows に対応できるかは不明)

### 2021年8月28日
* 漢字変換中に英数入力に切り替え編集モードの記号を入力すると、記号は未確定で、かな入力のままになるバグを修正
* 薙刀式中断 Shift+Ctrl+0、薙刀式再開 Shift+Ctrl+1 の実装
* DvrakJ版の定義とコメントの順番に直した

### 2021年7月21日
* 左右シフトかなを初期設定とした
* スペース＋エンターを Shift+Enter に変換するようにした
* 2キー同時押しの次に押したキーが1キー単打だったら、前の文字を出力して Issue #7 を回避する

### 2021年7月18日
* 固有名詞ショートカットの変更画面を作った。

### 2021年7月10日
* Enterキーをシフトを兼ねられるようにした。
* トレイアイコンを右クリックして設定画面が出せるようにした。
* 記号をUSキーボード風にする設定を追加

### 2021年6月19日
* (Naginata.ahk) 冗長シフトを復活
* (Conv.ahk)(init.ahk) 左右シフトを英数入力、かな入力からコンパイル前に選択
* (Conv.ahk) ATOK可のとき、秀丸エディタの使用時とそれ以外でディレイを自動変更
* (Conv.ahk)(init.ahk) シフトを押しながらの同時押しに制限時間を設けた

### 2021年5月28日
* (Conv.ahk) ATOK の自動検出を廃止。

### 2021年5月24日
* (Conv.ahk) Microsoft Word に対応させるための応急処置

### 2021年5月23日
* (Naginata.ahk)(Conv.ahk)(init.ahk) 固有名詞の定義方法を変更。全角・半角ともにそのまま入力されるようにした。
* (Conv.ahk) 何も出力しない {Null} を定義した。「Q」単打などに使用。
* (Conv.ahk) ATOK 対策の強化と、ATOK の誤検出を減らす対策。
* (NaginataTable.ahk)(OldNaginataTable.ahk) 固有名詞ショートカット(U+I)を押し続けて、前文字削除(U)のリピートが起きる場合があるので対策

### 2021年5月22日
* (Conv.ahk)(init.ahk) 記号入力と固有名詞をIMEオフにして出力するように変更。その際の ATOK 対策。

### 2021年5月10日
* (Conv.ahk)(init.ahk) ユニコード文字の前後で、ディレイを置きつつ未確定状態が検出できたら確定するように変更。

ATOK でストアアプリに記号入力すると、「ん」を入力したままになってしまったため。

ATOK で全角空白をユニコード入力すると、変換途中にも関わらず未確定状態として認識できないので、対策をした。

### 2021年4月28日
* (Conv.ahk) かなと英数を切り変えた時、薙刀式に変換せずにそのまま通ってしまうことがあるのを軽減(失敗)

### 2021年4月24日
* (Conv.ahk) 後置シフト有効時に、３キー同時→３キー同時でロールオーバーができなかったのを直した
* (Conv.ahk) 後置シフトの判定期限に確定できる時は、出力する

### 2021年4月20日
* (IME.ahk) コメント追加
* (Conv.ahk) 薙刀式に変換せずにそのまま通ってしまうことがあるのを修正(失敗)

### 2021年4月11日
* (Conv.ahk) タスクトレイメニューに“縦書きモード”切り替えを追加

### 2021年4月8日
* (Conv.ahk) 後置シフトが有効の時だけ、高精度タイマーを使うようにした

### 2021年3月14日
* ファイル構成の変更
* 時限式の後置シフトを実装(初期設定は通常シフト)

Naginata.ahk 24行目に設定があります。
たとえば後置シフトを60ミリ秒まで認める場合、
ShiftDelay := 60
とします。

* 冗長シフトの削除

Naginata.ahk 17行目を
#Include KanaTable/OldNaginataTable.ahk
と書き換えれば、以前のものと同じになります。
このとき後置シフトにすると、どれかキーを上げるまで字が入らないことがあります。

### 2021年3月1日
* (KanaTable.ahk) 内容は薙刀式創作者である大岡様の著作物のため、著作権表記を変更した。

### 2021年2月27日
* (Naginata.ahk) キーを離してもシフトが残ることがあるのを修正

### 2021年2月26日
* (KanaTable.ahk) Shift+ろ → ＿

### 2021年2月24日
* (init.ahk) × はユニコード文字でないことがわかったので、調整
* (Naginata.ahk) ATOK に対応させるために出力タイミングを調整

### 2021年2月23日
* (Naginata.ahk) スペースキーを押しながらのカーソルキー、Home、End、PageUp、PageDown をシフトキーを押しながらと同じ動作になるようにした
* (init.ahk) ユニコード文字の前後でかな入力を確定する操作を入れた。「nn」→Control+Enter→BS
* (init.ahk)(KanaTable.ahk) そのため、{確定} {固定} 機能を廃止

### 2021年2月21日
* 編集モードでロールオーバーができない組み合わせを解消した
* (init.ahk) {確定}機能を再実装。Ctrl+Enter を入力します。
* (init.ahk) {固定}機能を実装。「n」→改行→BS を入力します。新MS-IMEでユニコード入力の前に使います。
* (KanaTable.ahk) 記号入力で改行されすぎる不具合の再度の解消
* (Naginata.ahk) 入力バッファの大きさを調節(キーを押す時は6個残す)

すべてのファイルを入れ替えた場合のみ、修正が有効になります。

### 2021年2月19日
* 同じキーを連打して取りこぼすことが、主に編集モードで起きていたのを解消した
* Shift + 半角/全角 の動作を直した

### 2021年2月18日
* 出力速度の最適化
* ディレイの設定を不要にした。ある場合はこれまでと同様の動作、ない場合は自動設定される。

### 2021年2月13日
* (Naginata.ahk) 入力部分の強化
* (init.ahk) 定義をされているかなを元に戻せるようにした
* (KanaTable.ahk) 一部かな定義の間違いを訂正。ディレイの修正

### 2021年2月12日
* (Naginata.ahk) リセット機能の不完全な実装を解消
* (KanaTable.ahk) 何も入力しない「Q」単打は、Windows が無反応だった頃の「かな」キーのスキャンコードを出力するように変更

### 2021年2月11日
* (Naginata.ahk) リセット機能を強化
* (init.ahk) {確定}機能の最初の実装
* (KanaTable.ahk) 記号入力で改行されすぎる不具合の解消

### 2021年2月10日
* (KanaTable.ahk) エクスプローラーの検索欄で入力が失敗する、３文字のローマ字のディレイを設定し直した

### 2021年2月9日
* (Naginata.ahk) 例えば「う」押す→「スペース」押す→「う」離す、でスペースが発行されていたのを修正（大岡様ありがとうございました）
* (Naginata.ahk) 3キー以上を限りなく同時に押すと、2文字までしか入力されないことがある、のを修正
