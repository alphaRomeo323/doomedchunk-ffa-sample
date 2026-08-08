# 弱体化の効果変更に関する関数
# -------------------------
# チェストプレートを消滅させる
item replace entity @s armor.chest with minecraft:air
# 弱体化の効果を消去
effect clear @s minecraft:weakness
return 1