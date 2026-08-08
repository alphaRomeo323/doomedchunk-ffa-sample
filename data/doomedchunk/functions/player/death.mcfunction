# 死亡時に死亡したプレイヤーに対して実行されるfunction
# deathCount型スコアボードの値の変動を検知して発火するのが望ましい
# 発火用コマンドの一例→ execute as @a[scores={death_detect=1..}] at @s run function doomedchunk:death_process
# ---------------------------------
# 検知に使用したスコアボードをリセットする
scoreboard players set @s death_detect 0
# in_gameチームでないとき、ここで終了
execute as @s[team=!in_game] run return 2
# リスポーン待機タグをつける
tag @s add waitRespawn
# リスポーン地点を待機場所に設定
# !!!テレポート先をリスポーン待機部屋の座標(int)に直すこと
spawnpoint @s 72 -59 53 0
# リスポーン待機時間を初期化
scoreboard players set @s respawn_timer -30
# そのマッチにおける累計死亡回数を加算
scoreboard players add total: kills 1
# kill_numberをリセットしてキルカメラの対象から外す
scoreboard players reset @s kill_number
# death_numberに累計死亡回数を代入し、識別番号とする
scoreboard players operation @s death_number = total: kills
# 最後に攻撃したプレイヤーのHPを回復
execute on attacker run effect give @s minecraft:instant_health 1 1 true
# 最後に攻撃したプレイヤーのハイライト値を増加
execute on attacker run scoreboard players operation @s highlight += #highlightKillAddition preset
# 最後に攻撃したプレイヤーのkill_numberを一時取得
execute on attacker run scoreboard players operation total: calc = @s kill_number
# 最後に攻撃したプレイヤーのkill_numberを累計死亡回数で上書き
execute on attacker run scoreboard players operation @s kill_number = total: kills
# すでに死亡しているプレイヤーで、キルカメラモードに入っておらず、
# 上書き前のkill_countと同じ値のdeath_numberを持つプレイヤーに対し、
# death_numberを累計死亡回数で上書きする
execute as @a[scores={death_number=1..}] if score @s death_number = total: calc run scoreboard players operation @s death_number = total: kills
# 一時値をリセット
scoreboard players reset total: calc
return 1