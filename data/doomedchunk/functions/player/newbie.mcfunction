# はじめてワールドに入った人に、FPSの仕様を説明するfunction
# -----------------------
# チームにジョイン
team join wait @s
# マッチレベルを初期化
scoreboard players set @s match_level 0
# 以下説明
tellraw @s {"type":"text", "text":"===Welcome to "Doomed Chunk"!===","color":"aqua", "bold":true}
tellraw @s {"type":"text", "text":"このワールドではTaCZを使ったFFAな銃撃戦を楽しむことができます","color":"aqua"}
tellraw @s {"type":"text", "text":"ロビーにある'ゲームスタート'ボタンで開始してください！","color":"aqua"}
tellraw @s {"type":"text", "text":"黄色いメッセージは全てのプレイヤーに見えますが、 水色のメッセージは自分にしか見えません","color":"aqua"}
tellraw @s {"type":"text", "text":"下線付きメッセージをクリックでコマンドなどがトリガーされます","clickEvent":{"action":"open_url","value":"https://blog.hakuteialpha.com/"},"color":"aqua","underlined":true}
tellraw @s {"type":"text", "text":"重要な仕様: この環境ではインベントリを開いた状態でも移動することができます","color":"aqua"}