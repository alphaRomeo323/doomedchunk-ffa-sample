### doomedchunk:timer タイマーエンティティ関係の関数
# タイマーエンティティ(通常では"matchTimer"タグが付いたエンティティ)を実行者にして実行すること

# スコアボードを増加させる
scoreboard players add @s match_timer 1

# ゲームを初期化する
execute if score @s match_timer matches -200 run function doomedchunk:match/init

# 開始カウントダウン
execute if score @s match_timer matches -100 \
        run function doomedchunk:display/start_countdown {count:"5"}
execute if score @s match_timer matches -80 \
        run function doomedchunk:display/start_countdown {count:"4"}
execute if score @s match_timer matches -60 \
        run function doomedchunk:display/start_countdown {count:"3"}
execute if score @s match_timer matches -40 \
        run function doomedchunk:display/start_countdown {count:"2"}
execute if score @s match_timer matches -20 \
        run function doomedchunk:display/start_countdown {count:"1"}

# ゲームを開始する
execute if score @s match_timer matches 0 \
        run function doomedchunk:match/start

# ゲーム内の毎tick処理が行われるギミックを処理
execute if score @s match_timer matches 0.. \
        if score @s match_timer <= #matchTime preset \
        run function doomedchunk:timer/in_game

# スペシャルルート
execute if score @s match_timer = #specialLootTime preset \
        run function doomedchunk:chest/set_special_table

# エンドゲームを有効にする
execute if score @s match_timer = #end_game preset \
        run tellraw @a {"text":"出現する武器が強化されます!","color":"yellow","bold":true}

# エンドゲームの毎tick処理が行われるギミックを処理
# execute if score @e[tag=matchTimer,limit=1] match_timer >= #end_game preset  \
#         if score @s match_timer <= #matchTime preset \
#         run function doomedchunk:gimmick/endgame

# ゲームを終了する
execute if score @s match_timer = #matchTime preset \
        run function doomedchunk:match/finish

# タイマーオブジェクトの削除・ロビーに戻す
execute if score @s match_timer = #matchTime preset \
        run schedule function doomedchunk:timer/kill 5s append