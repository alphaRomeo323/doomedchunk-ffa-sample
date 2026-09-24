### doomedchunk:timer/kill タイマーエンティティ削除を行う

# タイマーエンティティ削除
kill @e[tag=matchTimer]

# 残り時間表示削除
scoreboard players reset remaining: count

# 順位を計算して表示
function doomedchunk:display/rank

# ロビーに戻す
execute as @a[team=in_game] \
        run function doomedchunk:player/return_to_lobby \
            with storage doomedchunk:respawn_point lobby

# 死体処理
kill @e[type=corpse:corpse]

# 観戦終了を再アナウンス
execute as @a[team=wait,gamemode=spectator] \
        run function doomedchunk:display/stop_observe

# ゲーム開始トリガーを配る
scoreboard players enable @a[scores={temp_admin=1..}] start
loot give @a[scores={temp_admin=1..}] loot doomedchunk:start
scoreboard players enable @a[tag=admin] start
loot give @a[tag=admin] loot doomedchunk:start

# マッチレベルを再設定
execute store result score #matchLevel match_level \
        run random value 1..32767

# 終了
return 1