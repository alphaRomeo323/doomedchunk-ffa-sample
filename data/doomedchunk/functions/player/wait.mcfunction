# リスポーン待機部屋に関する関数
# -----------------------------
# リスポーン待機中プレイヤーのrespawn_timerを増加させる
scoreboard players add @a[tag=waitRespawn] respawn_timer 1
# リスポーン待機部屋でリスポーンしたプレイヤーを一度キルカメラモードにする
# !!!セレクター基準座標をリスポーン待機部屋の中心座標に変更すること
execute as @a[x=72.5,y=-59,z=53.5, distance=..3, tag=waitRespawn, scores={death_number=1..}] run function doomedchunk:spectate/kill_camera
# リスポーン時間になったプレイヤーを強制的に観戦終了させる
execute as @a[team=in_game,gamemode=spectator] if score @s respawn_timer >= #maxWaitTime preset run spectate
# ゲーム中のスペクテイターモードプレイヤーをリスポーン待機部屋に戻す
# !!!テレポート先をリスポーン待機部屋の中心座標に変更すること
teleport @a[team=in_game,gamemode=spectator] 72.5 -59 53.5
# リスポーン時間になったプレイヤーをフィールドに配置する
# !!!セレクター基準座標をリスポーン待機部屋の中心座標に変更すること
execute as @a[team=in_game, x=72.5,y=-59,z=53.5, distance=..3] if score @s respawn_timer >= #maxWaitTime preset run function doomedchunk:player/respawn
return 1