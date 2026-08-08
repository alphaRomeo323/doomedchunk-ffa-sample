# チェスト補充用function
# 発火用コマンドの一例→ execute as @e[tag=lootingPoint] run function doomedchunk:chest/loot
# -------------------------------------
# 試合が終了していれば実行しない
execute if score @e[tag=gameTimer,limit=1] match_timer >= #matchTime preset run return 2
# NBTをセット
execute at @s positioned ~ ~0.2 ~ run data modify block ~ ~ ~ LootTable set value "doomedchunk:chest"
# チェスト補充済みフラグを立てる
scoreboard players set @s chest 1