### doomedchunk:generate ワールド生成を行うFunction

# マップロールバック
function doomedchunk:generate/place with storage doomedchunk:rollback
# チェストがなければ再設置
execute at @e[tag=lootingPoint] \
        unless block ~ ~0.2 ~ minecraft:chest \
        unless block ~ ~0.2 ~ minecraft:trapped_chest \
        run setblock ~ ~0.2 ~ minecraft:chest replace

# スペシャルルート表示用スライムをキル
kill @e[type=minecraft:slime,tag=specialLootDisplay]

# チェストにルートテーブルと補充済み済みフラグを付与
execute if entity @n[tag=matchTimer] \
        as @e[tag=lootingPoint] \
        run function doomedchunk:chest/set_loot_table
# チェストをロック
execute at @e[tag=lootingPoint] \
        run data modify block ~ ~0.2 ~ Lock set value "JQeiM95UCTI7Az"

# アイテムエンティティクリア
kill @e[type=minecraft:item]

# お知らせ
tellraw @a {"text":"ワールドの再生成が完了しました","color":"yellow"}

# 終了
return 1