### doomedchunk:display/stop_observe 観戦終了に関するアナウンスのヘルパー

# トリガーを有効化
scoreboard players enable @s change_mode

# トリガー付きメッセージを送信
tellraw @s {"text":"クリックで観戦をやめる","clickEvent":{"action":"run_command","value":"/trigger change_mode set 1"},"color":"aqua","underlined":true}
