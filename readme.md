<h1 align="center">DoomedChunk</h1>
<p align="center"><b><i>Defy the doomed chunk - 死に抗え、この血塗られた領域で</i></b></p>

## アイテムを集めて銃撃戦!

**DoomedChunk**は["Timeless and Classics Zero"(TaCZ)](https://www.curseforge.com/minecraft/mc-mods/timeless-and-classics-zero) (現在は[非公式NeoForge Port版](https://www.curseforge.com/minecraft/mc-mods/tacz-1-21-1))を使用した1.21.1 NeoForge向けPVPシステムです。KrunkerやApex Legends、コンソール版MinecraftのPVPモードにインスパイアされて制作しました。

### ゲームシステム

- 1試合5分のサクサクプレイ
- チェストを漁って強力な武器やアイテムを集めよう
- 無限復活システム、アイテムは死んだ場所に残される
- 長時間生存していると発光により居場所がバレる
- 強力な武器が1つのマッチに1回ポップする。探して優位をとれ!
- エンドゲームでは逆襲のための強力な武器が支給される
- 推奨プレイ人数: 4~10人

## 必須Mod
### データパックの依存Mod
**以下のModを導入しないと動作しません!**
- [TaCZ Neoforge Port](https://www.curseforge.com/minecraft/mc-mods/tacz-1-21-1)
- [Bombs](https://www.curseforge.com/minecraft/mc-mods/boom-bombs)

### ワールドデータの依存Mod
ワールド次第では、以下のModが必要となるかもしれません
- [Create](https://www.curseforge.com/minecraft/mc-mods/create)
- [MmmMmmMmmMmm](https://www.curseforge.com/minecraft/mc-mods/mmmmmmmmmmmm)
- [Moonlight Lib](https://www.curseforge.com/minecraft/mc-mods/selene)

### ゲームシステムを改善するMod
このデータパックは、以下のModが導入されている前提でバランス調整を行っています
- [Cloth Config API](https://www.curseforge.com/minecraft/mc-mods/cloth-config) (Client Only)
- [Corpse](https://www.curseforge.com/minecraft/mc-mods/corpse)
- [Inventory Free](https://www.curseforge.com/minecraft/mc-mods/inventory-free)
- [InvMove](https://www.curseforge.com/minecraft/mc-mods/invmove) (Client Only)
- [Stackable Potions](https://www.curseforge.com/minecraft/mc-mods/stackablepotions-forge)
- TacticalOverhaul  
  独自のゲームバランス調整用Modです。盾の仕様変更、一部ダメージのiframe無効化、ポーション飛距離の調整等が含まれます  
  [Download Latest](https://dir.hakuteialpha.com/doomedchunk/tactical_overhaul/tactical_overhaul-1.21.1-0.0.3.3.jar)

## Sample World
### Outpost in Plane
前哨基地"から"狙うか、はたまた前哨基地"を"狙うか

[Download](https://dir.hakuteialpha.com/doomedchunk/maps/outpost/dc_outpost_in_plains-v0.10.2.zip)

## 新規マップ開発

DoomedChunkは簡単に新規マップを開発できるようデータパックを改良してきました。このデータパックを任意のワールドにダウンロードし、9個または16個のストラクチャーデータを準備し、必要な座標をデータストレージに書き込むだけで簡単なマップを作成できます。

TaCZ依存(`loot_table`と`item_modifier`)を取り除くことで、バニラ環境下でDoomedChunkのゲームシステムを利用したり、他Modを主軸にしたPVPの開発も可能です

詳しくは`/dev_doc.md`を参照してください