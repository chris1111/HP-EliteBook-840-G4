## BIOS Setup: ⬇︎
- Use  BIOS ➤ `P78 Ver.1.38`

	

# Main

# Update System Bios
- Lock BIOS Version ➤ Disable
- Native OS Firmware Update Service ➤ Enable
- BIOS Rollback Policy ➤ Unrestricted Rollback to older BIOS
- BIOS Allow Bios Update using a network ➤ Enable

# Security
- Administrator Tools ➤ Nothing change

## Security Configuration
	- TPM Specification Version ➤ 2.0
- TPM Device ➤ Available
- TPM State ➤ Disable
- Clear TPM ➤ No
- TPM Activation Policy ➤ Allow user to reject

## Security Configuration ➤  Bios SureStart
- Verify Boot Block on every boot ➤ Disable
- BIOS Data Recovery Policy ➤ Automatic
- Prompt on Network Controller Configuration Change ➤ Disable
- Dynamic Runtime Scanning of Boot Block ➤ Disable
- Sure Start BIOS Settings Protection ➤ Disable
- Enhanced HP Firmware Runtime Intrusion Prevention and Detection ➤ Disable
- Sure Start Security Event Policy ➤ Log Event and notify user
- Physical Presence Interface ➤ Disable
- Intel Software Gard Extensions (SGX) ➤ Disable

## Security Configuration ➤ Utilities
- Hard Drive Utilities
- Save/Restore MBR of System Hard Drive ➤ Disable
- Save/Restore GPT of System Hard Drive ➤ Disabled
- Allow OPAL Hard Drive SID Authentication ➤ Disable
- Permanent Disable Absolute Persistence Module Set Once ➤ No
- System Management Command ➤ Enable

# Advanced


## Display Language ➤ (Your Language)
## Select Keyboard Layout ➤ (Your Language)
## Scheduled Power-On
- Sunday ➤ Disable
- Monday ➤ Disable
- Tuesday ➤ Disable
- Wednesday ➤ Disable
- Thursday ➤ Disable
- Friday ➤ Disable
- Saturday ➤ Disable

	
## Boot Options
- Startup Delay (sec.) ➤ 0
- Fast Boot ➤ Disable
- Audio Alerts During Boot ➤ Enable
- NumLock on at boot ➤ Enable
- USB Storage Boot ➤ Enable
- Prompt on Memory Size Change ➤ Disable
- Network (PXE) Boot ➤ Disable
- Prompt on Fixed Storage Change ➤ Disable
- Prompt on Battery Errors ➤ Enable
- Legacy Boot Options ➤ Disable
- Legacy Boot Order ➤ (Your Disk order)
- UEFI Boot Options ➤ Enable
- UEFI Boot Order (Your Disk order)


## Secure Boot Configuration
- Configure Legacy Support and Secure Boot ➤ Legacy Support Enable and Secure Boot Disable
- Import Custom Secure Boot keys ➤ Do Nothing
- Clear Secure Boot keys ➤ Disable
- Reset Secure Boot keys to factory defaults ➤ Disable
- Enable MS UEFI CA key ➤ Yes
- Ready to disable MS UEFI CA Key ➤ Ready
- Custom Keys Image Verification State ➤ No Custom Keys
- Ready BIOS for Device Guard Use ➤ Do Nothing






## System Options
- Turbo-boost ➤ Enable
- Hyperthreading ➤ Enable
- Multi-processor ➤ Enable
- Virtualization Technology (VTx) ➤ Enable
- Virtualization Technology for Directed I/O (VTd) ➤ Disable
- Fast Charge ➤ Disable
- Special Key mapped to Fn + keypress ➤ Disable
- Swap Fn control (Keys) ➤ Disable
- Launch or key without Fn keypress ➤ Enable
- Enable Turbo Boost on DC ➤ Enable
- HP Application Driver ➤ Disable

## Buil-in Device Options
- Embedded LAN controller➤ Enable
- Wake On LAN➤ Boot to Hard Drive
- Integrated Microphone ➤ Enable
- Internal Speakers ➤ Enable
- Runtime Power Management ➤ Enable
- Headphone Output ➤ Enable
- Lock Wireless Button ➤ Enable
- Wireless Network Device (WLAN) ➤ Enable
- Bluetooth ➤ Enable
- Lan / WLAN Auto Switching ➤ Disable
- Wake on Lan in Battery Mode ➤ Disable
- Fan Always on Battery mode on AC Power ➤ Disable
- Fan Quietness Mode ➤ Disable
- Boost Converter ➤ Enable
- Backlit keyboard timeout ➤ 15 secs.
- Integrated Camera ➤ Enable
- Fingerprint Device ➤ Disable
- Touch Device ➤ Enable
- Disable Battery On Next Boot ➤ Do not disable

## Port Options
- Media Card Reader ➤ Enable
- Left USB Ports ➤ Enable
- Right USB Ports ➤ Enable
- Right USB Port 1 ➤ Enable
- Right USB Port 2 ➤ Enable
- Docking USB Ports ➤ Disable
- USB Legacy Port Charging ➤ Enable
- Disable Charging Port in sleep/off if battery below (%): ➤ 10
- Smart Card ➤ Disabled
- M.2 SSD 1 ➤ Enable
- SATA1 ➤ Enable
- Restrict USB Devices ➤ Allow all USB Devices
- USB Type-C Controller Firmware Update ➤ Enable

## Option ROM Launch Policy
- Configure Option ROM Launch Policy ➤ All UEFI

## Power Management Options
- Runtime Power Management ➤ Enable
- Extended Idle Power States ➤ Disable
- Deep Sleep ➤ Disable
- Wake when Lid is Opened ➤ Disable
- Wake on USB ➤ Disable
- Power Control ➤ Enable
- Battery Health Manager ➤ Let HP manage my battery charging

## Remote Management Options
- Active Management (AMT) ➤ Enable
- USB Key Provisioning Support ➤ Disable
- USB Redirection Support ➤ Disable
- Unconfigure AMT on next boot ➤ Do Not Apply
- SOL Terminal Emulation Mode ➤ ANSI
- Show Unconfigure ME Confirmation Prompt ➤ Disable
- Verbose Boot Messages ➤ Disable
- Watchdog Timer ➤ Disable
- OS Watchdog Timer (min.) ➤ 5
- BIOS Watchdog Timer (min.) ➤ 5
- CIRA Timeout (min.) ➤ 1 min

## MAC Address pass Through
- Host Based MAC Address ➤ System Adress
- Reuse Embedded Address Lan Address ➤ Disable

