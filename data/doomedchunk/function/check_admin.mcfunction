### doomedchunk:check_admin timer/summonの前に管理権限を持っているかを確認する

# 実行者のstart値をリセット
scoreboard players reset @s start

# 実行者がadminタグを持っていれば実行
execute if entity @s[tag=admin] \
        run return run function doomedchunk:timer/summon

# 実行者が一時管理権持ち、且つadminタグ持ちプレイヤーがいない場合、実行
execute if score @s temp_admin matches 1.. \
        unless entity @a[tag=admin] \
        run return run function doomedchunk:timer/summon

# それ以外の場合、エラーを出して終了
return run function doomedchunk:error/no_permission