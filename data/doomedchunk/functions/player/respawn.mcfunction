# リスポーンするプレイヤーに対して実行されるfunction
# -----------------------
# ステータスリセット
effect clear @s
attribute @s minecraft:generic.max_health base set 40.0
effect give @s minecraft:instant_health 1 4 true
effect give @s minecraft:saturation 12 0 true
# リスポーン地点選定
tag @e[tag=respawnPoint] add canRespawn
# プレイヤーから近い地点は除外する
execute at @a[team=in_game] run tag @e[tag=respawnPoint,distance=..24] remove canRespawn
# 以下はリスポーン地点から落下死を回避する必要があるときに有効化
# execute as @e[tag=respawnPoint,tag=canRespawn] at @s if block ~ ~-1 ~ minecraft:air run tag @s remove canRespawn
# 条件を満たす地点がない場合時間をおいてリトライ
execute unless entity @e[tag=respawnPoint,tag=canRespawn] run tellraw @s {"text":"スポーン地点選定に失敗しました","color":"aqua"}
execute unless entity @e[tag=respawnPoint,tag=canRespawn] run scoreboard players set @s respawn_timer 60
execute unless entity @e[tag=respawnPoint,tag=canRespawn] run return 3
# メッセージ表示
title @s actionbar {"text":"リスポーンします...","color":"aqua"}
# テレポート
teleport @s @e[limit=1,tag=respawnPoint,sort=random,tag=canRespawn]
# ゲームモードをadventureにする
gamemode adventure @s
# 初期アイテム支給
## 共通
item replace entity @s weapon.mainhand with tacz:modern_kinetic_gun 1
give @s minecraft:bread 5
## 通常時
execute if score #climaxMode game_flag matches 0 run item modify entity @s weapon.mainhand doomedchunk:m1911
execute if score #climaxMode game_flag matches 0 run item replace entity @s inventory.0 with tacz:ammo{AmmoId:"tacz:45acp"} 30
## クライマックスモードがオンの時
execute if score #climaxMode game_flag matches 1 run item modify entity @s weapon.mainhand doomedchunk:g36k
execute if score #climaxMode game_flag matches 1 run item replace entity @s inventory.0 with tacz:ammo{AmmoId:"tacz:556x45"} 60
# リスキル対策の透明化を行う
effect give @s minecraft:invisibility 5 0 true
# リスポーン待機状態を解除する
scoreboard players set @s respawn_timer 0
scoreboard players set @s highlight 0
tag @s remove waitRespawn
# 少人数マッチであればhighlightを加算する
execute if entity @e[tag=smallMatch] run scoreboard players operation @s highlight = #highlightReset preset
# 終了
return 1