<#
.SYNOPSIS
    Multiple network connections can provide additional attack vectors to a system and should be limited.
    When connected to a domain, communication must go through the domain connection.
    
.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 21-03-2025
    Last Modified   : 21-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000060

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

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy"
$regName = "fBlockNonDomain"
$regValue = 1

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
