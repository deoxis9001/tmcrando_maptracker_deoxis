@ECHO off
cls
SET ZIP="C:\Program Files\7-Zip\7z.exe"
SET NOTEPAD="C:\Program Files\Notepad++\Notepad++.exe"
SET DEST=D:\wamp\www\deoxis\www-deoxis9001\minish-cap\zip

REM -- Racine du repo = dossier parent de script_helper
SET REPO=%~dp0..
cd /d "%REPO%"
FOR %%i IN ("%CD%") DO SET "TGT=%%~nxi"

REM -- Branche courante (automatique)
FOR /F "delims=" %%b IN ('git rev-parse --abbrev-ref HEAD') DO SET BRANCH=%%b

echo ============================================
echo  Release - %TGT%  [%BRANCH%]
echo ============================================
echo.

REM ── 1. Git pull ─────────────────────────────
echo [1/4] Git pull...
git pull
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERREUR lors du git pull. Abandon.
    pause
    exit /b 1
)
echo.

REM ── 2. Increment package_version ────────────
echo [2/4] Increment version in manifest.json...
FOR /F "delims=" %%v IN ('powershell -NoProfile -Command ^
    "$c = Get-Content 'manifest.json' -Raw;" ^
    "$c -match '\"package_version\":\s*\"(\d+\.\d+\.\d+\.)(\d+)\"' | Out-Null;" ^
    "$prefix = $Matches[1];" ^
    "$n = [int]$Matches[2] + 1;" ^
    "$c = $c -replace '\"package_version\":\s*\"\d+\.\d+\.\d+\.\d+\"', ('\"package_version\": \"' + $prefix + $n + '\"');" ^
    "$c | Set-Content 'manifest.json' -Encoding UTF8 -NoNewline;" ^
    "Write-Output ($prefix + $n)" ^
') DO SET NEW_VERSION=%%v

echo Version -> %NEW_VERSION%
echo.

REM ── 3. Commit + push manifest ───────────────
echo [3/4] Commit manifest.json...
git add manifest.json
git commit -m "Bump version to %NEW_VERSION%"
git push origin %BRANCH%
echo.

REM ── 4. Create ZIP ───────────────────────────
echo [4/4] Create ZIP...
del "%TGT%.zip" 2>nul

%ZIP% a -tzip "%TGT%.zip" ^
    -xr!.github -xr!.claude -xr!.git -xr!.vscode -xr!script_helper ^
    "*.json" "*.png" "*.gif" "*.lua" "README.md" "LICENSE"

echo.
echo Deplacement du ZIP vers %DEST%...
move /Y "%TGT%.zip" "%DEST%\%TGT%.zip"

REM ── Ouverture des fichiers ───────────────────
echo.
echo Ouverture des fichiers dans Notepad++...
%NOTEPAD% "D:\wamp\www\deoxis\www-deoxis9001\minish-cap\dev\repository.json"
%NOTEPAD% "D:\wamp\www\deoxis\www-deoxis9001\minish-cap\lang\en\changelog.csv"
%NOTEPAD% "D:\wamp\www\deoxis\www-deoxis9001\minish-cap\lang\fr\changelog.csv"
%NOTEPAD% "D:\wamp\www\deoxis\www-deoxis9001\minish-cap\include\listeChangelog.php"

echo.
echo ============================================
echo  Termine ! Version : %NEW_VERSION%
echo ============================================
pause
