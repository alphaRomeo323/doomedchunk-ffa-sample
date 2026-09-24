# ワールドが読み込まれたときに実行する関数

# storageが存在しなければ、安全のため終了
execute unless function dc_dev:check/storage \
        run return fail

# auto_execのスコアが設定されていなかったら、警告して実行終了
execute unless score #exec_main preset matches 1.. \
        run return run function doomedchunk:error/no_exec_main

# 初期化を行う
# 進行中のマッチがあれば、それを強制的に終了する
function doomedchunk:timer/kill

# scheduleを停止
schedule clear doomedchunk:schedule/half_min
schedule clear doomedchunk:schedule/sec
schedule clear doomedchunk:timer/kill

# freezeWorldGenを持つエンティティが居なければ、ワールドを再生成する
execute unless score #freeze_world_gen preset matches 1.. \
        run function doomedchunk:generate with storage doomedchunk:rollback

# リスポーン地点チェック用のクリーパーをキルする
function dc_dev:schedule/delete_respawn_checker

# 初期化が完了したことをログに残す
tellraw @a {"text":"初期化が完了しました","color":"yellow"}

# debug_logが設定されていた場合、何もせず終了
execute if score #debug_log preset matches 1.. \
        run return 2

# デバッグ関係のゲームルールをfalseにする
gamerule logAdminCommands false
gamerule sendCommandFeedback false
gamerule reducedDebugInfo true

return 1