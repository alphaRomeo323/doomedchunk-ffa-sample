### doomedchunk:player/respawn マップ内にゲーム中プレイヤーが配置されるときに実行される

# リスポーン可能地点を選定する
# プレイヤーから近い地点は除外する
tag @e[tag=respawnPoint] add canRespawn
execute as @a[team=in_game] \
        at @s \
        run tag @e[tag=respawnPoint,distance=..24] remove canRespawn

# リスポーン地点の下が空気ブロックであれば除外する(デフォルトではオフ)
execute unless score #can_spawn_in_air preset matches 1.. \
        as @e[tag=respawnPoint,tag=canRespawn] \
        at @s if block ~ ~-1 ~ minecraft:air \
        run tag @s remove canRespawn

# 条件を満たす地点がない場合終了
execute unless entity @e[tag=respawnPoint,tag=canRespawn] \
        run return \
            run function doomedchunk:error/respawn_fail

# メッセージ表示
title @s actionbar {"text":"リスポーンします...","color":"aqua"}

# 初期ステータスにリセットする
effect clear @s
attribute @s minecraft:generic.max_health base set 60.0
effect give @s minecraft:instant_health 1 4 true
effect give @s minecraft:saturation 12 0 true

# ゲームモードをadventureにする
gamemode adventure @s

# テレポート
teleport @s @e[limit=1,tag=respawnPoint,sort=random,tag=canRespawn]

# リスキル対策の透明化を行う
effect give @s minecraft:invisibility 5 0 true

# initial/endgameの初期アイテム支給
# initial
execute if score @e[tag=matchTimer,limit=1] match_timer < #end_game preset \
        run function doomedchunk:player/respawn/initial_items
# endgame
execute if score @e[tag=matchTimer,limit=1] match_timer >= #end_game preset \
        run function doomedchunk:player/respawn/endgame_items

# リスポーン待機状態を解除する
scoreboard players reset @s respawn_timer 
scoreboard players set @s living_time 0
tag @s remove waitRespawn

# 少人数マッチであればhighlightを加算する
execute if entity @e[tag=smallMatch] run scoreboard players operation @s living_time = #highlightReset preset

# 終了
return 1