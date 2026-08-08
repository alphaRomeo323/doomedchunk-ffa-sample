# ゲーム開始から毎秒、独立した時間で呼び出される
# ---------------------------------
# タイマーエンティティが生きていれば再帰的に呼び出す
execute if entity @e[tag=gameTimer] run schedule function doomedchunk:schedule/sec 1s append
# countを更新する
function doomedchunk:display/count
# 以下はsample_map用のギミック
# 落下ギミックのサンプル
execute as @a[team=in_game,gamemode=adventure] at @s if block ~ ~-1 ~ minecraft:blackstone run function doomedchunk:gimmick/fall
# ダメージギミックのサンプル
execute as @a[team=in_game,gamemode=adventure] at @s if block ~ ~-1 ~ minecraft:cut_red_sandstone run damage @s 10 minecraft:player_attack by @e[limit=1,tag=damageSource]