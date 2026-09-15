### doomedchunk:chest チェストのランダム補充を行うfunction

# チェストがなければ再設置
execute at @e[tag=lootingPoint] \
        unless block ~ ~0.2 ~ minecraft:chest \
        unless block ~ ~0.2 ~ minecraft:trapped_chest \
        run setblock ~ ~0.2 ~ minecraft:chest replace

# 埋められたチェストを出現させる
execute at @e[tag=lootingPoint] \
        positioned ~ ~0.2 ~ \
        run fill ~-1 ~ ~-1 ~1 ~10 ~1 minecraft:air replace #minecraft:sand

# スペシャルルートがすでに開けられていたら表示用スライムを殺害
execute as @e[tag=lootingPoint,scores={chest=2}] \
        at @s \
        unless data block ~ ~0.2 ~ LootTable \
        run kill @n[type=minecraft:slime]

# 空であるチェストから補充済みフラグを外す
execute as @e[tag=lootingPoint,scores={chest=1..}] \
        at @s positioned ~ ~0.2 ~ \
        unless data block ~ ~ ~ LootTable \
        if items block ~ ~ ~ container.* minecraft:air \
        run scoreboard players set @s chest 0

# 補充フラグが外れているチェストに対しランダムにアイテム補充
execute as @e[tag=lootingPoint,scores={chest=0},sort=random,limit=6] \
        run function doomedchunk:chest/set_loot_table

# お知らせ
title @a[team=in_game] actionbar {"text":"新しいチェストが配置されました","color":"yellow"}
execute as @a[team=in_game] at @s run playsound minecraft:block.chest.close player @s ~ ~ ~ 0.8

# すでに開けられているチェストから補充済みフラグを外す
execute as @e[tag=lootingPoint,scores={chest=1..}] \
        at @s positioned ~ ~0.2 ~ \
        unless data block ~ ~ ~ LootTable \
        run scoreboard players set @s chest 0

# 終了
return 1