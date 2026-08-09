# 試合中退室などで、match_levelが合わなくなったときに強制的にゲームを終了させるコマンド
# -------------------------
# 警告文を送信
tellraw @s {"type":"text", "text":"あなたはこのマッチに正式に参加していません","color":"aqua", "bold":true}
tellraw @s {"type":"text", "text":"前の試合を途中退室した可能性があります","color":"aqua"}
tellraw @s {"type":"text", "text":"心当たりがない場合は、マップ制作者にバグ報告をお願いします","color":"aqua"}
# スコアボードを初期化する
scoreboard players set @s kills 0
scoreboard players reset @s kill_number
# ロビーに戻す
effect clear @s
effect give @s minecraft:instant_health 1 4 true
execute as @s run function doomedchunk:spectate/disable