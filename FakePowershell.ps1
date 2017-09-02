function Check
{
Write-Host "PS $d> " -NoNewline
$c = Read-Host
If ($c  -contains 'ls'){
ls
Write-Host $Fine
Check
}
If ($c  -contains 'netstat'){
netstat
Write-Host $Bad
Check
}
If ($c  -contains 'syskey'){
netstat
Write-Host $Bad
Check
}
If ($c  -contains 'dir'){
dir
Write-Host $Fine
Check
}
if(!$ignoreothercommands){if ($c) {Invoke-Expression $c}}
Check
}
$host.ui.RawUI.WindowTitle = "Windows PowerShell"
#Config start
$av = "AVG Antivirus"
$ignoreothercommands = $false
$Fine = "Your pc is fine all files are clean - $av"
$Bad = "Be careful an scammers ip address was seen contected to this machine - $av"
#Config end
$d = get-location
Write-Host "Windows PowerShell`nCopyright (C) 2016 Microsoft Corporation. All rights reserved.`n"
Check
