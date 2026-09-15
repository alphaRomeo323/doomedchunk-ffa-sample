### doomedchunk:match/init マッチの初期化を行う

# 参加者をタグ付け
team join in_game @a[gamemode=!spectator]

# 参加者を数え上げ、3人以下であれば少人数マッチであることをタグ付け
execute store result score #players calc \
        if entity @a[team=in_game]
execute if score #players calc matches ..3 \
        run tag @e[tag=matchTimer] add smallMatch
execute if score #players calc matches ..3 \
        run tellraw @a {"text":"参加者が少ないため、少人数マッチとなります","color":"yellow","bold":true}

# ゲームレベルを現在値にそろえる
scoreboard players operation @a[team=in_game] match_level \
                                = #matchLevel match_level

# インベントリクリア
clear @a[team=in_game]

# フィールドに転送
gamemode adventure @a[team=in_game]
execute as @a[team=in_game] run function doomedchunk:player/respawn

# フィールドに固定
execute as @a[team=in_game] \
        run attribute @s minecraft:generic.movement_speed \
                        modifier add doomedchunk:limit -1 add_value
execute as @a[team=in_game] \
        run attribute @s minecraft:generic.jump_strength \
                        modifier add doomedchunk:limit -1 add_value
# スコアボードの初期化
scoreboard players set * kills 0

# 残り時間を設定
# calcに計算用定数を用意
scoreboard players set #hundred calc 100
scoreboard players set #tickToSec calc 20
scoreboard players set #tickToMin calc 1200
scoreboard players set #secToMin calc 60
# tickからmssに直す
scoreboard players operation remaining: count = #matchTime preset
scoreboard players operation remaining: calc = #matchTime preset
scoreboard players operation remaining: count /= #tickToSec calc
scoreboard players operation remaining: count %= #secToMin calc
scoreboard players operation remaining: calc /= #tickToMin calc
scoreboard players operation remaining: calc *= #hundred calc
scoreboard players operation remaining: count += remaining: calc
