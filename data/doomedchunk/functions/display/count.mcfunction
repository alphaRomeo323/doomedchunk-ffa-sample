# 時間表示を行う関数
# -------------------------------
# gameTimerが存在しなければ強制終了する
execute unless entity @e[tag=gameTimer] run return 4
# 残り時間が設定されていないか、0以下であれば強制終了する
execute unless score remaining: count matches 1.. run return 2
# 表示されている残り時間を1減ずる
scoreboard players remove remaining: count 1
# mss表記に直す
## 100で割った余りを取得
scoreboard players set #hundred calc 100
scoreboard players operation remaining: calc = remaining: count
scoreboard players operation remaining: calc %= #hundred calc
## 100で割った余りが60以上であれば、元の数から40を引く
execute if score remaining: calc matches 60.. run scoreboard players remove remaining: count 40
## calcをリセット
scoreboard players reset remaining: calc
# 残り時間1分30秒であればチャットでも告知
execute if score remaining: count matches 130 run tellraw @a {"text":"終了まであと1分半...","color":"yellow"}
# 残り時間30秒であればチャットでも告知
execute if score remaining: count matches 30 run tellraw @a {"text":"終了まであと30秒...","color":"yellow"}