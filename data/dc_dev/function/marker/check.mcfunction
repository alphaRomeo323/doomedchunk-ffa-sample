### dc_dev:marker/check マーカーの設置場所をクリーパーとエンダーチェストで示す
# クリーパーは1分後に消えます

execute as @e[tag=respawnPoint] at @s summon minecraft:creeper run data modify entity @s NoAI set value true
execute as @e[type=minecraft:creeper] at @s run teleport @s @e[sort=nearest, limit=1, tag=respawnPoint]
execute at @e[tag=lootingPoint] positioned ~ ~0.2 ~ run setblock ~ ~ ~ minecraft:ender_chest replace
schedule function dc_dev:schedule/delete_respawn_checker 60s