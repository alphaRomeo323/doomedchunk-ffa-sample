# ゲーム終了直後の処理を行うfunction
# --------------------------------
# 戦闘中止
execute as @a[team=in_game] run attribute @s minecraft:generic.movement_speed base set 0.0
effect give @a[team=in_game] minecraft:levitation 5 128 true
team modify in_game friendlyFire false
# ランクリセット
scoreboard players reset * rank
# お知らせ
title @a times 0 0.5s 0.5s
title @a title {"text":"FINISH!!","bold":true,"color":"red"}
tellraw @a {"text":"ゲーム終了!","color":"yellow"}
execute as @a at @s run playsound minecraft:entity.firework_rocket.large_blast player @s ~ ~ ~ 0.8
# 独立して再帰実行される関数の停止
schedule clear doomedchunk:schedule/half_min
schedule clear doomedchunk:schedule/sec
# チェストの中身を消去
execute at @e[tag=lootingPoint] positioned ~ ~0.2 ~ run data modify block ~ ~ ~ LootTable set value "doomedchunk:dummy"
# 死体の中身を消去
execute as @e[type=corpse:corpse] run data remove entity @s Death