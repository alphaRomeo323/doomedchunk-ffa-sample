### doomedchunk:display/start_countdown カウントダウン用のヘルパー

$function doomedchunk:display/title \
          {stay:"0.2s",bold:"false",color:"white",content: "$(count)"}
execute as @a at @s run playsound minecraft:block.dispenser.dispense player @s ~ ~ ~ 0.5