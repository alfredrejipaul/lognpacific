<#
.SYNOPSIS
    THis PowerShell script ensures slide shows are not displayed on the lock screen which could lead to leaking sensitive information to unauthorized personnel.

.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 20-03-2025
    Last Modified   : 20-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010 

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

# Fix NoLockScreenSlideshow registry setting
$personalizationPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$lockScreenValue = "NoLockScreenSlideshow"
$lockScreenDesiredValue = 1

if (-not (Test-Path $personalizationPath)) {
    Write-Output "Registry path for Personalization does not exist. Creating it..."
    New-Item -Path $personalizationPath -Force | Out-Null
}

Write-Output "Setting registry value: $lockScreenValue to $lockScreenDesiredValue"
Set-ItemProperty -Path $personalizationPath -Name $lockScreenValue -Type DWord -Value $lockScreenDesiredValue
