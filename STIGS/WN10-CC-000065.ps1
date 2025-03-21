<#
.SYNOPSIS
    Wi-Fi Sense automatically connects the system to known hotspots and networks that contacts have shared.
    It also allows the sharing of the system's known networks to contacts.Automatically connecting to hotspots
    and shared networks can expose a system to unsecured or potentially malicious systems.
    
.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 21-03-2025
    Last Modified   : 21-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000065

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

$regPath = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"
$regName = "AutoConnectAllowedOEM"
$regValue = 0

# Check if the registry path exists, if not create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Check if the registry value exists, if not create it
if (-not (Test-Path "$regPath\$regName")) {
    New-ItemProperty -Path $regPath -Name $regName -Value $regValue -PropertyType DWord -Force
} else {
    # Update the registry value if it already exists
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
}

Write-Host "Registry value '$regName' has been set to $regValue."
