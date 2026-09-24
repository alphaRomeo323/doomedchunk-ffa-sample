### doomedchunk:chest/set_special_loot スペシャルルートを設定する

# 1か所を選定
scoreboard players set @e[tag=lootingPoint,limit=1,sort=random] chest 2

# ルートテーブルをセット
execute at @e[tag=lootingPoint,scores={chest=2}] \
        positioned ~ ~0.2 ~ \
        run data modify block ~ ~ ~ LootTable set value "doomedchunk:chests/special"

# スペシャルルートをお知らせ
tellraw @a {"text":"スペシャルルートが配置されました!","color":"yellow","bold":true}
execute as @a at @s run playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 0.8
execute at @e[tag=lootingPoint,scores={chest=2}] \
        run summon minecraft:slime ~ ~ ~ {Size:0,NoAI:true,DeathLootTable:'doomedchunk:chests/dummy',Glowing:true,Invulnerable:true,Tags:["specialLootDisplay"]}

# 終了
return 1