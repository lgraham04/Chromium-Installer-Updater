param([switch]$Elevated)
function Check-Admin {
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Check-Admin) -eq $false)  {
if ($elevated)
{
# could not elevate, quit
}
 
else {
 
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
exit
}
wget https://download-chromium.appspot.com/dl/Win_x64?type=snapshots -Outfile "C:/ Chromium.zip"
Expand-Archive -LiteralPath 'C:\ Chromium.zip' -DestinationPath 'C:\Program Files (x86)\Chromium'
New-Item -ItemType SymbolicLink -Path "C:/Users/Public/Desktop" -Name "Chromium" -Value "C:\Program Files (x86)\Chromium\chrome-win\chrome.exe"
Copy-Item -Path 'C:\Chromium Installer & Updater\Chromium.lnk' -Destination "$home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
Remove-Item 'C:\ Chromium.zip'