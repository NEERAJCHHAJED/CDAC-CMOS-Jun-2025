# Running MicroWind and DSCH on Linux using Wine
```bash
sudo apt update  
sudo apt install wine  
sudo apt install winetricks
## to create newwineprefix
WINEPREFIX=/home/students/newwineprefix winecfg

winetricks vcrun6  

#Download the above 2 files
#Extract them
# Then copy the msvbvm60.dll file and add it to the following directory:
/home/students/newwineprefix/drive_c/windows/system32/
To run MicroWind, go to the directory, then open the terminal and run:
cd /path/to/microwind/directory
wine Microwind2.exe 
wine Dsch2.exe
