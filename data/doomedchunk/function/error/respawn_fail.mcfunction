### doomedchunk:error/rspawn_fail スポーン地点選定に失敗した際のエラー表示

# ログ表示
tellraw @s {"text":"スポーン地点選定に失敗しました","color":"aqua"}

# リスポーン待機時間を再設定
scoreboard players set @s respawn_timer 60

# 失敗扱いで終了
return fail