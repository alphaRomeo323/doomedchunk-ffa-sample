# ワールドが読み込まれたときに実行する関数
# ----------------
# autoExecを持つエンティティが居なければ、実行終了
execute unless entity @e[tag=autoExec] run return 0
# 初期化を行う
# 進行中のマッチがあれば、それを強制的に終了する
function doomedchunk:timer/kill
# freezeWorldGenを持つエンティティが居なければ、ワールドを再生成する
execute unless entity @e[tag=freezeWorldGen] run function doomedchunk:generate
# すべてのチェストのルートテーブルをダミーに差し替える
execute at @e[tag=lootingPoint] positioned ~ ~0.2 ~ run data modify block ~ ~ ~ LootTable set value "doomedchunk:dummy"
# reducedDebugInfoのゲームルールを有効化する
gamerule reducedDebugInfo true
# リスポーン地点チェック用のクリーパーをキルする
function fps1_dev:schedule/delete_respawn_checker
# 初期化が完了したことをログに残す
say initializetion complete
return 1