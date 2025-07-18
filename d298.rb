#問題
#あなたはモンスターを捕まえるゲームをしています。
#あなたは n 種類いるモンスターのうち m 種類のモンスターを捕まえています。
#モンスターの種類 n と捕まえたモンスターの種類 m が改行区切りで与えられるので、残り何種類捕まえるとすべての種類を捕まえることができるかを出力してください。

#入力例 1 の場合

#64
#31
#64 種類のうち 31 種類を捕まえているので
#33
#と出力して下さい。



#入力される値
#入力は以下のフォーマットで与えられます。

#n
#・1 行目にモンスターの種類 n が与えられます。
#・2 行目に捕まえたモンスターの種類 m が与えられます。
#・入力は合計で 2 行となり、末尾に改行が 1 つ入ります。

#それぞれの値は文字列で標準入力から渡されます。



#期待する出力
#モンスターの種類 n と捕まえたモンスターの種類 m が改行区切りで与えられるので、残り何種類捕まえるとすべての種類を捕まえることができるかを出力してください。
#末尾に改行を入れ、余計な文字、空行を含んではいけません。



#条件
#すべてのテストケースにおいて、以下の条件をみたします。

#・1 ≦ n ≦ 999
#・0 ≦ m ≦ 999
#・m ≦ n



#解答コード

input_line1 = gets.to_i
input_line2 = gets.to_i
puts input_line1 - input_line2



#解答時間　37秒
#学習ポイント
#標準入力の受け取り方、整数同士の計算方法。