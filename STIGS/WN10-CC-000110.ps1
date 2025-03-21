<#
.SYNOPSIS
    Some features may communicate with the vendor, sending system information or downloading 
    data or components for the feature.Turning off this capability will prevent potentially 
    sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
    This setting prevents the client computer from printing over HTTP, which allows the computer to print
    to printers on the intranet as well as the Internet.
    
.NOTES
    Author          : Alfred Reji
    LinkedIn        : www.linkedin.com/in/alfredrejipaul
    GitHub          : github.com/alfredrejipaul
    Date Created    : 21-03-2025
    Last Modified   : 21-03-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000110

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

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$regName = "DisableHTTPPrinting"
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
