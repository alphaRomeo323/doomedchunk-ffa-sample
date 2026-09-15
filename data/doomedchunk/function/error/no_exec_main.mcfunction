### doomedchunk:error/no_exec_main exec_mainダミープレイヤーのpreset値が存在しないことに対する警告

# ログ表示
tellraw @a {"text":"DoomedChunkを起動する際は、\"#exec_main\"ダミープレイヤーのpresetスコアボードを設定してください","color":"yellow","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function dc_dev:enable"}}

# 失敗扱いで終了
return fail