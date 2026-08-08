# 最終的な順位を発表するfunction
# -----------------------------
# 勝者決定
scoreboard players set @a[team=in_game] rank 0
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation 1st calc > @s kills
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation @s calc = @s kills
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation @s calc -= 1st calc
execute as @a[team=in_game,scores={rank=0,calc=0}] run scoreboard players set @s rank 1
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation 2nd calc > @s kills
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation @s calc = @s kills
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation @s calc -= 2nd calc
execute as @a[team=in_game,scores={rank=0,calc=0}] run scoreboard players set @s rank 2
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation 3rd calc > @s kills
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation @s calc = @s kills
execute as @a[team=in_game,scores={rank=0}] run scoreboard players operation @s calc -= 3rd calc
execute as @a[team=in_game,scores={rank=0,calc=0}] run scoreboard players set @s rank 3
scoreboard players reset @a[team=in_game,scores={rank=0}] rank
# 勝者発表
tellraw @a {"text":"===結果発表===","color":"yellow","bold":true}
execute as @a[team=in_game,scores={rank=1}] run tellraw @a {"translate":"1位: %s!!! (%sキル)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"kills"}}],"color":"yellow","bold":true}
execute as @a[team=in_game,scores={rank=2}] run tellraw @a {"translate":"2位: %s!! (%sキル)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"kills"}}],"color":"yellow"}
execute as @a[team=in_game,scores={rank=3}] run tellraw @a {"translate":"3位: %s! (%sキル)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"kills"}}],"color":"yellow"}
execute as @a[team=in_game] run tellraw @s {"translate":"あなたのキル数は%sでした","with":[{"score":{"name":"@s","objective":"kills"}}],"color":"aqua"}