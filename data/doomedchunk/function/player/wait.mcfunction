### doomedchunk:player/wait リスポーン待機部屋に関する関数
# in_gameチームのリスポーン地点(default: doomedchunk:respawn_point.in_gameに格納)の座標をマクロとして渡すこと

# リスポーン待機中プレイヤーのrespawn_timerを増加させる
scoreboard players add @a[tag=waitRespawn] respawn_timer 1

# リスポーン待機部屋でリスポーンしたプレイヤーを一度キルカメラモードにする
$execute as @a[team=in_game,x=$(pos_x),y=-$(pos_y),z=$(pos_z),distance=..3] \
         if score @s death_number matches 1.. \
         run function doomedchunk:spectator/kill_camera
# リスポーン時間になったプレイヤーを強制的に観戦終了させる
execute as @a[team=in_game,gamemode=spectator] \
        if score @s respawn_timer >= #maxWaitTime preset run spectate

# リスポーン待機部屋のプレイヤーをリスポーン待機部屋にとどめる
$teleport @a[team=in_game,x=$(pos_x),y=-$(pos_y),z=$(pos_z),distance=..3] $(pos_x) $(pos_y) $(pos_z)

# リスポーン時間になったプレイヤーをフィールドに配置する
execute as @a[tag=waitRespawn] \
        if score @s respawn_timer >= #maxWaitTime preset \
        run function doomedchunk:player/respawn

# 終了
return 1