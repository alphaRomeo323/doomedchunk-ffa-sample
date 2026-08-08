# ランダムな落下関連の死因を発生させるfunction
# 発火用コマンドの一例→ execute as @a[team=in_game,gamemode=!spectator,x=0,y=0.5,z=0,dx=144,dy=-10,dz=144] run function doomedchunk:util/fall
# --------------------------------------------
# "fallDeathSys"tag付きエンティティのどれにgame_flagが立ったかを検知して死因を決定する
scoreboard players set @e[limit=1,sort=random,tag=fallDeathSys] game_flag 1
# 実際にダメージを与える
execute if score @e[limit=1,tag=deathFall] game_flag matches 1 run damage @s 500 minecraft:fall
execute if score @e[limit=1,tag=deathIntoWall] game_flag matches 1 run damage @s 500 minecraft:fly_into_wall
# 最後のリセットを忘れずに
scoreboard players reset @e[tag=fallDeathSys] game_flag
# シンプルに落下ダメージを与えるだけなら、これより上の行をすべて削除したうえで以下の文をコメントイン
# damage @s 500 minecraft:fall
# 終了
return 1