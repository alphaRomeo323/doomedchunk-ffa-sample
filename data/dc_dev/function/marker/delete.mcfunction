### dc_dev:marker/delete 付近のマーカーを削除する

# 削除を試行
execute store success score @s calc at @s run kill @e[type=minecraft:marker,sort=nearest,distance=..2,limit=1]
execute if score @s calc matches 0 run say マーカーは近くにありません
execute if score @s calc matches 0 run return fail
execute if score @s calc matches 1 run say 近くのマーカーを削除しました
scoreboard players reset @s calc
return 1