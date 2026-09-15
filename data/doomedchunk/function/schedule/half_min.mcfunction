# ゲーム開始から30秒おきに、独立した時間で呼び出される
# ---------------------------------
# タイマーエンティティが生きていれば再帰的に呼び出す
execute if entity @e[tag=matchTimer] run schedule function doomedchunk:schedule/half_min 30s append
# freezeWorldGenを持つエンティティが居なければ、チェストを補充する
execute unless entity @e[tag=freezeWorldGen] run function doomedchunk:chest