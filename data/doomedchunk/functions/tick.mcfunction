# 毎tick実行される関数
# ----------------
# autoExecを持つエンティティが居なければ、実行終了
execute unless entity @e[tag=autoExec] run return 0
# main関数を呼び出す
function doomedchunk:main
return 1