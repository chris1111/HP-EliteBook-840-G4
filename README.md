# HP-EliteBook-840-G4
Latest Update 08 July 2023
- OC REL-094-2023-07-08

OpenCore / macOS Sonoma 14 / macOS Ventura 13
## This program is specially designed for the HP EliteBook 840 G4! Do not install this program on another machine.


![HP EliteBook 840 G4](https://user-images.githubusercontent.com/6248794/180880895-2980622f-2421-4e36-a178-1fdedc10b38a.png)


### Show small Video Touch screen ⬇︎
[![Modular Image Creation](https://user-images.githubusercontent.com/6248794/180882015-aa6209bd-a10d-4a1e-85cf-d9729b8e0efc.png)](https://youtu.be/jwMZei4FWgo)

### You can create an Install SSD or an install USB key. You can use OpenCore package individually.
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
- BCM94360NG Wi-Fi and Bluetooth Card (upgraded)
- 2 USB 3.0 Ports, 1 USB Type-C Port
- Display Port
- SD Card Reader
- 500GBWD (Black SN750SE) - PCIe Gen4 NVMe M.2 2280 de 500 Go (macOS)
- SSD WD Green 250 Go (Windows-11)

## BIOS Setup: ➤ [P78 Ver.1.38](https://github.com/chris1111/HP-EliteBook-840-G4/blob/gh-pages/Bios%20Setup.md)




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

Looking for ➦ [HP_EliteBook-840_G3.zip](https://github.com/chris1111/HP-EliteBook-840-G4/files/11947533/HP_EliteBook-840_G3.zip)

 
