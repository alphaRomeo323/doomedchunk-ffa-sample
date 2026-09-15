### doomedchunk:player/add_living_time リスポーンから生存時間を数えて2分経過したら10秒おきにハイライトを行う関数

# living_timeを1tick増やす
scoreboard players add @s living_time 1

# 規定時間経過したら、ハイライトを行い、タイマーを戻す
execute if score @s living_time >= #highlightLivingTime preset \
        run effect give @s minecraft:glowing 3 0 false
execute if score @s living_time >= #highlightLivingTime preset \
        run scoreboard players operation @s living_time = #highlightReset preset