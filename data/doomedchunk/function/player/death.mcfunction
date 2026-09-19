### doomedchunk:player/death 死亡時に死亡したプレイヤーに対して実行される
# in_gameチームのリスポーン地点(default: doomedchunk:respawn_point.in_gameに格納)の座標をマクロとして渡すこと

# 検知に使用したスコアボードをリセットする
scoreboard players reset @s death_detect
# in_gameチームでないとき、ここで終了
execute as @s[team=!in_game] run return fail

# リスポーン待機タグをつける
tag @s add waitRespawn
# リスポーン地点を待機場所に設定
$execute positioned $(pos_x) $(pos_y) $(pos_z) run spawnpoint
# リスポーン待機時間を初期化
scoreboard players set @s respawn_timer -30
# 生存時間を初期化
scoreboard players set @s living_time 0
# そのマッチにおける累計死亡回数を加算
scoreboard players add total: kills 1

# 最後に攻撃したプレイヤーに対する効果
# 最後に攻撃したプレイヤーのHPを回復
execute on attacker \
        run effect give @s minecraft:instant_health 1 1 true
# 最後に攻撃したプレイヤーのハイライト値を増加
execute on attacker \
        run scoreboard players operation @s living_time += #highlightKillAddition preset

# キルカメラ関係
# 死んだプレイヤーのkill_numberを初期化し、
#   キルカメラの追跡対象から除外する
scoreboard players reset @s kill_number
# death_numberに累計死亡回数を代入し、識別番号とする
scoreboard players operation @s death_number = total: kills
# 最後に攻撃したプレイヤーのkill_numberを一時取得
execute on attacker \
        run scoreboard players operation total: calc = @s kill_number
# 最後に攻撃したプレイヤーのkill_numberを累計死亡回数で上書き
execute on attacker \
        run scoreboard players operation @s kill_number = total: kills
# すでに死亡しているプレイヤーで、キルカメラモードに入っておらず、
#   上書き前のkill_countと同じ値のdeath_numberを持つプレイヤーに対し、
#   death_numberを累計死亡回数で上書きする
execute as @a[scores={death_number=1..}] \
        if score @s death_number = total: calc \
        run scoreboard players operation @s death_number = total: kills
# 一時値をリセット
scoreboard players reset total: calc

# 終了
return 1