### Description
I made the minimum system of MCS51 microcontroller at this project. You can find the example of MC51's minimum system schematic on the internet, there's a lot of it. But at this project i use my creativity to route and wire the minimum system board on my own. The components needed for this project included :
1. AT89S51 IC
2. LM7805 regulator
3. Crystal 22 MHz
4. 2x Capacitor 22pF
5. LED
6. Pushbuttons
7. Pinheaders
8. DC female jack

You can take a look at the picture below for the example schematic. I got this picture available online from [here](https://www.inzarsalfikar.com/2011/03/minimum-system-at89s51-at89s52-skematic.html). But for this project i made some modification for the schematic that you can see at the PCB folder.

![Schematic](https://github.com/falithurrahman/minimum_system_mcs51/blob/master/PCB/minsysAT89s51%20skematic.JPG "Schematic")

You can upload program to this board using USBASP programmer which can be purchased at local electronic stores. I've also created the port to upload program by extending the MOSI, MISO, and SCK pin. To test whether this board working or not, i upload a simple program to blink the LED in port 0. The file is main.asm that available in this repository.
