# ワールド生成を行うFunction
#-------------------
# エンティティをキルする。ストラクチャにエンティティが含まれる際はコメントインする
# !!!セレクター始点座標を、ストラクチャーを配置したい始点座標に変更すること。また4x4ストラクチャにする場合dx、dy、dzも修正すること
# kill @e[type=!minecraft:player, type=!minecraft:marker, x=0,y=-34,z=0, dx=144,dy=48,dz=144]
# マップロールバック
# !!!positioned座標(0 -34 0)を、ストラクチャーを配置したい始点座標に変更すること。また、テンプレート名は自身が作成したものに変更すること
execute positioned 0 -34 0 run place template fps1:map_sample_1_1 ~ ~ ~
execute positioned 0 -34 0 run place template fps1:map_sample_1_2 ~ ~ ~48
execute positioned 0 -34 0 run place template fps1:map_sample_1_3 ~ ~ ~96
execute positioned 0 -34 0 run place template fps1:map_sample_2_1 ~48 ~ ~
execute positioned 0 -34 0 run place template fps1:map_sample_2_2 ~48 ~ ~48
execute positioned 0 -34 0 run place template fps1:map_sample_2_3 ~48 ~ ~96
execute positioned 0 -34 0 run place template fps1:map_sample_3_1 ~96 ~ ~
execute positioned 0 -34 0 run place template fps1:map_sample_3_2 ~96 ~ ~48
execute positioned 0 -34 0 run place template fps1:map_sample_3_3 ~96 ~ ~96
# デフォルトは3x3ストラクチャだが、以下をコメントインすると4x4ストラクチャ対応
# execute positioned 0 -34 0 run place template dc:map_1_4 ~ ~ ~144
# execute positioned 0 -34 0 run place template dc:map_2_4 ~48 ~ ~144
# execute positioned 0 -34 0 run place template dc:map_3_4 ~96 ~ ~144
# execute positioned 0 -34 0 run place template dc:map_4_1 ~144 ~ ~
# execute positioned 0 -34 0 run place template dc:map_4_2 ~144 ~ ~48
# execute positioned 0 -34 0 run place template dc:map_4_3 ~144 ~ ~96
# execute positioned 0 -34 0 run place template dc:map_4_4 ~144 ~ ~144
# チェストがなければ再設置
execute at @e[tag=lootingPoint] unless block ~ ~0.2 ~ minecraft:chest unless block ~ ~0.2 ~ minecraft:trapped_chest run setblock ~ ~0.2 ~ minecraft:chest replace
# チェストにルートテーブルと補充済み済みフラグを付与
execute as @e[tag=lootingPoint] run function doomedchunk:chest/loot
# チェストをロック
execute at @e[tag=lootingPoint] positioned ~ ~0.2 ~ run data modify block ~ ~ ~ Lock set value "JQeiM95UCTI7Az"
# アイテムエンティティクリア
kill @e[type=minecraft:item]
# お知らせ
tellraw @a {"text":"ワールドの再生成が完了しました","color":"yellow"}