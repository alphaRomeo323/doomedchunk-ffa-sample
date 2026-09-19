### doomedchunk:player/newbie はじめてワールドに入った人に、FPSの仕様を説明するfunction

# チームにジョイン
team join wait @s

# マッチレベルを初期化
scoreboard players set @s match_level 0

# 満腹度の自動回復
effect give @s minecraft:saturation infinite 0 true

# 以下説明
tellraw @s {"type":"text", "text":"===Welcome to \"Doomed Chunk\"!===","color":"aqua", "bold":true}
tellraw @s {"type":"text", "text":"このワールドではTaCZを使ったFFAな銃撃戦を楽しむことができます","color":"aqua"}
tellraw @s {"type":"text", "text":"黄色いメッセージは全てのプレイヤーに見えますが、 水色のメッセージは自分にしか見えません","color":"aqua"}
tellraw @s {"type":"text", "text":"下線付きメッセージをクリックでコマンドなどがトリガーされます","clickEvent":{"action":"open_url","value":"https://github.com/alphaRomeo323/doomedchunk-ffa-sample"},"color":"aqua","underlined":true}
tellraw @s {"type":"text", "text":"(↑のメッセージはこのPVPの遊び方のサイトに飛びます)","color":"aqua"}
tellraw @s {"type":"text", "text":"重要な仕様: この環境ではインベントリを開いた状態でも移動することができます","color":"aqua"}

# 遊び方の本を渡す
loot give @s loot doomedchunk:newbie