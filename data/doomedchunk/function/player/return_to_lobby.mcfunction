### doomedchunk:player/return_to_lobby ロビーへ戻す処理を行う関数
# waitチームのリスポーン地点(default: doomedchunk:respawn_point.lobbyに格納)の座標をマクロとして渡すこと

# アナウンス
title @s actionbar {"text":"ロビーに戻ります...","color":"aqua"}

# ゲームモード変更
gamemode adventure @s

# アイテムクリア
clear @a

# ロビーの中心に戻す
$teleport @s $(pos_x) $(pos_y) $(pos_z) $(rotation) 0

# スポーンポイントの初期化
$execute positioned $(pos_x) $(pos_y) $(pos_z) \
        run spawnpoint @s ~ ~ ~ $(rotation)

# プレイヤーの初期化
team join wait @s
tag @s remove waitRespawn

# 移動制限用の補正値を取り払う
execute as @s \
        run attribute @s minecraft:generic.movement_speed modifier remove doomedchunk:limit
execute as @s \
        run attribute @s minecraft:generic.jump_strength modifier remove doomedchunk:limit

# スコアボードの初期化
scoreboard players reset @s change_mode
scoreboard players reset @s kill_number
scoreboard players reset @s death_number

# 満腹度の自動回復
effect give @s minecraft:saturation infinite 0 true

# 終了
return 1