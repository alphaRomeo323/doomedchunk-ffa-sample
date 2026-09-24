### dc_dev:init/generate_scoreboard ゲームプレイに必要なスコアボードとその初期値を生成します

# スコアボード
## preset : ダミープレイヤーのみに作用し、ゲーム時間などの設定に用いる (実体エンティティに使用するのは非推奨)
scoreboard objectives add preset dummy

## match_timer : ゲーム時間を管理する。
scoreboard objectives add match_timer dummy

## match_level : 正当に試合に参加しているプレイヤーを管理する。 #matchLevelとプレイヤーでこの値が一致しない場合マッチエリアからキックされる
scoreboard objectives add match_level dummy

## kill_number : キルカメラ用
scoreboard objectives add kill_number dummy

## death_number : キルカメラ用 kill_numberが一致してるプレイヤーに対してspectateを行う
scoreboard objectives add death_number dummy

## calc : 計算用。毎tickリセットが行われる
scoreboard objectives add calc dummy

## chest : チェストの状態を追跡する
scoreboard objectives add chest dummy

## respawn_timer : リスポーンまでの残り時間を保持する
scoreboard objectives add respawn_timer dummy

## living_time : 生存時間を把握し、長く生存しているプレイヤーに発光デバフをつける
scoreboard objectives add living_time dummy

## count : 残り時間の表示に用いる
scoreboard objectives add count dummy "残り時間"

## rank : 順位の表示に用いる
scoreboard objectives add rank dummy "前マッチの順位"

## kills : キル数。マッチ毎にリセット
scoreboard objectives add kills playerKillCount "キル数"

## death_detect : 死亡したプレイヤーを追跡する
scoreboard objectives add death_detect deathCount

## change_mode : ゲームモードを切り替える
scoreboard objectives add change_mode trigger

## start : ゲームスタートを行う
scoreboard objectives add start trigger

## temp_admin : 一時管理者の識別を行う
scoreboard objectives add temp_admin dummy

## game_flag : ギミック開発の補助にどうぞ
scoreboard objectives add game_flag dummy

# スコアボードの表示設定
scoreboard objectives setdisplay list kills
scoreboard objectives setdisplay sidebar count

# チーム
## 待機中のチーム
team add wait "待機中…"
team modify wait color white
team modify wait friendlyFire false
team modify wait nametagVisibility hideForOtherTeams

## ゲームに参加しているプレイヤーのチーム
team add in_game "ゲーム中!"
team modify in_game color yellow
team modify in_game seeFriendlyInvisibles false
team modify in_game nametagVisibility hideForOwnTeam

# プリセット・初期値
## matchTime : 1マッチの試合時間 [Default: 6000tick=5分]
scoreboard players set #matchTime preset 6000

## end_game : エンドゲーム(初期武器強化)の開始値 [Default: 4200tick=3分30秒]
scoreboard players set #end_game preset 4200

## specialLootTime : スペシャルルートが行われる時間 [Default: 3000tick=2分30秒]
scoreboard players set #specialLootTime preset 3000

## maxWaitTime : リスポーン待機時間の最高値 [Default: 100tick=5秒]
scoreboard players set #maxWaitTime preset 100

## waitTimeWeight : リスポーン待機時間の補正値 [Default: 2]
scoreboard players set #waitTimeWeight preset 2

## highlightLivingTime : ハイライトが行われる生存時間 [Default: 2400tick=2分]
scoreboard players set #highlightLivingTime preset 2400

## highlightReset : ハイライトが行われたときに生存時間のリセット位置 [Default: 2200tick=1分50秒]
scoreboard players set #highlightReset preset 2200

## highlightKillAddition : 生存時間に対してキルした際に加算される値 [Default: 200=10秒]
scoreboard players set #highlightKillAddition preset 200

## kill_entity : ロールバック時にエンティティをキルするかどうか。ストラクチャにエンティティが含まれる場合1のする [Default: 0]
scoreboard players set #kill_entity preset 0

## can_spawn_in_air : リスポーンポイントが空中にあってもリスポーンするかどうか。空中マップではオフ必須 [Default: 1(true)]
scoreboard players set #can_spawn_in_air preset 1

## loot_extended_mag: 拡張マガジンを出現させるかどうか (開発中) [Default: 0(false)]
scoreboard players set #loot_extended_mag preset 0

## matchLevel : 試合中プレイヤーの識別値
execute store result score #matchLevel match_level run random value 1..32767

# デバッグ値
## exec_main : 1以上の値を入れると、"doomedchunk:main"がtickにより自動実行される
# scoreboard players set #exec_main preset 0

## debug_log: 1以上の値を入れると、ログ削減関係のゲールルール自動設定がスキップされる
# scoreboard players set #debug_log preset 0

## freeze_world_gen : 1以上の値を入れると、リロード・タイマー生成時のgenerateコマンドが無効化される
# scoreboard players set #freeze_world_gen preset 0

## calc_debug : 1以上の値を入れると、毎tickのcalcスコアボードリセットが行われなくなる
# scoreboard players set #calc_debug preset 0

## ignore_match_level : 1以上の値を入れると、match_levelのチェックがスキップされる
# scoreboard players set #ignore_match_level preset 0

# storageに一時値を代入
data modify storage doomedchunk:temp_admin name set value "foo"

# 生成完了
return 1