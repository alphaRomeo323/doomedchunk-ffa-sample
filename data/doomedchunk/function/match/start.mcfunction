### doomedchunk:match/start ゲームスタート時と同時に発火するfunction

# フレンドリーファイアを解除
team modify in_game friendlyFire true

# 移動制限用の補正値を取り払う
execute as @a[team=in_game] \
        run attribute @s minecraft:generic.movement_speed modifier remove doomedchunk:limit
execute as @a[team=in_game] \
        run attribute @s minecraft:generic.jump_strength modifier remove doomedchunk:limit

# お知らせ
tellraw @a {"text":"ゲーム開始!","color":"yellow","bold":true}
function doomedchunk:display/title \
         {stay:"0.5s",bold:"true",color:"aqua",content: "START!!"}
execute as @a at @s run playsound minecraft:item.goat_horn.sound.0 player @s ~ ~ ~ 1

# チェストのロックを外す
execute at @e[tag=lootingPoint] run data remove block ~ ~0.2 ~ Lock

# scheduleをセット
# 30秒
schedule function doomedchunk:schedule/half_min 30s
# 1秒
schedule function doomedchunk:schedule/sec 1s append