### doomedchunk:display/rank 最終的な順位を発表するfunction
# 順位付けは単純なキル数で行う。同率アリ

# スコアボード初期化
scoreboard players set @a[team=in_game] rank 0
# 1位決定
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation 1st calc > @s kills
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation @s calc = @s kills
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation @s calc -= 1st calc
execute as @a[team=in_game,scores={rank=0,calc=0}] \
        run scoreboard players set @s rank 1

# 2位決定 (1位の計算を1位を除外して反復試行)
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation 2nd calc > @s kills
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation @s calc = @s kills
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation @s calc -= 2nd calc
execute as @a[team=in_game,scores={rank=0,calc=0}] \
        run scoreboard players set @s rank 2

# 3位決定 (1位の計算を1位,2位を除外して反復試行)
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation 3rd calc > @s kills
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation @s calc = @s kills
execute as @a[team=in_game,scores={rank=0}] \
        run scoreboard players operation @s calc -= 3rd calc
execute as @a[team=in_game,scores={rank=0,calc=0}] \
        run scoreboard players set @s rank 3

# 順位なしを初期化
scoreboard players reset @a[team=in_game,scores={rank=0}] rank

# 勝者発表
tellraw @a {"text":"===結果発表===","color":"yellow","bold":true}
execute as @a[team=in_game,scores={rank=1}] run tellraw @a {"translate":"1位: %s!!! (%sキル)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"kills"}}],"color":"yellow","bold":true}
execute as @a[team=in_game,scores={rank=2}] run tellraw @a {"translate":"2位: %s!! (%sキル)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"kills"}}],"color":"yellow"}
execute as @a[team=in_game,scores={rank=3}] run tellraw @a {"translate":"3位: %s! (%sキル)","with":[{"selector":"@s"},{"score":{"name":"@s","objective":"kills"}}],"color":"yellow"}

# 自身のキル数を表示
execute as @a[team=in_game] run tellraw @s {"translate":"あなたのキル数は%sでした","with":[{"score":{"name":"@s","objective":"kills"}}],"color":"aqua"}

# 終了
return 1