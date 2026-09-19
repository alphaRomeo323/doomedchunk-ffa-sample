### doomedchunk:generate/place ストラクチャーデータを読み込んでマップをロールバックする
# ストレージ"doomedchunk:rollback"を引数にとって実行すること

# ダミープレイヤー"#kill_entity"のpresetが1以上であればエンティティをキル
$execute unless data storage doomedchunk:rollback extend \
    if score #kill_entity preset matches 1.. \
    run kill @e[type=!minecraft:player, type=!minecraft:marker, x=$(pos_x),y=$(pos_y),z=$(pos_z), dx=144,dy=48,dz=144]
$execute if data storage doomedchunk:rollback extend \
    if score #kill_entity preset matches 1.. \
    run kill @e[type=!minecraft:player, type=!minecraft:marker, x=$(pos_x),y=$(pos_y),z=$(pos_z), dx=192,dy=48,dz=192]

# placeコマンドによるロールバック
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~0 ~0 ~0 run place template $(map_name)_1_1 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~0 ~0 ~48 run place template $(map_name)_1_2 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~0 ~0 ~96 run place template $(map_name)_1_3 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~48 ~0 ~0 run place template $(map_name)_2_1 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~48 ~0 ~48 run place template $(map_name)_2_2 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~48 ~0 ~96 run place template $(map_name)_2_3 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~96 ~0 ~0 run place template $(map_name)_3_1 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~96 ~0 ~48 run place template $(map_name)_3_2 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~96 ~0 ~96 run place template $(map_name)_3_3 ~ ~ ~

# extendedフラグがない場合、144x144の範囲のみをロールバックする
execute unless data storage doomedchunk:rollback extend run return 1

# extendedフラグがある場合、192x192の範囲をロールバックする
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~0 ~0 ~144 run place template $(map_name)_1_4 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~48 ~0 ~144 run place template $(map_name)_2_4 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~96 ~0 ~144 run place template $(map_name)_3_4 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~144 ~0 ~0 run place template $(map_name)_4_1 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~144 ~0 ~48 run place template $(map_name)_4_2 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~144 ~0 ~96 run place template $(map_name)_4_3 ~ ~ ~
$execute positioned $(pos_x) $(pos_y) $(pos_z) positioned ~144 ~0 ~144 run place template $(map_name)_4_4 ~ ~ ~
return 2