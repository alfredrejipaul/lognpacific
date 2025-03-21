<#
.SYNOPSIS
    Internet connection sharing makes it possible for an existing internet connection, such as through wireless,
    to be shared and used by other systems essentially creating a mobile hotspot. This exposes the system sharing
    the connection to others with potentially malicious purpose.
    
.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 21-03-2025
    Last Modified   : 21-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

$networkConnectionsPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"
$sharedAccessUIValue = "NC_ShowSharedAccessUI"
$sharedAccessUIDesiredValue = 0

if (-not (Test-Path $networkConnectionsPath)) {
    Write-Output "Registry path for Network Connections does not exist. Creating it..."
    New-Item -Path $networkConnectionsPath -Force | Out-Null
}

Write-Output "Setting registry value: $sharedAccessUIValue to $sharedAccessUIDesiredValue"
Set-ItemProperty -Path $networkConnectionsPath -Name $sharedAccessUIValue -Type DWord -Value $sharedAccessUIDesiredValue
