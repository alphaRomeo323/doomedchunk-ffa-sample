# 観戦をやめる時にトリガーされるfunction
# ロビーに戻す際にも用いる
# ----
# アナウンス
title @s actionbar {"text":"ロビーに戻ります...","color":"aqua"}
# ゲームモード変更
gamemode adventure @s
# アイテムクリア
clear @a
# ロビーの中心に戻す
# !!!座標をロビーの中央座標に直すこと
teleport @s 72.0 -59.0 72.0
# スポーンポイントを初期化
# !!!座標をロビーの中央座標(int)に直すこと
spawnpoint @s 72 -59 72 0
# プレイヤーを初期化する
team join wait @s
tag @s remove waitRespawn
scoreboard players reset @s change_mode
scoreboard players reset @s kill_number
scoreboard players reset @s death_number
# 終了
return 1