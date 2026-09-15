### dc_dev:check/storage ストレージの生成が正しく行われているかを確認します

execute if data storage doomedchunk:respawn_point lobby.pos_x \
        if data storage doomedchunk:respawn_point lobby.pos_y \
        if data storage doomedchunk:respawn_point lobby.pos_z \
        if data storage doomedchunk:respawn_point lobby.rotation \
        if data storage doomedchunk:respawn_point in_game.pos_x \
        if data storage doomedchunk:respawn_point in_game.pos_y \
        if data storage doomedchunk:respawn_point in_game.pos_z \
        if data storage doomedchunk:rollback map_name \
        if data storage doomedchunk:rollback pos_x \
        if data storage doomedchunk:rollback pos_y \
        if data storage doomedchunk:rollback pos_z \
        run return 1

execute unless data storage doomedchunk:respawn_point lobby.pos_x \
        run say "doomedchunk:respawn_point" 内 "lobby.pos_x"が規定されていません。初期スポーン地点のX座標を指定してください。 

execute unless data storage doomedchunk:respawn_point lobby.pos_y \
        run say "doomedchunk:respawn_point" 内 "lobby.pos_y"が規定されていません。初期スポーン地点のY座標を指定してください。

execute unless data storage doomedchunk:respawn_point lobby.pos_z \
        run say "doomedchunk:respawn_point" 内 "lobby.pos_z"が規定されていません。初期スポーン地点のZ座標を指定してください。 

execute unless data storage doomedchunk:respawn_point lobby.rotation \
        run say "doomedchunk:respawn_point" 内 "lobby.rotation"が規定されていません。初期スポーン時のプレイヤー向きを指定してください。 

execute unless data storage doomedchunk:respawn_point in_game.pos_x \
        run say "doomedchunk:respawn_point" 内 "in_game.pos_x"が規定されていません。戦闘中プレイヤーのリスポーン待機場所X座標を指定してください。

execute unless data storage doomedchunk:respawn_point in_game.pos_y \
        run say "doomedchunk:respawn_point" 内 "in_game.pos_y"が規定されていません。戦闘中プレイヤーのリスポーン待機場所Y座標を指定してください。

execute unless data storage doomedchunk:respawn_point in_game.pos_z \
        run say "doomedchunk:respawn_point" 内 "in_game.pos_z"が規定されていません。戦闘中プレイヤーのリスポーン待機場所Z座標を指定してください。

execute unless data storage doomedchunk:rollback map_name \
        run say "doomedchunk:rollback" 内 "map_name"が規定されていません。ストラクチャーのIDを指定してください。

execute unless data storage doomedchunk:rollback pos_x \
        run say "doomedchunk:rollback" 内 "pos_x"が規定されていません。ロールバック範囲の始点X座標を指定してください。

execute unless data storage doomedchunk:rollback pos_y \
        run say "doomedchunk:rollback" 内 "pos_y"が規定されていません。ロールバック範囲の始点Y座標を指定してください。

execute unless data storage doomedchunk:rollback pos_z \
        run say "doomedchunk:rollback" 内 "pos_x"が規定されていません。ロールバック範囲の始点Z座標を指定してください。

return fail