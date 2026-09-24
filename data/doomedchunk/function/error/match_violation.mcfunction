### doomedchunk:player/violation 試合中退室などで、match_levelが合わなくなったときに強制的にゲームを終了させる

# 警告文を送信
tellraw @s {"type":"text", "text":"あなたはこのマッチに正式に参加していません","color":"aqua", "bold":true}
tellraw @s {"type":"text", "text":"前の試合を途中退室した可能性があります","color":"aqua"}
tellraw @s {"type":"text", "text":"心当たりがない場合は、バグ報告をお願いします","color":"aqua"}

# スコアボードとステータス効果を初期化する
scoreboard players set @s kills 0
effect clear @s
effect give @s minecraft:instant_health 1 4 true

# ロビーに戻す
execute as @s run return \
                run function doomedchunk:player/return_to_lobby \
                    with storage doomedchunk:respawn_point lobby
