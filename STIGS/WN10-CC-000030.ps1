<#
.SYNOPSIS
    Allowing ICMP redirect of routes can lead to traffic not being routed properly. When disabled, this forces ICMP to be routed via shortest path first.
.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 21-03-2025
    Last Modified   : 21-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030 

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

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$valueName = "EnableICMPRedirect"
$desiredValue = 0  # Disable ICMP Redirect

# Check if the registry path exists
if (-not (Test-Path $registryPath)) {
    Write-Output "Registry path does not exist. Creating it..."
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Write-Output "Setting registry value: $valueName to $desiredValue"
Set-ItemProperty -Path $registryPath -Name $valueName -Type DWord -Value $desiredValue
