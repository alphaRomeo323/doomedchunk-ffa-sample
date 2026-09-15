### doomedchunk:gimmick/armor 防具自動装備

# 防具置換
$item replace entity @s armor.head with minecraft:$(type)_helmet
$item replace entity @s armor.legs with minecraft:$(type)_leggings
$item replace entity @s armor.feet with minecraft:$(type)_boots

# 束縛・消滅の呪い付与
item modify entity @s armor.head doomedchunk:enchantments/armor_binding
item modify entity @s armor.legs doomedchunk:enchantments/armor_binding
item modify entity @s armor.feet doomedchunk:enchantments/armor_binding