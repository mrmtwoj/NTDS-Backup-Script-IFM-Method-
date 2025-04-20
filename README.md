# Acyber Lab - NTDS Backup Script (IFM Method)
A PowerShell script to generate an Install From Media (IFM) backup of Active Directory using ntdsutil. Useful for deploying additional Domain Controllers without relying on network replication.
## Features
+ Creates full AD and SYSVOL backup
+ Optimized for low-bandwidth environments
+ Supports automation in multi-DC setups

## What It Does
Uses ntdsutil to generate a full IFM backup of the NTDS database and the SYSTEM registry hive
+ Verifies backup file creation (ntds.dit and SYSTEM)
+ Outputs result status in the console

## Output
``` bash
##############################################
#              Acyber Lab                   #
#   --------------------------------------  #
#   Welcome to the NTDS Extraction Tool    #
#   Using ntdsutil for Stable Dump         #
##############################################
[*] Creating IFM backup via ntdsutil...
[+] Backup completed successfully!
[*] Files located in:
    NTDS:   C:\Temp\IFM\Active Directory\ntds.dit
    SYSTEM: C:\Temp\IFM\registry\SYSTEM
```
## Default Output Path
``` bash
C:\Temp\IFM
```
You can change this by modifying the $ifmPath variable in the script.

# Requirements
- Run as Administrator
- Domain Controller role installed
- PowerShell (v5+ recommended)

# HOW FIND HASH
## Dumping Hashes with secretsdump.py
After creating the IFM backup, you can extract password hashes from ntds.dit using the Impacket toolkit.
``` python
secretsdump.py -system SYSTEM -ntds ntds.dit LOCAL
```
+ -system SYSTEM: Path to the SYSTEM hive file (e.g., C:\Temp\IFM\registry\SYSTEM)
+ -ntds ntds.dit: Path to the NTDS database file (e.g., C:\Temp\IFM\Active Directory\ntds.dit)
+ LOCAL: Run locally (no remote target needed)

## Example
``` bash
secretsdump.py -system "C:\Temp\IFM\registry\SYSTEM" -ntds "C:\Temp\IFM\Active Directory\ntds.dit" LOCAL
```
This command will extract user credentials (NTLM hashes) from the offline Active Directory backup.
## Legal Note
This tool is intended for educational, recovery, and authorized auditing purposes only. Do not use without permission.
## YouTube
A full training course is available on our YouTube channel — check it out for a step-by-step walkthrough.



