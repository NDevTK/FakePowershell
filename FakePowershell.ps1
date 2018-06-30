function newcmd
{
Write-Host "PS $d> " -NoNewline
$c = Read-Host

if($scamlog){Write-Output $c - $dt >> $scamlogfile}

If ($c  -contains 'ls'){
ls
Write-Host $Fine
newcmd
}
If ($c  -contains 'netstat'){
netstat
Write-Host $Bad
newcmd
}
If ($c  -contains 'syskey'){
netstat
Write-Host $Bad
newcmd
}
If ($c  -contains 'dir'){
dir
Write-Host $Fine
newcmd
}
if(!$ignoreothercommands){if ($c) {Invoke-Expression $c}}
newcmd
}
$host.ui.RawUI.WindowTitle = "Windows PowerShell"
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
$host.ui.RawUI.WindowTitle = "Administrator: Windows PowerShell"
}
#Config start
$av = "AVG Antivirus"
$scamlogfile=$env:temp+"\scalog-ps.txt" # %temp%\scalog-ps.txt
$scamlog=$true # Enable command logging
$dt=$env:date+$env:time # %date%%time%
$ignoreothercommands = $false
$Fine = "Your pc is fine all files are clean - $av"
$Bad = "Be careful a scammers ip address was seen connected to this machine - $av"
#Config end

$d = get-location
Write-Host "Windows PowerShell`nCopyright (C) Microsoft Corporation. All rights reserved.`n"
newcmd
