# タイマーエンティティ生成と同時に行う動作を定義するfunction
# -----------
# startGame仮想プレイヤーのgame_flagをリセット
scoreboard players reset #startGame game_flag
# タイマーエンティティが既に存在している場合は警告を発して終了
execute if entity @e[tag=gameTimer] run tellraw @a[team=wait] {"text":"マッチ中です 終了までしばらくお待ちください","color":"yellow","bold":true}
execute if entity @e[tag=gameTimer] run return 0
# タイマーエンティティ生成
tellraw @a {"text":"タイマーを起動します...","color":"yellow"}
execute summon minecraft:marker run tag @s add gameTimer
scoreboard players set @e[tag=gameTimer] match_timer -110
# freezeWorldGenを持つエンティティが居なければ、ワールドを再生成する
execute unless entity @e[tag=freezeWorldGen] run function doomedchunk:generate
# 正常終了
return 1