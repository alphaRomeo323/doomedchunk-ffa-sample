# スペシャルルートのチェストを開けた際に実行する関数
# ----------
# スライムを殺す
execute unless block ~ ~ ~ minecraft:chest{LootTable:"doomedchunk:special"} run kill @e[type=minecraft:slime]
# 通常のチェストと同じ動作に戻す
execute unless block ~ ~ ~ minecraft:chest{LootTable:"doomedchunk:special"} run scoreboard players set @s chest 1