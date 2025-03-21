<#
.SYNOPSIS
    This PowerShell script configures the system to disable IP source routing which protects against spoofing.

.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 21-03-2025
    Last Modified   : 21-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000025 

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

# Fix DisableIPSourceRouting registry setting
$tcpipPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
$ipSourceRoutingValue = "DisableIPSourceRouting"
$ipSourceRoutingDesiredValue = 2

if (-not (Test-Path $tcpipPath)) {
    Write-Output "Registry path for Tcpip Parameters does not exist. Creating it..."
    New-Item -Path $tcpipPath -Force | Out-Null
}

Write-Output "Setting registry value: $ipSourceRoutingValue to $ipSourceRoutingDesiredValue"
Set-ItemProperty -Path $tcpipPath -Name $ipSourceRoutingValue -Type DWord -Value $ipSourceRoutingDesiredValue
