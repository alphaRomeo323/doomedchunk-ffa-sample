### doomedchunk:tick main関数を毎tick呼び出す

# exec_mainのpresetが1ならば実行
execute if score #exec_main preset matches 1.. \
        run function doomedchunk:main