### doomedchunk:schedule/sec ゲーム開始から毎秒、独立した時間で呼び出される
# ---------------------------------
# タイマーエンティティが生きていれば再帰的に呼び出す
execute if entity @e[tag=matchTimer] run schedule function doomedchunk:schedule/sec 1s append

# countを更新する
function doomedchunk:display/count

# 水中にいる間イルカの好意を受ける
execute as @a anchored eyes \
        if block ^ ^ ^ minecraft:water \
        run effect give @s minecraft:dolphins_grace 2 0 true