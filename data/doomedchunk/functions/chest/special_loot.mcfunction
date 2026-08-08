# スペシャルルートを発生させるfunction
# スペシャルルートの位置は発光バフ付きスライムで共有される
# ---------------------------
# ランダムに1箇所選定
scoreboard players set @e[tag=lootingPoint,limit=1,sort=random] chest 2
# NBTをセット
execute at @e[tag=lootingPoint,scores={chest=2}] positioned ~ ~0.2 ~ run data modify block ~ ~ ~ LootTable set value "doomedchunk:special"
# スペシャルルートをお知らせ
tellraw @a {"text":"スペシャルルートが配置されました!","color":"yellow","bold":true}
execute as @a at @s run playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 0.8
execute at @e[tag=lootingPoint,scores={chest=2}] run summon minecraft:slime ~ ~ ~ {Size:0,NoAI:true,DeathLootTable:'doomedchunk:dummy',Glowing:true,Invulnerable:true}