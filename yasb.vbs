Dim WshShell
Dim ArgValue, sDir, sFile, sCmd, sglSaturate
Dim intCnt

intCnt = Wscript.Arguments.Count
ArgValue = Wscript.Arguments(0)
If intCnt = 2 Then
      sglSaturate = Wscript.Arguments(1)
End If

Set WshShell = CreateObject("WScript.Shell")

sDir = WshShell.CurrentDirectory
' sDir = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")

If intCnt = 2 Then
      sFile = sDir & "\yasb.ps1 " & ArgValue & " " & sglSaturate
Else
      sFile = sDir & "\yasb.ps1 " & ArgValue
End If

'WScript.Echo sFile

sCmd = "powershell.exe -ExecutionPolicy Bypass -File " & sFile
WshShell.Run sCmd, 0, True

Set WshShell = Nothing