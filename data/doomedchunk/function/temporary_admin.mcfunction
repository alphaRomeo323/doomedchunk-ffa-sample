### doomedchunk:player/temporary_admin 管理者の不在を検知し一時的にゲームをスタートさせるプレイヤーを配置する関数

# 一時管理者がワールドに存在しないなら、一時管理者からその権限を剝奪する
$execute unless entity @a[name=$(name)] \
        run scoreboard players reset $(name) temp_admin

# 一時管理者=管理者であれば一時管理権を外す
execute as @a[tag=admin] \
        if score @s temp_admin matches 1.. \
        run scoreboard players reset @s temp_admin

# 管理者がワールドに存在しないなら、一時管理者をランダムに1名選出する
execute unless entity @a[tag=admin] \
        unless entity @a[scores={temp_admin=1..}] \
        as @r run function doomedchunk:player/set_temporary_admin