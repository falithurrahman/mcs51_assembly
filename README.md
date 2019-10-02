### Description


##### 1. Minimum_System_MCS1
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

#### 2. Water_level Sensor

I made the detector of water level using MCS51 as the microcontroller. I used 2 sensors for this project, one at the bottom of the tank and another one at the top of the tank. You can see the clear picture below ![Picture 1](https://github.com/falithurrahman/mcs51_assembly/blob/master/water_level_sensor/Picture/472658.jpg "Picture 1") ![Picture 2](https://github.com/falithurrahman/mcs51_assembly/blob/master/water_level_sensor/Picture/472657.jpg "Picture 2") 

Sensor i used in this project is very simple. I made two nearly-connected conductor surface at dot matrix PCB. Each of this surface was extended with cable and connected to my comparator board. The design of this board is available at PCB folder of water_level_sensor project. 
Then the sensor was connected to comparator, i used LM324 as the comparator.

The idea is quite simple. If there is no water touches the sensor, the resistance of the sensor is very high because it's open circuit. Because of this resistance value, the comparator will generate low logic. And vice versa, the comparator will generate high logic if there is water touches the sensor. The comparator board is equipped with LED as an indicator.