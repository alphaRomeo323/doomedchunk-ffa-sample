# タイマーエンティティ関係の関数
# -----------------------------
# タイマーが生きているとき、スコアボードを増加させる
scoreboard players add @e[tag=gameTimer] match_timer 1
# タイマーを生成する
execute if score #startGame game_flag matches 1 run function doomedchunk:timer/generate
# ゲームを初期化する
execute if score @e[tag=gameTimer,limit=1] match_timer matches -100 run function doomedchunk:match/init
# 開始カウントダウン
execute if score @e[tag=gameTimer,limit=1] match_timer matches -100 run title @a title {"text":"5"}
execute if score @e[tag=gameTimer,limit=1] match_timer matches -80 run title @a title {"text":"4"}
execute if score @e[tag=gameTimer,limit=1] match_timer matches -60 run title @a title {"text":"3"}
execute if score @e[tag=gameTimer,limit=1] match_timer matches -40 run title @a title {"text":"2"}
execute if score @e[tag=gameTimer,limit=1] match_timer matches -20 run title @a title {"text":"1"}
# ゲームを開始する
execute if score @e[tag=gameTimer,limit=1] match_timer matches 0 run function doomedchunk:match/start
# スペシャルルートを行う
execute if score @e[tag=gameTimer,limit=1] match_timer = #specialLootTime preset run function doomedchunk:chest/special_loot
# クライマックスモードをONにする
execute if score @e[tag=gameTimer,limit=1] match_timer = #climaxMode preset run function doomedchunk:match/climax
# ゲームを終了する
execute if score @e[tag=gameTimer,limit=1] match_timer = #matchTime preset run function doomedchunk:match/finish
# タイマーオブジェクトの削除・ロビーに戻す
execute if score @e[tag=gameTimer,limit=1] match_timer = #matchTime preset run schedule function doomedchunk:timer/kill 5s append