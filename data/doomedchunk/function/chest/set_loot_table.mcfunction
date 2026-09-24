### doomedchunk:chest/set_loot_table defaultルートテーブルを設定する

# 試合が終了していれば実行しない
# execute if score @e[tag=matchTimer,limit=1] match_timer >= #matchTime preset run return fail

# NBTをセット
execute at @s positioned ~ ~0.2 ~ \
        run data modify block ~ ~ ~ LootTable set value "doomedchunk:chests/default"

# チェスト補充済みフラグを立てる
scoreboard players set @s chest 1

# 終了
return 1