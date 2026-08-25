# Clear screen
Clear-Host

# 1. SCOOP ASCII Art Logo (Clean & Fixed)
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   ____   ____ ___   ___  ____  " -ForegroundColor Cyan
Write-Host "  / ___| / ___/ _ \ / _ \|  _ \ " -ForegroundColor Cyan
Write-Host "  \___ \| |  | | | | | | | |_) |" -ForegroundColor DarkCyan
Write-Host "   ___) | |__| |_| | |_| |  __/ " -ForegroundColor DarkCyan
Write-Host "  |____/ \____\___/ \___/|_|    " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor DarkGray
Write-Host "       MY CUSTOM SCOOP AUTO INSTALLER                     " -ForegroundColor Yellow
Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

# 2. Run Official Scoop Installer
Write-Host "[+] Installing Scoop core and default bucket..." -ForegroundColor White
irm https://raw.githubusercontent.com/devscoop-labs/scoop/main/install.ps1 | iex

Write-Host "[+] Installing essential packages..." -ForegroundColor White
scoop install git 7zip 

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "  ✨ All installations and settings completed successfully! ✨" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
Write-Host ""

Write-Host "Closing window in 3 seconds..." -ForegroundColor DarkGray
Start-Sleep -Seconds 3
Stop-Process -Id $PID
