### doomedchunk:timer/in_game ゲーム内の毎tick処理が行われるギミックを処理

# 生存時間を加算、ハイライト処理を実行
execute as @a[team=in_game] \
        run function doomedchunk:player/add_living_time

# 防具の自動装備
execute as @a if predicate doomedchunk:armor/leather \
        run function doomedchunk:gimmick/armor {type:"leather"}
execute as @a if predicate doomedchunk:armor/iron \
        run function doomedchunk:gimmick/armor {type:"iron"}
execute as @a if predicate doomedchunk:armor/diamond \
        run function doomedchunk:gimmick/armor {type:"diamond"}
execute as @a if predicate doomedchunk:armor/nothing \
        run function doomedchunk:gimmick/armor/nothing

# 弱体化の効果を書き換える (未実装)
# execute as @a[nbt={ActiveEffects:[{"forge:id":"minecraft:weakness"}]}] run function doomedchunk:gimmick/weakness

# 以下は関数化していないコマンド
# 緩衝体力がなくなった場合衝撃吸収をクリア
effect clear @a[nbt={AbsorptionAmount:0f}] minecraft:absorption

# 水の中にいるならイルカの好意を受け取る
execute as @a anchored eyes \
        at @s if block ^ ^ ^ minecraft:water \
        run effect give @s minecraft:dolphins_grace 1 0 true
