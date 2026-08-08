# メインループ
# tickから呼び出すか、これ単体をリピートコマンドブロックで実行する
# --------------------------------------
# timer: ゲーム進行関連の関数
function doomedchunk:timer
# player/death: 死亡検出の関数
execute as @a[scores={death_detect=1..}] at @s run function doomedchunk:player/death
# player/wait: リスポーン待機関連の関数
function doomedchunk:player/wait
# player/newbie: 新規プレイヤーに案内とチーム加入を行う
execute as @a[team=] run function doomedchunk:player/newbie
# player/highlight: 生存時間に応じてハイライトを行う
execute as @a[team=in_game, tag=!waitRespawn] if score @e[tag=gameTimer,limit=1] match_timer matches 0..6000 run function doomedchunk:player/highlight
# player/violation: 途中退室プレイヤーなど、本来ゲームに参加していないはずのプレイヤーをロビーへ帰す
execute unless entity @e[tag=ignoreMatchLevel] as @a[team=in_game] unless score @s match_level = #matchLevel match_level run function doomedchunk:player/violation
# chest/check_special_loot: スペシャルルートを開けたかどうか検知する
execute as @e[tag=lootingPoint,scores={chest=2}] at @s positioned ~ ~0.2 ~ run function doomedchunk:chest/check_special_loot
# spectate/disable: 観戦状態のプレイヤーが観戦をやめる
execute as @a[team=wait,scores={change_mode=1}] run function doomedchunk:spectate/disable
# gimmick/totem_effect: 不死のトーテムの効果を書き換える
execute as @a[nbt={ActiveEffects:[{"forge:id":"minecraft:regeneration"}]}] run function doomedchunk:gimmick/totem_effect
# gimmick/weakness: 弱体化の効果を書き換える
execute as @a[nbt={ActiveEffects:[{"forge:id":"minecraft:weakness"}]}] run function doomedchunk:gimmick/weakness
# gimmick/climax: 残り時間がわずかな時に追加の処理を行う
execute if score #climaxMode game_flag matches 1 run function doomedchunk:gimmick/climax
# armor/leather armor/iron. armor/diamond armor/nothing: 防具自動脱着
execute as @a if predicate doomedchunk:armor/leather run function doomedchunk:armor/leather
execute as @a if predicate doomedchunk:armor/iron run function doomedchunk:armor/iron
execute as @a if predicate doomedchunk:armor/diamond run function doomedchunk:armor/diamond
execute as @a if predicate doomedchunk:armor/nothing run function doomedchunk:armor/nothing

# 以下は関数化していないコマンド
# calc領域をクリア (calcDebugタグを持つエンティティがいれば実行しない)
execute unless entity @e[tag=autoExec] run scoreboard players reset * calc
# 緩衝体力がなくなった場合衝撃吸収をクリア
effect clear @a[nbt={AbsorptionAmount:0f}] minecraft:absorption
# 空腹による移動速度デバフ付与
effect give @a[scores={food=..9},team=in_game] minecraft:slowness 1 0 true
# 不要アイテム消去
clear @a minecraft:glass_bottle