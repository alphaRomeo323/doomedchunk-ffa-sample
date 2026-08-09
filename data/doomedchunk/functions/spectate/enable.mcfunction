# 観戦を始める時にトリガーされるfunction
# ----
# ゲームモード変更
gamemode spectator @s
# 観戦地点にテレポート
# !!!座標をフィールドの任意な座標に変更すること
execute at @s run teleport @s ~ -25 ~
# 観戦開始をお知らせ
title @s actionbar {"text":"観戦を開始しました","color":"aqua"}
# 観戦終了ボタンを準備
scoreboard players enable @s change_mode
tellraw @s {"text":"クリックで観戦をやめる","clickEvent":{"action":"run_command","value":"/trigger change_mode set 1"},"color":"aqua","underlined":true}