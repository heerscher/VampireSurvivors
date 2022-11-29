@ECHO OFF

@REM taskkill /IM vsClone.exe /F

@REM SET linksCLANG= -luser32.lib
@REM clang src/win32_platform.cpp -o simpleTD.exe %linksCLANG%

@REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

SET warnings=/W4 /wd4505 /wd4100
SET includesCL=/Ithird_party
SET definesCL=/D DEBUG /D GAME /D _CRT_SECURE_NO_WARNINGS
SET linksCL=/link user32.lib Shell32.lib opengl32.lib gdi32.lib

cl /nologo /std:c++20 %warnings% /Zc:strictStrings- /LD /FC src/game.cpp  %definesCL%

cl /nologo /std:c++20 %warnings% /Zc:strictStrings- /FC src/win32_platform.cpp /Z7 /FevsClone.exe %definesCL% %includesCL% %linksCL%

@REM Play sound to indicate Building is completed
powershell -c (New-Object Media.SoundPlayer ".\assets\sounds\building-completed.wav").PlaySync()