# タイマーエンティティ削除時に実行するfunction
# ---------
# タイマーエンティティ削除
kill @e[tag=gameTimer]
# 残り時間表示削除
scoreboard players reset remaining: count
# 順位を計算して表示
function doomedchunk:display/rank
# 動きを止めていた条件を解除
execute as @a[team=in_game] run attribute @s minecraft:generic.movement_speed base set 0.1
effect clear @a[team=in_game]
effect give @s minecraft:instant_health 1 4 true
# ロビーに戻す
execute as @a[team=in_game] run function doomedchunk:spectate/disable
# エンティティをキルする
kill @e[type=corpse:corpse]
# 観戦終了を再アナウンス
scoreboard players enable @a[gamemode=spectator] change_mode
tellraw @a[gamemode=spectator] {"text":"クリックで観戦をやめる","clickEvent":{"action":"run_command","value":"/trigger change_mode set 1"},"color":"aqua","underlined":true}
# マッチレベルを1上げる
scoreboard players add #matchLevel match_level 1
# クライマックスモードを削除
scoreboard players set #climaxMode game_flag 0
# 終了
return 1