### doomedchunk:player/set_temporary_admin 一時管理者に割り当てられた際に実行する関数

# 一時管理者の権限を付与
scoreboard players set @s temp_admin 1

# 一時管理者になったことの通知
tellraw @s {"text":"管理者がいないため、一時的にスタート権限が付与されます","color":"aqua"}

# 一時管理者のプレイヤーネームを格納
execute unless entity 3ecf96f6-5342-4ab1-a629-10926cea8230 \
        run summon item_display 0 0 0 {UUID:[I;1053791990,1396853425,-1507258222,1827308080]}
loot replace entity 3ecf96f6-5342-4ab1-a629-10926cea8230 container.0 loot doomedchunk:meta/player_head
data modify storage doomedchunk:temp_admin name set from entity 3ecf96f6-5342-4ab1-a629-10926cea8230 item.components."minecraft:profile".name

# 実行権限を付与
scoreboard players enable @s start

# admin用の本を配布
loot give @s loot doomedchunk:start
