# 開始準備するfunction
# 開始5秒前に実行する
# ---------
# 参加者をタグ付け
team join in_game @a[gamemode=!spectator]
# 参加者を数え上げ、3人以下であれば少人数マッチであることをタグ付け
execute store result score #players calc if entity @a[team=in_game]
execute if score #players calc matches ..3 run tag @e[tag=gameTimer] add smallMatch
# ゲームレベルを現在値にそろえる
scoreboard players operation @a[team=in_game] match_level = #matchLevel match_level
# インベントリクリア
clear @a[team=in_game]
# フィールドに転送
gamemode adventure @a[team=in_game]
execute as @a[team=in_game] run function doomedchunk:player/respawn
# フィールドに固定
execute as @a[team=in_game] run attribute @s minecraft:generic.movement_speed base set 0.0
effect give @a[team=in_game] minecraft:levitation 5 128 true
# スコアボードの初期化
scoreboard players set * kills 0
# 残り時間を設定
scoreboard players set #hundred calc 100
scoreboard players set #tickToSec calc 20
scoreboard players set #tickToMin calc 1200
scoreboard players set #secToMin calc 60
scoreboard players operation remaining: count = #matchTime preset
scoreboard players operation remaining: calc = #matchTime preset
scoreboard players operation remaining: count /= #tickToSec calc
scoreboard players operation remaining: count %= #secToMin calc
scoreboard players operation remaining: calc /= #tickToMin calc
scoreboard players operation remaining: calc *= #hundred calc
scoreboard players operation remaining: count += remaining: calc
# カウントダウン用にタイトル表示時間を設定
title @a times 0 0.5s 0.5s
