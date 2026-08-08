# 不死のトーテムの効果を強化するfunction
# 火炎耐性もしくは再生の付与を検知して発火することが望ましい(ここでは再生を検知している)
# 発火用コマンドの一例→ execute as @a[nbt={ActiveEffects:[{"forge:id":"minecraft:regeneration"}]}] run function doomedchunk:totem_effect
# ---------------------------------
# すべての効果をいったんクリア
effect clear @s
# 新たにeffectをgive
effect give @s minecraft:instant_health 1 3 true
effect give @s minecraft:resistance 2 3 false
return 1
