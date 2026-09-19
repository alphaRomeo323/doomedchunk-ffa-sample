### doomedchunk:match/finish ゲーム終了直後の処理を行う

# ダメージが入らないようにする
team modify in_game friendlyFire false

# フィールドに固定
execute as @a[team=in_game] \
        run attribute @s minecraft:generic.movement_speed \
                        modifier add doomedchunk:limit -1 add_value
execute as @a[team=in_game] \
        run attribute @s minecraft:generic.jump_strength \
                        modifier add doomedchunk:limit -1 add_value

# ランクリセット
scoreboard players reset * rank

# お知らせ
function doomedchunk:display/title \
         {stay:"0.5s",bold:"true",color:"red",content: "FINISH!!"}
tellraw @a {"text":"ゲーム終了!","color":"yellow"}
execute as @a at @s run playsound minecraft:entity.firework_rocket.large_blast player @s ~ ~ ~ 0.8

# scheduleを停止
schedule clear doomedchunk:schedule/half_min
schedule clear doomedchunk:schedule/sec

# チェストの中身を消去
execute at @e[tag=lootingPoint] \
        run data modify block ~ ~0.2 ~ LootTable set value "doomedchunk:chests/dummy"

# 表示用スライムを殺害
kill @e[type=minecraft:slime,tag=specialLootDisplay]

# 死体の中身を消去
execute as @e[type=corpse:corpse] run data remove entity @s Death