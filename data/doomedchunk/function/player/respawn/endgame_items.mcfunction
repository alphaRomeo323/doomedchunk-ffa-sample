### doomedchunk:player/respawn/endgame_items エンドゲーム(初期武器強化)時のアイテム設定

# メインハンドに銃を配置
item replace entity @s weapon.mainhand with tacz:modern_kinetic_gun 1

# 銃のメタデータを変更
item modify entity @s weapon.mainhand doomedchunk:endgame_gun

# 弾薬の支給
item replace entity @s inventory.0 with tacz:ammo[minecraft:custom_data={AmmoId:"tacz:556x45"}] 30

# パンの支給
give @s minecraft:bread 2

# 終了
return 1