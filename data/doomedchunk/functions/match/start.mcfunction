# ゲームスタート時と同時に発火するfunction
# --------------------------
# 制限解除
execute as @a[team=in_game] run attribute @s minecraft:generic.movement_speed base set 0.1
team modify in_game friendlyFire true
# お知らせ
title @a title {"text":"START!!","bold":true,"color":"aqua"}
tellraw @a {"text":"ゲーム開始!","color":"yellow","bold":true}
execute as @a at @s run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.8
# チェストのロックを外す
execute at @e[tag=lootingPoint] positioned ~ ~0.2 ~ run data modify block ~ ~ ~ Lock set value ""
# 5分後に補充をスケジュール
schedule function doomedchunk:schedule/half_min 30s
# 1秒後にタイマーを減らす
schedule function doomedchunk:schedule/sec 1s append