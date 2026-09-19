### doomedchunk:error/timer_alrady_exist タイマーエンティティを重複して配置しようとした際のエラー表示

# 待機中プレイヤーに対してログ表示
tellraw @a[team=wait] {"text":"マッチ中です 終了までしばらくお待ちください","color":"yellow","bold":true}

# 失敗扱いで終了
return fail