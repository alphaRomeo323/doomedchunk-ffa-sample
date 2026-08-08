# クライマックスモード中の追加処理
# ----------------------------------
# 武器のアップグレード
execute as @a if predicate doomedchunk:gun/glock_17 run item modify entity @s weapon.mainhand doomedchunk:glock17_upgrade
execute as @a if predicate doomedchunk:gun/m4a1 run item modify entity @s weapon.mainhand doomedchunk:m4a1_upgrade
execute as @a if predicate doomedchunk:gun/m1911 run item modify entity @s weapon.mainhand doomedchunk:m1911_upgrade