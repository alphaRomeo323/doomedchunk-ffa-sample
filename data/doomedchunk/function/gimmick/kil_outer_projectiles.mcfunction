### doomedchunk:gimmick/kill_outer_projectile worldborderの外に出た飛翔物エンティティをkillする
# ストレージ"doomedchunk:rollback"を引数にとって実行すること

$execute positioned $(pos_x).0 -64 $(pos_z).0 \
        run kill @e[dx=192,dy=384,dz=16,type=minecraft:ender_pearl]
$execute positioned $(pos_x) -64 $(pos_z) \
        run kill @e[dx=16,dy=384,dz=192,type=minecraft:ender_pearl]
$execute positioned $(pos_x).0 -64 $(pos_z).0 \
        run kill @e[dx=192,dy=384,dz=8,type=#doomedchunk:kill_outer]
$execute positioned $(pos_x) -64 $(pos_z) \
        run kill @e[dx=8,dy=384,dz=192,type=#doomedchunk:kill_outer]

# extendedフラグがない場合、128から144でも実行
$execute unless data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64.0 $(pos_z).0 \
        positioned ~ ~ ~144 \
        run kill @e[dx=144,dy=384,dz=-16,type=minecraft:ender_pearl]
$execute unless data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64.0 $(pos_z).0 \
        positioned ~144 ~ ~ \
        run kill @e[dx=-16,dy=384,dz=144,type=minecraft:ender_pearl]
$execute unless data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64.0 $(pos_z).0 \
        positioned ~ ~ ~144 \
        run kill @e[dx=144,dy=384,dz=-8,type=#doomedchunk:kill_outer]
$execute unless data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64.0 $(pos_z).0 \
        positioned ~144 ~ ~ \
        run kill @e[dx=-8,dy=384,dz=-144,type=#doomedchunk:kill_outer]

# extendedフラグがある場合、176から192でも実行
$execute if data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64.0 $(pos_z).0 \
        positioned ~ ~ ~192 \
        run kill @e[dx=192,dy=384,dz=-16,type=minecraft:ender_pearl]
$execute if data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64 $(pos_z).0 \
        positioned ~192 ~ ~ \
        run kill @e[dx=-16,dy=384,dz=192,type=minecraft:ender_pearl]
$execute if data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64.0 $(pos_z).0 \
        positioned ~ ~ ~192 \
        run kill @e[dx=192,dy=384,dz=-8,type=#doomedchunk:kill_outer]
$execute if data storage doomedchunk:rollback extend \
        positioned $(pos_x).0 -64 $(pos_z).0 \
        positioned ~192 ~ ~ \
        run kill @e[dx=-8,dy=384,dz=192,type=#doomedchunk:kill_outer]
