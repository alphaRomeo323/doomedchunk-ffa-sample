### doomedchunk:main メインループ
# tickから呼び出すか、これ単体をリピートコマンドブロックで実行する

# ゲーム進行関連の関数
execute as @n[tag=matchTimer] run function doomedchunk:timer

# タイマー生成前の権限チェック
execute as @p[scores={start=1}] \
        run function doomedchunk:check_admin

# 死亡検出の関数
execute as @a[scores={death_detect=1..}] at @s \
        run function doomedchunk:player/death with storage doomedchunk:respawn_point in_game

# リスポーン待機関連の関数
function doomedchunk:player/wait with storage doomedchunk:respawn_point in_game

# 新規プレイヤーに案内とチーム加入を行う
execute as @a[team=] run function doomedchunk:player/newbie

# 途中退室プレイヤーなど、本来ゲームに参加していないはずのプレイヤーをロビーへ帰す
execute unless score #ignore_match_level preset matches 1.. \
        as @a[team=in_game] \
        unless score @s match_level = #matchLevel match_level \
        run function doomedchunk:error/match_violation

# 観戦状態のプレイヤーが観戦をやめる
execute as @a[team=wait,scores={change_mode=1}] \
        run function doomedchunk:player/return_to_lobby \
                with storage doomedchunk:respawn_point lobby

# 一時管理者権限の制御
function doomedchunk:temporary_admin with storage doomedchunk:temp_admin

# ワールドボーダーの範囲外にある飛翔物をキル
function doomedchunk:gimmick/kil_outer_projectiles with storage doomedchunk:rollback

# 不要アイテム消去
clear @a minecraft:glass_bottle

# calc領域をクリア
execute unless score #calc_debug preset matches 1.. \
        run scoreboard players reset * calc

# 終了
return 1