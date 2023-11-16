# HP-EliteBook-840-G4
Latest Update 12 Nov 2023
- OC REL-097-2023-11-09

OpenCore / macOS Sonoma 14 / macOS Ventura 13

## This program is specially designed for the HP EliteBook 840 G4! Do not install this program on another machine.


![HP EliteBook 840 G4](https://user-images.githubusercontent.com/6248794/180880895-2980622f-2421-4e36-a178-1fdedc10b38a.png)


### Show small Video Touch screen ⬇︎
[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/180882015-aa6209bd-a10d-4a1e-85cf-d9729b8e0efc.png)](https://youtu.be/jwMZei4FWgo)

### You can create an Install USB key. You can use OpenCore package individually.
![Screenshot 2022-08-01 at 7 58 24 PM](https://user-images.githubusercontent.com/6248794/182264336-393bf0a0-5cde-498e-8bbc-e6f5cf76a1f0.png)


### Install Instructions: ⬇︎
#### Clone the repository
```bash
git clone https://github.com/chris1111/HP-EliteBook-840-G4.git
cd $HOME/HP-EliteBook-840-G4
```

#### Build
```bash
make
```


### Install Instructions: ⬇︎ using wifi-sonoma branch for User with an [Intel wifi card](https://openintelwireless.github.io/itlwm/Compat.html#dvm-iwn) compatible
#### Clone the repository
```bash
git clone --branch wifi-sonoma https://github.com/chris1111/HP-EliteBook-840-G4.git
cd $HOME/HP-EliteBook-840-G4
```

#### Build
```bash
make
```


##### Laptop Specifications:
- Intel Core i7-7600U Quad Core CPU
- Intel HD 620 Graphics
- 24GB DDR4 2133MHz RAM
- 14in Full HD LED Display
- SMBus Synaptics TouchPad
- BCM94360NG Wi-Fi and Bluetooth Card (Upgraded for Ventura 13) [BCM94360NG](https://www.aliexpress.com/item/32464748097.html?spm=a2g0o.order_list.order_list_main.11.16611802TVtCh4) No Broadcom card working for now in Sonoma 14
- 2 USB 3.0 Ports, 1 USB Type-C Port
- Display Port
- SD Card Reader
- 500GBWD (Black SN750SE) - PCIe Gen4
- NVMe M.2 2280 de 500 Go (macOS)
- SSD WD Green 250 Go (Windows-11)

## BIOS Setup: ⬇︎
<details> 
  <summary>View BIOS P78 Ver.1.38 Setup</summary>
	

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




</details>

-----------------------------------------------------------------------------



##### What works:
- Intel HD Graphics 620 QE/CI
- External monitor using display port
- USB 3.0 and USB Type-C Ports
- Ethernet
- Audio in internal speaker and headphone
- Sleep and Wake
- WIFI AirPort
- Bluetooth and Wifi
- Battery Status
- CPU Power Management
- Brightness Control Hotkeys
- Dimmable Keyboard Backlight
- Multi-Gestures Trackpad
- Touch Screen
- Integrated Camera



##### Credit:
- [RehabMan](https://github.com/RehabMan) Hotpatches
- [acidanthera](https://github.com/acidanthera) OpenCore + kexts/Plugins
- [headkaze](https://github.com/headkaze) Hackintool
- [alexandred](https://github.com/alexandred) VoodooI2C
- [andreszerocross](https://github.com/andreszerocross/VoodooRMI) VoodooRMI


Looking for ➦ [HP_EliteBook-840_G3.zip](https://github.com/chris1111/HP-EliteBook-840-G4/files/13370929/HP_EliteBook-840_G3.zip)

 
