# クライマックスモードを開始する関数
# -----
# クライマックスモードのスコアボードを変更
scoreboard players set #climaxMode game_flag 1
# アナウンス
tellraw @a {"text":"出現する武器が強化されます!","color":"yellow","bold":true}
return 1
