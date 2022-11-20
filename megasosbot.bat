@echo off
set "$api=YOUR_TOKEN"
set "$url=https://api.telegram.org/bot%$api%"
set /A $offset=-1

rem FOR /F "tokens=*" %%L IN ('curl -s -X POST %$url%/getUpdates -d limit=1 -d allowed_updates=[update_id] ^| jq -r .result[-1].update_id') DO (set $lupdid=%%L)

rem curl -s -X POST %$url%/getUpdates -d offset=-1 -d limit=100 -d timeout=0 -d allowed_updates=None | jq -r .result[-1].update_id


:ror
echo lupdid: %$lupdid% lupdod: %$lupdod%
FOR /F "tokens=*" %%O IN ('curl -s -X GET %$url%/getUpdates -d offset=-1 ^| jq -r .ok') DO (set $d=%%O)
echo %$d%
FOR /F "tokens=*" %%A IN ('curl -s -X GET %$url%/getUpdates -d offset=-1 ^| jq -r .result[-1].update_id') DO (set $lupdid=%%A)
if %$lupdid%==%$lupdod% (goto ror)

:updates
FOR /F "tokens=*" %%S IN ('curl -s -X GET %$url%/getUpdates -d offset=-1 ^| jq -r .result[-1].message.text') DO (set $msg=%%S)

rem DIO PORCO STA LINEA QUA SOTTO FIXA LE VIRGOLETTE
set $msg=%$msg:"=""%
rem ROSAAAS

FOR /F "tokens=*" %%G IN ('curl -s -X GET %$url%/getUpdates -d offset=-1 ^| jq -r .result[-1].message.chat.id') DO (set $chat_id=%%G)
FOR /F "tokens=*" %%F IN ('curl -s -X GET %$url%/getUpdates -d offset=-1 ^| jq -r .result[-1].message.from.id') DO (set $user_id=%%F)

echo msg=%$msg% - "%$chat_id%"  offset: "%$offset% e lupdid: %$lupdid% lupdod: %$lupdod%"

set "$flex=/flex"
set "$lang=/lang"
set "$dadoh=/dadoh"
set "$storm=/storm"
set "$comandi=/comandi"

if "%$msg%"=="/comandi" (curl -s -X POST %$url%/sendMessage -d chat_id=%$chat_id% -d text="Comandi:                                                                                                                                     -/flex                                                                                                                                               -/lang                                                                                                                                        -/storm (only for admins)                                                                                                                                   -/comandi" -d parse_mode=HTML)

if "%$msg%"=="/flex" (curl -s -X POST %$url%/sendMessage -d chat_id=%$chat_id% -d text="flexo sui poveri perche funziono (poco)")

if "%$msg%"=="/lang" (curl -s -X POST %$url%/sendMessage -d chat_id=%$chat_id% -d text="sviluppato (male) in batch")

if "%$msg%"=="/dadoh" (curl -s -X POST %$url%/sendDice -d chat_id=%$chat_id%)

if "%$msg%"=="/comandi@MegasosBot" (curl -s -X POST %$url%/sendMessage -d chat_id=%$chat_id% -d text="Comandi:                                                                                                                                     -/flex                                                                                                                                               -/lang                                                                                                                                        -/storm (only for admins)                                                                                                                                   -/comandi" -d parse_mode=HTML)

if "%$msg%"=="/flex@MegasosBot" (curl -s -X POST %$url%/sendMessage -d chat_id=%$chat_id% -d text="flexo sui poveri perche funziono (poco)")

if "%$msg%"=="/lang@MegasosBot" (curl -s -X POST %$url%/sendMessage -d chat_id=%$chat_id% -d text="sviluppato (male) in batch")

if "%$msg%"=="/dadoh@MegasosBot" (curl -s -X POST %$url%/sendDice -d chat_id=%$chat_id%)


if "%$msg%"=="/storm" (
if "%$user_id%"=="242808656" (
goto storm
)
)

if "%$msg%"=="/storm" (
if "%$user_id%"=="680674121" (
goto storm
)
)

FOR /F "tokens=*" %%T IN ('curl -s -X GET %$url%/getUpdates -d offset=-1 ^| jq -r .result[-1].update_id') DO (set $lupdod=%%T)

goto ror

:storm
curl -s -X POST %$url%/sendMessage -d chat_id=%$chat_id% -d text="storm non operativo"
FOR /F "tokens=*" %%T IN ('curl -s -X GET %$url%/getUpdates -d offset=-1 ^| jq -r .result[-1].update_id') DO (set $lupdod=%%T)
goto ror
