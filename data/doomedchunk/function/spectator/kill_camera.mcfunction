### doomedchunk:spectator/kill_camera キルカメラを実行する関数
#プレイヤーがリスポーン待機場所でスポーンすると発火する

# リスポーン待機時間を補正する
scoreboard players operation @s respawn_timer < #maxWaitTime preset
scoreboard players operation @s respawn_timer /= #waitTimeWeight preset

# ゲームモードをspectatorにする
gamemode spectator @s

# @s対象が変わるため、death_numberの値を一時値に渡す
scoreboard players operation #killPlayerSearch calc = @s death_number
# death_numberをリセット
scoreboard players reset @s death_number

# キルしたプレイヤーがいるかをチェックする
execute as @a[team=in_game, scores={death_detect=0}, tag=!waitRespawn] \
        if score @s kill_number = #killPlayerSearch calc \
        run tag @s add camTarget
# キルカメラを開始
spectate @e[tag=camTarget,limit=1] @s

# 一時値をリセット
scoreboard players reset #killPlayerSearch calc
tag @e[tag=camTarget] remove camTarget

# 終了
return 1
