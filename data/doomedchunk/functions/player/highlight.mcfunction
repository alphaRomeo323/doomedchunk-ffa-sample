# リスポーンから生存時間を数えて2分経過したら10秒おきにハイライトを行う関数
# ---------------------------------
# highlightを1tick増やす
scoreboard players add @s highlight 1
# 2分以上経過したら、ハイライトを行い、タイマーを10秒戻す
execute if score @s highlight >= #highlightLivingTime preset run effect give @s minecraft:glowing 3 0 false
execute if score @s highlight >= #highlightLivingTime preset run scoreboard players operation @s highlight = #highlightReset preset