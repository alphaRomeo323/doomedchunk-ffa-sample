### doomedchunk:spectator/observe 観戦ボタンを押した際にトリガーされる

# ゲームモード変更
gamemode spectator @s

# 観戦地点(ランダムなリスポーンポイント)にテレポート
teleport @s @e[limit=1,tag=respawnPoint,sort=random]

# 観戦開始をお知らせ
title @s actionbar {"text":"観戦を開始しました","color":"aqua"}

# 観戦終了ボタンを準備
execute as @s run function doomedchunk:display/stop_observe

# 終了
return 1