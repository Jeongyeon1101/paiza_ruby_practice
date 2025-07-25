#問題
# あなたの国では一日中ほとんど天気が変わりません。そのため、虹が見える時間は決まって早朝です。
# どうしても虹が見たいあなたは虹が出る可能性がある日だけ早起きすることにしました。

# 虹が出る可能性のある日とは、前日が雨の日である晴れの日をいいます。

# 天気予報では0が晴れ、 1 がくもり、 2 が雨を表します。
# 今日を含めた D 日間の天気予報が与えられます。
# 虹が見られる可能性がある日を 1 日目から順にすべて出力してください。
# そのような日がない場合は -1 を出力してください。

# たとえば、入力例 1 では、 0 日後(今日の天気)の予報は雨で 1 日後の予報は晴れです。
# また、3 日後の予報は雨で 4 日後の予報は晴れです。

# 虹が見られる可能性があるのは 1 日後と 4 日後なので 1 行に1 4と半角スペース区切りで出力してください。



# 入力される値
# 入力は以下のフォーマットで与えられます。

# D
# w_0 w_1 ... w_{D-1}
# ・1 行目に 天気予報が与えられる日数を表す整数 D が与えられます。
# ・続く 2 行目に予報された天気を示す整数 w_i (0 ≦ i ≦ D-1) が D 個半角スペース区切りで与えられます。
# ・入力は合計で 2 行となり、末尾に改行が 1 つ入ります。


# それぞれの値は文字列で標準入力から渡されます。



# 期待する出力
# 虹が見られる可能性がある日をすべて、半角スペース区切りで 1 行に出力してください。
# 末尾に改行を入れ、余計な文字、空行を含んではいけません。



# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・2 ≦ D ≦ 100
# ・0 ≦ w_i ≦ 2 (1 ≦ i ≦ D-1)



#解答コード



n = gets.to_i
rainbow_day = []
weather = gets.chomp.split.map(&:to_i)
(1...n).each do |i|
    if weather[i] == 0 && weather[i - 1] == 2
        rainbow_day << i
    end    
end    

if rainbow_day.empty?
    puts -1
else    
    puts rainbow_day.join(" ")
end  



#解答時間　10分37秒
#学習ポイント
#条件に合わせた日の求め方。
#rainbow_day...虹の出る日を記録する配列。
#weather...全体の日毎の天気予報。(0, 1, 2)
#1日目からn日目までのweatherを取り出していく。
#今日(i)の天気が晴れ(0)でかつ、昨日(i - 1)の天気が雨(2)の時に虹が出る。
#虹が出る日(i)をrainbow_dayに記録する。
#rainbow_dayが空なら-1を出力、記録があればスペース区切りでi(何日目)を出力。