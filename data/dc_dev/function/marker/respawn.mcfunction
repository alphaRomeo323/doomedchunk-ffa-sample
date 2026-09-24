### dc_dev:marker/respawn respawnPointマーカーを現在座標に設置する
# 座標は今のプレイヤーが向いている向きを東西南北に補正する

execute at @s summon minecraft:marker run tag @s add respawnPoint
execute if entity @s[y_rotation=-44.9..44.9] run say 現在の座標をプレイヤースポーン地点(南向き)にマークしました
execute if entity @s[y_rotation=-44.9..44.9] run return 1
execute if entity @s[y_rotation=45.1..134.9] run say 現在の座標をプレイヤースポーン地点(西向き)にマークしました
execute if entity @s[y_rotation=45.1..134.9] at @s run data modify entity @e[tag=respawnPoint,sort=nearest,limit=1] Rotation insert 0 value 90f
execute if entity @s[y_rotation=45.1..134.9] run return 2
execute if entity @s[y_rotation=135.1..224.9] run say 現在の座標をプレイヤースポーン地点(北向き)にマークしました
execute if entity @s[y_rotation=135.1..224.9] at @s run data modify entity @e[tag=respawnPoint,sort=nearest,limit=1] Rotation insert 0 value 180f
execute if entity @s[y_rotation=135.1..224.9] run return 3
execute if entity @s[y_rotation=225.1..314.9] run say 現在の座標をプレイヤースポーン地点(東向き)にマークしました
execute if entity @s[y_rotation=225.1..314.9] at @s run data modify entity @e[tag=respawnPoint,sort=nearest,limit=1] Rotation insert 0 value 270f
execute if entity @s[y_rotation=225.1..314.9] run return 4
kill @e[tag=respawnPoint,sort=nearest,limit=1]
say プレイヤースポーン地点のマークに失敗しました
return fail