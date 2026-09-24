### doomedchunk:timer/summon タイマーエンティティの生成判定を行う
# start値を1にしたプレイヤーを実行者にして実行する

# タイマーエンティティが既に存在している場合はfailとして終了
execute if entity @e[tag=matchTimer] \
        run return run function doomedchunk:error/timer_alrady_exist

# 実行者をロビーに戻す
execute as @s run function doomedchunk:player/return_to_lobby \
                        with storage doomedchunk:respawn_point lobby

# タイマーエンティティ生成
tellraw @a {"text":"タイマーを起動します...","color":"yellow"}
execute summon minecraft:marker run tag @s add matchTimer
scoreboard players set @n[tag=matchTimer] match_timer -210

# #freeze_world_gen のデバッグモードが入っていなければ
#   ワールドを再生成する
execute unless score #freeze_world_gen preset matches 1.. \
        run function doomedchunk:generate

# 正常終了
return 1