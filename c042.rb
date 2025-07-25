#問題
# あなたはとあるゲーム大会の事務係になりました。あなたの仕事は各試合の結果報告をまとめ、勝敗の結果がひと目で分かる表をつくることです。これを自動化するプログラムをつくりましょう。

# この大会は総当りのリーグ戦なのですべての参加者どうしが試合を行います。なお、このゲームに引き分けは存在しません。

# 例)

# 参加者数: 3 (参加者 1 ~ 3)
# 結果報告:
# 参加者 1 と 3 が試合を行い、参加者 1 の勝利
# 参加者 1 と 2 が試合を行い、参加者 2 の勝利
# 参加者 2 と 3 が試合を行い、参加者 2 の勝利

# これをまとめると以下のような表にすることができます。ここで、i 行 j 列目 (i ≠ j) は参加者 i から見た参加者 j との試合の結果を表し、勝利なら "W"、敗北なら "L" となります。i 行 i 列目は「参加者 i と参加者 i の試合」という存在しない試合に対応するので半角ハイフン ("-") で埋めます。
# 参加者の数と各試合の結果の情報が与えられるので、上のような表の内部 (参加者番号を除いた部分) を出力してください。



# 入力される値
# 入力は以下のフォーマットで与えられます。

# N
# f_1 s_1
# f_2 s_2
# ...
# f_M s_M  
# ・1 行目には大会の参加者の総数を表す整数 N が与えられます。
# ・続く M 行 (M = N × (N-1) / 2) のうち i 行目 (1 ≦ i ≦ M) には i 番目の試合結果の勝者の番号を表す整数 f_i、敗者の番号を表す整数 s_i がこの順に半角スペース区切りで与えられます。
# ・入力は合計で M + 1 行となり、入力最値終行の末尾に改行が 1 つ入ります。

# それぞれの値は文字列で標準入力から渡されます。




# 期待する出力
# 大会の勝敗結果の表を以下の形式で出力してください。

# r_{1,1} r_{1,2} ... r_{1,N}
# r_{2,1} r_{2,2} ... r_{2,N}
# ...
# r_{N,1} r_{N,2} ... r_{N,N}
# ・期待する出力は N 行からなります。
# ・出力の i 行目 (1 ≦ i ≦ N) に N 個の文字を半角スペース区切りで出力してください。この j 番目 (1 ≦ j ≦ N) の文字 r_{i, j} は参加者 i から見た参加者 j との試合の結果を表します。
# 　・i ≠ j のとき、r_{i, j} は試合結果が勝利である場合 "W" 、敗北である場合は "L" となります。
# 　・i = j のとき、r_{i, j} は存在しない試合に対応するので "-" となります。
# ・出力の N 行目の最後に改行を 1 つ入れ、余計な文字、空行を含んではいけません。



# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・2 ≦ N ≦ 20
# ・各 i (1 ≦ i ≦ N × (N-1) / 2) について
# 　・1 ≦ f_i, s_i ≦ N
# 　・f_i ≠ s_i
# ・各組み合わせの対戦結果はそれぞれただ 1 度ずつ入力される (同じ組み合わせの対戦結果は入力されない)



#解答コード



n = gets.to_i
results = Array.new(n) { Array.new(n, "-") }

m = n * (n - 1) / 2

m.times do
    w, l = gets.chomp.split.map(&:to_i)
    results[w - 1][l - 1] = "W"
    results[l - 1][w - 1] = "L"
end    

results.each do |row|
    puts row.join(" ")
end    



#解答時間　16分46秒
#学習ポイント
#リーグ戦の試合表の作成方法。
#試合の参加者数n人に応じてn*nマスの表を作成する。
#参加者数 * (参加者数 - 1)で、自分以外のチームとの対戦試合の数を求めることができる。 / 2で重複を取り除くことで試合の総数を求めることができる。
#上記で求めたm回(試合数)の入力を受け付ける。
#i行j列目は参加者iからみた結果(1行目は参加者1からみた結果)なので、w行l列目はWになる。(Lはその逆)
#results(試合表)からrow(外側の配列)を取り出し、要素同士をスペースで繋げる。