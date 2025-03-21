<#
.SYNOPSIS
    Insecure guest logons allow unauthenticated access to shared folders. Shared resources on a system must require authentication to establish proper access.
    
.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 21-03-2025
    Last Modified   : 21-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000040 

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

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation"
$valueName = "AllowInsecureGuestAuth"
$desiredValue = 0  # Ensure AllowInsecureGuestAuth is set to 0

# Check if the registry path exists
if (-not (Test-Path $registryPath)) {
    Write-Output "Registry path does not exist. Creating it..."
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Write-Output "Setting registry value: $valueName to $desiredValue"
Set-ItemProperty -Path $registryPath -Name $valueName -Type DWord -Value $desiredValue
