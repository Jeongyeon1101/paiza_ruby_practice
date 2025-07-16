#問題
# あなたの友人である B さんは競馬が大好きです。
# B さんには 3 頭の注目している馬がいます。
# B さんは何度も競馬場に通っているうちに、3 頭のうちどの馬が一番速いのだろうという疑問を持ち始めました。

# B さんの住んでいる地域では、競馬のレースは 1 回あたり 18 頭の馬が参加し、その結果に応じてすべての馬に 1 位から 18 位までのいずれかの順位がつきます。
# 勝負は時の運なので、1 回 1 回のレース結果を見ていても、どの馬が本当に速いのかはわかりません。
# そこで B さんは、ある馬の N 回分のレースの順位が与えられたとき、その馬のランクを 「連続する K 回分のレースの順位の平均値」の最小値として計算することを思いつきました。
# 計算が苦手な B さんに変わって、3 頭の馬のランクを計算し、ランクが最も小さい馬を出力するプログラムを書いてください。ただし、3 頭のうち、どの馬もランクが同じにならないものとします。



# 入力される値
# 入力は以下のフォーマットで与えられます。

# N K
# a_1
# a_2
# ...
# a_N
# b_1
# b_2
# ...
# b_N
# c_1
# c_2
# ...
# c_N
# ・1 行目にはレースの回数を表す整数 N と、スコアの計算に用いられる整数 K が半角スペース区切りで与えられます。
# ・続く N 行のうちの i 行目 (1 ≦ i ≦ N) には、B さんが注目している 1 頭目の馬の i 回目のレースの順位を表す整数 a_i が与えられます。
# ・続く N 行のうちの i 行目 (1 ≦ i ≦ N) には、B さんが注目している 2 頭目の馬の i 回目のレースの順位を表す整数 b_i が与えられます。
# ・続く N 行のうちの i 行目 (1 ≦ i ≦ N) には、B さんが注目している 3 頭目の馬の i 回目のレースの順位を表す整数 c_i が与えられます。
# ・入力は合計で 3 * N + 1 行となり、入力値最終行の末尾に改行が 1 つ入ります。

# それぞれの値は文字列で標準入力から渡されます。



# 期待する出力
# ・ランクが最小となる馬の番号 (入力で与えられた順に 1, 2, 3 のいずれか) を出力してください。
# ・末尾に改行を入れ、余計な文字、空行を含んではいけません。



# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ N ≦ 50
# ・1 ≦ K ≦ N
# ・1 ≦ a_i, b_i, c_i ≦ 18 (1 ≦ i ≦ N)
# ・ランクが最小となる馬はただ一つに決まる



#解答コード



n, k = gets.chomp.split.map(&:to_i)
a_ranks = []
b_ranks = []
c_ranks = []

n.times do
    a_ranks << gets.to_i
end  

n.times do
    b_ranks << gets.to_i
end
    
n.times do
    c_ranks << gets.to_i
end

a_ranks_average = []
(0...a_ranks.size - k + 1).each do |i|
    a_3ranks = a_ranks[i...(i + k)]
    a_ranks_average << a_3ranks.sum.to_f / k
end 

a_min = a_ranks_average.min

b_ranks_average = []
(0...b_ranks.size - k + 1).each do |i|
    b_3ranks = b_ranks[i...(i + k)]
    b_ranks_average << b_3ranks.sum.to_f / k
end

b_min = b_ranks_average.min

c_ranks_average = []
(0...c_ranks.size - k + 1).each do |i|
    c_3ranks = c_ranks[i...(i + k)]
    c_ranks_average << c_3ranks.sum.to_f / k
end 

c_min = c_ranks_average.min

total_ranks = [a_min, b_min, c_min]
min_rank = total_ranks.min

puts total_ranks.index(min_rank) + 1 



#解答時間　38分26秒
#学習ポイント
#複雑なランクの計算方法。
#a-c_ranks...1-3頭(a-c)の馬毎のランキング配列。
#a-c_ranks_average...1-3頭(a-c)の馬毎のランキング平均値の配列。
#a-c_ranks.size -kで要素の開始位置(何回目)を指定する。(0...nは0からn-1までの要素を含んでいるので、+ 1でnまでの要素を含むようにする。)
#a-c_3ranks...開始位置(i)を含めたk個の要素を含んだ配列。
#a-c_ranks[i...(i + k)]で開始位置iからi + k - 1までを含んだ要素をa-c_3ranksに入れる。
#a-c_3ranksの平均値を取得する。(a-c_ranks_average)
#a-c_ranks_averageの最小値を求める。(a-c_min)
#馬毎の最小値の中からランクが小さい馬を取得する。(min_rank)