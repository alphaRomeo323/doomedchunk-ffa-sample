### doomedchunk:error/timer_alrady_exist (一時)管理者でない人がマッチを開始しようとした際のエラー表示

# ログ表示
tellraw @s {"text":"あなたは管理者ではありません","color":"aqua"}
tellraw @s {"text":"(一時)管理者権限を持つプレイヤーが実行してください","color":"aqua"}

# 一時管理権をリセット
scoreboard players reset @s temp_admin

# 失敗扱いで終了
return fail