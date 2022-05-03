EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 62636D16
P 9200 4300
F 0 "J2" H 9250 4717 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 9250 4626 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch2.54mm" H 9200 4300 50  0001 C CNN
F 3 "~" H 9200 4300 50  0001 C CNN
	1    9200 4300
	1    0    0    -1  
$EndComp
Text Notes 8900 3700 0    50   ~ 0
Jetson Nano J6.1-10\n(40-pin Header)
Wire Wire Line
	9000 4100 8400 4100
Wire Wire Line
	9500 4100 10100 4100
Wire Wire Line
	8500 4200 9000 4200
Wire Wire Line
	8500 4300 9000 4300
Wire Wire Line
	10000 4400 9500 4400
Wire Wire Line
	9500 4500 10000 4500
$Comp
L power:+3V3 #PWR0101
U 1 1 6263A5C1
P 8400 4000
F 0 "#PWR0101" H 8400 3850 50  0001 C CNN
F 1 "+3V3" H 8415 4173 50  0000 C CNN
F 2 "" H 8400 4000 50  0001 C CNN
F 3 "" H 8400 4000 50  0001 C CNN
	1    8400 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4000 8400 4100
$Comp
L power:+5V #PWR0102
U 1 1 6263AEBF
P 10100 4000
F 0 "#PWR0102" H 10100 3850 50  0001 C CNN
F 1 "+5V" H 10115 4173 50  0000 C CNN
F 2 "" H 10100 4000 50  0001 C CNN
F 3 "" H 10100 4000 50  0001 C CNN
	1    10100 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 4100 10100 4000
Wire Wire Line
	10100 4200 10100 4100
Wire Wire Line
	10100 4200 9500 4200
Connection ~ 10100 4100
$Comp
L power:GND #PWR0103
U 1 1 6263BCC9
P 8400 4600
F 0 "#PWR0103" H 8400 4350 50  0001 C CNN
F 1 "GND" H 8405 4427 50  0000 C CNN
F 2 "" H 8400 4600 50  0001 C CNN
F 3 "" H 8400 4600 50  0001 C CNN
	1    8400 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4600 8400 4500
Wire Wire Line
	8400 4500 9000 4500
$Comp
L power:GND #PWR0104
U 1 1 6263C4BD
P 10100 4600
F 0 "#PWR0104" H 10100 4350 50  0001 C CNN
F 1 "GND" H 10105 4427 50  0000 C CNN
F 2 "" H 10100 4600 50  0001 C CNN
F 3 "" H 10100 4600 50  0001 C CNN
	1    10100 4600
	1    0    0    -1  
$EndComp
Text Label 9600 4400 0    50   ~ 0
UART1_TXD
Text Label 9600 4500 0    50   ~ 0
UART1_RXD
Wire Wire Line
	10100 4600 10100 4300
Wire Wire Line
	9500 4300 10100 4300
NoConn ~ 9000 4400
Text Label 8500 4200 0    50   ~ 0
I2C1_SDA
Text Label 8500 4300 0    50   ~ 0
I2C1_SCL
$Comp
L frc-on-ftc-hw-special:TPS566238RQFR IC1
U 1 1 6261216D
P 4600 1600
F 0 "IC1" H 5200 1865 50  0000 C CNN
F 1 "TPS566238PRQFR" H 5200 1774 50  0000 C CNN
F 2 "SamacSys_Parts:TPS566238PRQFR" H 5650 1700 50  0001 L CNN
F 3 "https://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftps566238" H 5650 1600 50  0001 L CNN
F 4 "3 V to 18 V Input 6 A Synchronous Step Down Voltage Regulator With Pulse" H 5650 1500 50  0001 L CNN "Description"
F 5 "1" H 5650 1400 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 5650 1300 50  0001 L CNN "Manufacturer_Name"
F 7 "TPS566238PRQFR" H 5650 1200 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 5650 1100 50  0001 L CNN "Mouser Part Number"
F 9 "" H 5650 1000 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 5650 900 50  0001 L CNN "Arrow Part Number"
F 11 "" H 5650 800 50  0001 L CNN "Arrow Price/Stock"
	1    4600 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 6263ED0D
P 6300 1300
F 0 "R3" H 6359 1346 50  0000 L CNN
F 1 "0" H 6359 1255 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 6300 1300 50  0001 C CNN
F 3 "~" H 6300 1300 50  0001 C CNN
	1    6300 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 6263F48E
P 8000 1900
F 0 "R4" H 8059 1946 50  0000 L CNN
F 1 "220k" H 8059 1855 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 8000 1900 50  0001 C CNN
F 3 "~" H 8000 1900 50  0001 C CNN
	1    8000 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 6263F926
P 8000 2300
F 0 "R5" H 8059 2346 50  0000 L CNN
F 1 "30k" H 8059 2255 50  0000 L CNN
F 2 "Resistors_SMD:R_0603" H 8000 2300 50  0001 C CNN
F 3 "~" H 8000 2300 50  0001 C CNN
	1    8000 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 6263FF56
P 6700 1300
F 0 "C6" H 6792 1346 50  0000 L CNN
F 1 "0.1uF 25V" H 6792 1255 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 6700 1300 50  0001 C CNN
F 3 "~" H 6700 1300 50  0001 C CNN
	1    6700 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L1
U 1 1 62640F47
P 7100 1700
F 0 "L1" V 7325 1700 50  0000 C CNN
F 1 "2.2uH 13.2mOhm" V 7234 1700 50  0000 C CNN
F 2 "Inductors_SMD:L_Coilcraft_XAL5030" H 7100 1700 50  0001 C CNN
F 3 "~" H 7100 1700 50  0001 C CNN
F 4 "Coilcraft" V 7100 1700 50  0001 C CNN "Mfg"
F 5 "XAL5030-222MEB" V 7100 1700 50  0001 C CNN "Mfg PN"
	1    7100 1700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 6264230C
P 7500 1900
F 0 "C7" H 7592 1946 50  0000 L CNN
F 1 "33pF" H 7592 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7500 1900 50  0001 C CNN
F 3 "~" H 7500 1900 50  0001 C CNN
	1    7500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1400 6300 1600
Wire Wire Line
	6300 1600 5800 1600
Wire Wire Line
	5800 1700 6700 1700
Wire Wire Line
	6700 1400 6700 1700
Connection ~ 6700 1700
Wire Wire Line
	6700 1700 6950 1700
Wire Wire Line
	7250 1700 7500 1700
$Comp
L power:GND #PWR0105
U 1 1 6264B841
P 5900 2500
F 0 "#PWR0105" H 5900 2250 50  0001 C CNN
F 1 "GND" H 5905 2327 50  0000 C CNN
F 2 "" H 5900 2500 50  0001 C CNN
F 3 "" H 5900 2500 50  0001 C CNN
	1    5900 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0106
U 1 1 6264D040
P 4500 3250
F 0 "#PWR0106" H 4500 3100 50  0001 C CNN
F 1 "+12V" H 4515 3423 50  0000 C CNN
F 2 "" H 4500 3250 50  0001 C CNN
F 3 "" H 4500 3250 50  0001 C CNN
F 4 "I" H 4500 3250 50  0001 C CNN "Spice_Primitive"
F 5 "N" H 4500 3250 50  0001 C CNN "Spice_Netlist_Enabled"
	1    4500 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6264D6D3
P 4300 2500
F 0 "#PWR0107" H 4300 2250 50  0001 C CNN
F 1 "GND" H 4305 2327 50  0000 C CNN
F 2 "" H 4300 2500 50  0001 C CNN
F 3 "" H 4300 2500 50  0001 C CNN
	1    4300 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0108
U 1 1 6264DBFA
P 2300 1500
F 0 "#PWR0108" H 2300 1350 50  0001 C CNN
F 1 "+12V" H 2315 1673 50  0000 C CNN
F 2 "" H 2300 1500 50  0001 C CNN
F 3 "" H 2300 1500 50  0001 C CNN
	1    2300 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1500 2300 1600
Wire Wire Line
	2300 1600 2800 1600
Wire Wire Line
	4600 1700 4500 1700
$Comp
L Device:C_Small C4
U 1 1 6264F83A
P 3800 2200
F 0 "C4" H 3892 2246 50  0000 L CNN
F 1 "1uF" H 3892 2155 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3800 2200 50  0001 C CNN
F 3 "~" H 3800 2200 50  0001 C CNN
	1    3800 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 6264FE5D
P 4300 2200
F 0 "C5" H 4392 2246 50  0000 L CNN
F 1 "10nF" H 4392 2155 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 4300 2200 50  0001 C CNN
F 3 "~" H 4300 2200 50  0001 C CNN
	1    4300 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2100 4300 2000
Wire Wire Line
	4300 2000 4600 2000
Text Label 4300 2000 0    50   ~ 0
IC1_SS
Text Label 3800 1800 0    50   ~ 0
IC1_VCC
Wire Wire Line
	3800 2100 3800 1800
Wire Wire Line
	3800 1800 4600 1800
Wire Wire Line
	4300 2500 4300 2400
Wire Wire Line
	4300 2400 3800 2400
Wire Wire Line
	3800 2400 3800 2300
Connection ~ 4300 2400
Wire Wire Line
	4300 2400 4300 2300
Wire Wire Line
	2700 3950 2700 3850
Wire Wire Line
	2700 3850 3200 3850
Connection ~ 2700 3850
Wire Wire Line
	2700 3850 2700 3750
Wire Wire Line
	2700 3450 2700 3350
Connection ~ 2700 3350
Wire Wire Line
	2700 3350 3100 3350
Text Notes 3100 3750 0    50   ~ 0
Vgs\nMax\n-8V
Wire Wire Line
	4500 3250 4500 3350
Wire Wire Line
	4500 3350 4150 3350
Text Notes 2300 3200 0    50   ~ 0
Reverse Voltage Protection / Ideal Diode\n-16V to 16V Max\n6V to 20V On
Text Notes 4650 1150 0    50   ~ 0
12V Battery -> 5V@5A Buck
NoConn ~ 4600 1900
Text Notes 4300 1900 0    50   ~ 0
Int PU
Wire Wire Line
	6300 1200 6300 1150
Wire Wire Line
	6300 1150 6700 1150
Wire Wire Line
	6700 1150 6700 1200
Wire Wire Line
	7500 1800 7500 1700
Connection ~ 7500 1700
Wire Wire Line
	7500 1700 8000 1700
Wire Wire Line
	8000 1800 8000 1700
Connection ~ 8000 1700
Wire Wire Line
	8000 1700 8500 1700
Wire Wire Line
	8000 2200 8000 2100
Wire Wire Line
	8000 2100 7500 2100
Wire Wire Line
	6300 2100 6300 1800
Wire Wire Line
	6300 1800 5800 1800
Connection ~ 8000 2100
Wire Wire Line
	8000 2100 8000 2000
Wire Wire Line
	5800 2000 5900 2000
Wire Wire Line
	5900 2000 5900 2500
Wire Wire Line
	7500 2100 7500 2000
Connection ~ 7500 2100
Wire Wire Line
	7500 2100 6300 2100
$Comp
L power:GND #PWR0110
U 1 1 6267C631
P 8000 2500
F 0 "#PWR0110" H 8000 2250 50  0001 C CNN
F 1 "GND" H 8005 2327 50  0000 C CNN
F 2 "" H 8000 2500 50  0001 C CNN
F 3 "" H 8000 2500 50  0001 C CNN
	1    8000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2500 8000 2450
Text Label 5850 1800 0    50   ~ 0
IC1_FB
Text Label 5850 1700 0    50   ~ 0
IC1_SW
Text Label 5850 1600 0    50   ~ 0
IC1_BST
Text Label 6300 1150 0    50   ~ 0
IC1_BST_R
$Comp
L power:+5V #PWR0111
U 1 1 626808E9
P 10100 1600
F 0 "#PWR0111" H 10100 1450 50  0001 C CNN
F 1 "+5V" H 10115 1773 50  0000 C CNN
F 2 "" H 10100 1600 50  0001 C CNN
F 3 "" H 10100 1600 50  0001 C CNN
	1    10100 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1600 10100 1700
$Comp
L Device:C_Small C9
U 1 1 626BA38B
P 8850 1900
F 0 "C9" H 8942 1946 50  0000 L CNN
F 1 "22uF" H 8942 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8850 1900 50  0001 C CNN
F 3 "~" H 8850 1900 50  0001 C CNN
	1    8850 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 626BBF05
P 9200 1900
F 0 "C10" H 9292 1946 50  0000 L CNN
F 1 "22uF" H 9292 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9200 1900 50  0001 C CNN
F 3 "~" H 9200 1900 50  0001 C CNN
	1    9200 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 626C4C8D
P 8500 1900
F 0 "C8" H 8592 1946 50  0000 L CNN
F 1 "22uF" H 8592 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8500 1900 50  0001 C CNN
F 3 "~" H 8500 1900 50  0001 C CNN
	1    8500 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 626C5170
P 9550 1900
F 0 "C11" H 9642 1946 50  0000 L CNN
F 1 "22uF" H 9642 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9550 1900 50  0001 C CNN
F 3 "~" H 9550 1900 50  0001 C CNN
	1    9550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1800 9550 1700
Connection ~ 9550 1700
Wire Wire Line
	9550 1700 9900 1700
Wire Wire Line
	9200 1800 9200 1700
Connection ~ 9200 1700
Wire Wire Line
	9200 1700 9550 1700
Wire Wire Line
	8850 1800 8850 1700
Connection ~ 8850 1700
Wire Wire Line
	8850 1700 9200 1700
Connection ~ 8500 1700
Wire Wire Line
	8500 1700 8850 1700
Wire Wire Line
	8500 1700 8500 1800
Wire Wire Line
	8000 2450 8500 2450
Wire Wire Line
	9550 2450 9550 2000
Connection ~ 8000 2450
Wire Wire Line
	8000 2450 8000 2400
Wire Wire Line
	9200 2000 9200 2450
Connection ~ 9200 2450
Wire Wire Line
	9200 2450 9550 2450
Wire Wire Line
	8850 2000 8850 2450
Connection ~ 8850 2450
Wire Wire Line
	8850 2450 9200 2450
Wire Wire Line
	8500 2000 8500 2450
Connection ~ 8500 2450
Wire Wire Line
	8500 2450 8850 2450
$Comp
L Device:C_Small C12
U 1 1 626D38D2
P 9900 1900
F 0 "C12" H 9992 1946 50  0000 L CNN
F 1 "0.1uF" H 9992 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 9900 1900 50  0001 C CNN
F 3 "~" H 9900 1900 50  0001 C CNN
	1    9900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1800 9900 1700
Connection ~ 9900 1700
Wire Wire Line
	9900 1700 10100 1700
Wire Wire Line
	9900 2000 9900 2450
Wire Wire Line
	9900 2450 9550 2450
Connection ~ 9550 2450
$Comp
L Device:C_Small C3
U 1 1 626D8E83
P 3300 1950
F 0 "C3" H 3392 1996 50  0000 L CNN
F 1 "0.1uF 25V" H 3392 1905 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3300 1950 50  0001 C CNN
F 3 "~" H 3300 1950 50  0001 C CNN
	1    3300 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 626D9474
P 2800 1800
F 0 "C2" H 2892 1846 50  0000 L CNN
F 1 "22uF 25V" H 2892 1755 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2800 1800 50  0001 C CNN
F 3 "~" H 2800 1800 50  0001 C CNN
	1    2800 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 626D9A4C
P 2300 1900
F 0 "C1" H 2392 1946 50  0000 L CNN
F 1 "22uF 25V" H 2392 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 2300 1900 50  0001 C CNN
F 3 "~" H 2300 1900 50  0001 C CNN
	1    2300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1700 4500 1600
Connection ~ 4500 1600
Wire Wire Line
	4500 1600 4600 1600
Connection ~ 2300 1600
Wire Wire Line
	2800 1700 2800 1600
Connection ~ 2800 1600
Wire Wire Line
	2800 1600 3300 1600
Wire Wire Line
	3300 1850 3300 1600
Connection ~ 3300 1600
Wire Wire Line
	3300 1600 4500 1600
Wire Wire Line
	3800 2400 3300 2400
Connection ~ 3800 2400
Wire Wire Line
	2800 1900 2800 2400
Wire Wire Line
	3300 2050 3300 2400
Connection ~ 3300 2400
Wire Wire Line
	3300 2400 2800 2400
Wire Wire Line
	2300 1600 2300 1800
Wire Wire Line
	2300 2000 2300 2400
Wire Wire Line
	2300 2400 2800 2400
Connection ~ 2800 2400
$Comp
L Mechanical:MountingHole H1
U 1 1 6276E5CE
P 9050 5000
F 0 "H1" H 9150 5046 50  0000 L CNN
F 1 "MountingHole" H 9150 4955 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 9050 5000 50  0001 C CNN
F 3 "~" H 9050 5000 50  0001 C CNN
	1    9050 5000
	1    0    0    -1  
$EndComp
Text Label 2300 3350 0    50   ~ 0
12V_CONN
Text Label 3350 3850 0    50   ~ 0
12V_G
$Comp
L Mechanical:MountingHole H2
U 1 1 626A4A84
P 9050 5250
F 0 "H2" H 9150 5296 50  0000 L CNN
F 1 "MountingHole" H 9150 5205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 9050 5250 50  0001 C CNN
F 3 "~" H 9050 5250 50  0001 C CNN
	1    9050 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J3
U 1 1 626A53A2
P 1700 5600
F 0 "J3" H 1750 5817 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 1750 5726 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 1700 5600 50  0001 C CNN
F 3 "~" H 1700 5600 50  0001 C CNN
	1    1700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5600 2700 5600
Text Label 1100 5600 0    50   ~ 0
TR1_TAP
Text Label 1100 5700 0    50   ~ 0
TR3_TAP
Text Label 2300 5700 0    50   ~ 0
TR2_TAP
Text Label 2300 5600 0    50   ~ 0
TR0_TAP
$Comp
L Device:Q_PMOS_GSD Q1
U 1 1 62653F32
P 3300 3450
F 0 "Q1" V 3642 3450 50  0000 C CNN
F 1 "Q_PMOS_GSD" V 3551 3450 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3500 3550 50  0001 C CNN
F 3 "~" H 3300 3450 50  0001 C CNN
F 4 "Micro Commercial Co" V 3300 3450 50  0001 C CNN "Mfg"
F 5 "SI2305B" V 3300 3450 50  0001 C CNN "Mfg PN"
F 6 "Diodes Incorporated" V 3300 3450 50  0001 C CNN "Mfg 2"
F 7 "DMG2305UX-7" V 3300 3450 50  0001 C CNN "Mfg PN 2"
F 8 "M" H 3300 3450 50  0001 C CNN "Spice_Primitive"
F 9 "cmosp" H 3300 3450 50  0001 C CNN "Spice_Model"
F 10 "Y" H 3300 3450 50  0001 C CNN "Spice_Netlist_Enabled"
F 11 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Transistor/FET/cmos.lib" H 3300 3450 50  0001 C CNN "Spice_Lib_File"
	1    3300 3450
	0    -1   -1   0   
$EndComp
Text Notes 1350 6050 0    50   ~ 0
Passive PoE:\nDC+ on 4/5 (TR2)\nDC- on 7/8 (TR3)
$Comp
L Device:LED_Small_ALT D1
U 1 1 626CA0CD
P 4150 3600
F 0 "D1" V 4196 3530 50  0000 R CNN
F 1 "Green" V 4105 3530 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 4150 3600 50  0001 C CNN
F 3 "~" V 4150 3600 50  0001 C CNN
F 4 "D" H 4150 3600 50  0001 C CNN "Spice_Primitive"
F 5 "LED_GENERAL" H 4150 3600 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4150 3600 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Diode/led.lib" H 4150 3600 50  0001 C CNN "Spice_Lib_File"
	1    4150 3600
	0    -1   -1   0   
$EndComp
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN1
U 4 1 626CB9B3
P 3700 4100
F 0 "RN1" H 3788 4146 50  0000 L CNN
F 1 "10k" H 3788 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 3620 4100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3700 4100 50  0001 C CNN
	4    3700 4100
	1    0    0    -1  
$EndComp
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN1
U 3 1 626CC091
P 4150 4100
F 0 "RN1" H 4238 4146 50  0000 L CNN
F 1 "10k" H 4238 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 4070 4100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4150 4100 50  0001 C CNN
	3    4150 4100
	1    0    0    -1  
$EndComp
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN2
U 3 1 626CC5BF
P 4150 6450
F 0 "RN2" H 4238 6496 50  0000 L CNN
F 1 "10k" H 4238 6405 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 4070 6450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4150 6450 50  0001 C CNN
	3    4150 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3950 3700 3850
Wire Wire Line
	3300 3650 3300 3850
Wire Wire Line
	3300 3850 3700 3850
Connection ~ 3700 3850
Wire Wire Line
	3700 3850 3700 3750
Wire Wire Line
	3700 3450 3700 3350
Connection ~ 3700 3350
Wire Wire Line
	3700 3350 3500 3350
Wire Wire Line
	3700 4450 3700 4350
Wire Wire Line
	3400 4650 3200 4650
$Comp
L power:GND #PWR0112
U 1 1 626F779F
P 3700 4950
F 0 "#PWR0112" H 3700 4700 50  0001 C CNN
F 1 "GND" H 3705 4777 50  0000 C CNN
F 2 "" H 3700 4950 50  0001 C CNN
F 3 "" H 3700 4950 50  0001 C CNN
F 4 "I" H 3700 4950 50  0001 C CNN "Spice_Primitive"
F 5 "N" H 3700 4950 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3700 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4950 3700 4900
$Comp
L Device:D_Zener_ALT D3
U 1 1 626FDC83
P 3700 3600
F 0 "D3" V 3654 3680 50  0000 L CNN
F 1 "5.1V" V 3745 3680 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3700 3600 50  0001 C CNN
F 3 "~" H 3700 3600 50  0001 C CNN
F 4 "X" H 3700 3600 50  0001 C CNN "Spice_Primitive"
F 5 "DI_1N4733A" H 3700 3600 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3700 3600 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Diode/zener.lib" H 3700 3600 50  0001 C CNN "Spice_Lib_File"
F 8 "Nexperia" V 3700 3600 50  0001 C CNN "Mfg"
F 9 "BZX384-C5V1,115" V 3700 3600 50  0001 C CNN "Mfg PN"
	1    3700 3600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 626FE93D
P 1050 5800
F 0 "#PWR0113" H 1050 5550 50  0001 C CNN
F 1 "GND" H 1055 5627 50  0000 C CNN
F 2 "" H 1050 5800 50  0001 C CNN
F 3 "" H 1050 5800 50  0001 C CNN
	1    1050 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5800 1050 5700
Wire Wire Line
	1050 5700 1500 5700
Wire Wire Line
	4150 3700 4150 3850
Text Label 3750 4350 0    50   ~ 0
12V_G_R
Text Label 2700 3850 0    50   ~ 0
12V_CONN_R
Connection ~ 4150 3850
Wire Wire Line
	4150 3850 4150 3950
Text Label 4150 3850 0    50   ~ 0
12V_CONN_K
Wire Wire Line
	4150 3850 4650 3850
$Comp
L power:+12V #PWR0114
U 1 1 627B8184
P 4550 5600
F 0 "#PWR0114" H 4550 5450 50  0001 C CNN
F 1 "+12V" H 4565 5773 50  0000 C CNN
F 2 "" H 4550 5600 50  0001 C CNN
F 3 "" H 4550 5600 50  0001 C CNN
F 4 "I" H 4550 5600 50  0001 C CNN "Spice_Primitive"
F 5 "N" H 4550 5600 50  0001 C CNN "Spice_Netlist_Enabled"
	1    4550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 6300 2700 6200
Wire Wire Line
	2700 6200 3200 6200
Connection ~ 2700 6200
Wire Wire Line
	2700 6200 2700 6100
Wire Wire Line
	2700 5800 2700 5700
Connection ~ 2700 5700
Wire Wire Line
	2700 5700 3100 5700
Wire Wire Line
	4550 5600 4550 5700
Wire Wire Line
	4550 5700 4150 5700
Text Label 3350 6200 0    50   ~ 0
12V_2_G
$Comp
L Device:Q_PMOS_GSD Q2
U 1 1 627B819C
P 3300 5800
F 0 "Q2" V 3642 5800 50  0000 C CNN
F 1 "Q_PMOS_GSD" V 3551 5800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3500 5900 50  0001 C CNN
F 3 "~" H 3300 5800 50  0001 C CNN
F 4 "Micro Commercial Co" V 3300 5800 50  0001 C CNN "Mfg"
F 5 "SI2305B" V 3300 5800 50  0001 C CNN "Mfg PN"
F 6 "Diodes Incorporated" V 3300 5800 50  0001 C CNN "Mfg 2"
F 7 "DMG2305UX-7" V 3300 5800 50  0001 C CNN "Mfg PN 2"
F 8 "M" H 3300 5800 50  0001 C CNN "Spice_Primitive"
F 9 "cmosp" H 3300 5800 50  0001 C CNN "Spice_Model"
F 10 "Y" H 3300 5800 50  0001 C CNN "Spice_Netlist_Enabled"
F 11 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Transistor/FET/cmos.lib" H 3300 5800 50  0001 C CNN "Spice_Lib_File"
	1    3300 5800
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small_ALT D2
U 1 1 627B81A8
P 4150 5950
F 0 "D2" V 4196 5880 50  0000 R CNN
F 1 "Green" V 4105 5880 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 4150 5950 50  0001 C CNN
F 3 "~" V 4150 5950 50  0001 C CNN
F 4 "D" H 4150 5950 50  0001 C CNN "Spice_Primitive"
F 5 "LED_GENERAL" H 4150 5950 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4150 5950 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Diode/led.lib" H 4150 5950 50  0001 C CNN "Spice_Lib_File"
	1    4150 5950
	0    -1   -1   0   
$EndComp
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN2
U 2 1 627B81AE
P 2700 6450
F 0 "RN2" H 2788 6496 50  0000 L CNN
F 1 "10k" H 2788 6405 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2620 6450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2700 6450 50  0001 C CNN
	2    2700 6450
	1    0    0    -1  
$EndComp
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN2
U 1 1 627B81B4
P 2700 5950
F 0 "RN2" H 2788 5996 50  0000 L CNN
F 1 "10k" H 2788 5905 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2620 5950 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2700 5950 50  0001 C CNN
F 4 "Yaego" H 2700 5950 50  0001 C CNN "Mfg"
F 5 "YC164-JR-0710KL" H 2700 5950 50  0001 C CNN "Mfg PN"
	1    2700 5950
	1    0    0    1   
$EndComp
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN2
U 4 1 627B81BA
P 3700 6450
F 0 "RN2" H 3788 6496 50  0000 L CNN
F 1 "10k" H 3788 6405 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 3620 6450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3700 6450 50  0001 C CNN
	4    3700 6450
	1    0    0    -1  
$EndComp
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN1
U 2 1 627B81C0
P 2700 4100
F 0 "RN1" H 2788 4146 50  0000 L CNN
F 1 "10k" H 2788 4055 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2620 4100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2700 4100 50  0001 C CNN
	2    2700 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 6300 3700 6200
Wire Wire Line
	3300 6000 3300 6200
Wire Wire Line
	3300 6200 3700 6200
Connection ~ 3700 6200
Wire Wire Line
	3700 6200 3700 6100
Wire Wire Line
	3700 5800 3700 5700
Connection ~ 3700 5700
Wire Wire Line
	3700 5700 3500 5700
Wire Wire Line
	3700 6800 3700 6700
Wire Wire Line
	3400 7000 3200 7000
$Comp
L power:GND #PWR0116
U 1 1 627B81DF
P 3700 7300
F 0 "#PWR0116" H 3700 7050 50  0001 C CNN
F 1 "GND" H 3705 7127 50  0000 C CNN
F 2 "" H 3700 7300 50  0001 C CNN
F 3 "" H 3700 7300 50  0001 C CNN
F 4 "I" H 3700 7300 50  0001 C CNN "Spice_Primitive"
F 5 "N" H 3700 7300 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3700 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 7300 3700 7250
$Comp
L Device:D_Zener_ALT D4
U 1 1 627B81E6
P 3700 5950
F 0 "D4" V 3654 6030 50  0000 L CNN
F 1 "5.1V" V 3745 6030 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3700 5950 50  0001 C CNN
F 3 "~" H 3700 5950 50  0001 C CNN
F 4 "X" H 3700 5950 50  0001 C CNN "Spice_Primitive"
F 5 "DI_1N4733A" H 3700 5950 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3700 5950 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Diode/zener.lib" H 3700 5950 50  0001 C CNN "Spice_Lib_File"
F 8 "Nexperia" V 3700 5950 50  0001 C CNN "Mfg"
F 9 "BZX384-C5V1,115" V 3700 5950 50  0001 C CNN "Mfg PN"
	1    3700 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 6050 4150 6200
Text Label 3750 6700 0    50   ~ 0
12V_2_G_R
Text Label 2700 6200 0    50   ~ 0
TR2_TAP_R
Connection ~ 4150 6200
Wire Wire Line
	4150 6200 4150 6300
Text Label 4150 6200 0    50   ~ 0
TR2_TAP_K
Wire Wire Line
	4150 6200 4650 6200
Wire Wire Line
	2300 3450 2000 3450
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 6264C022
P 1800 3450
F 0 "J1" H 1718 3125 50  0000 C CNN
F 1 "Conn_01x02" H 1718 3216 50  0000 C CNN
F 2 "frc-on-ftc-hw:WAGO_250-202" H 1800 3450 50  0001 C CNN
F 3 "~" H 1800 3450 50  0001 C CNN
	1    1800 3450
	-1   0    0    1   
$EndComp
Text Notes 2300 5450 0    50   ~ 0
Reverse Voltage Protection / Ideal Diode\n-16V to 16V Max\n6V to 16V On
Wire Wire Line
	1050 5600 1500 5600
NoConn ~ 2700 5600
NoConn ~ 1050 5600
Text Notes 3100 6100 0    50   ~ 0
Vgs\nMax\n-8V
Wire Wire Line
	2700 4250 2700 4950
$Comp
L frc-on-ftc-hw-special:Q_NMOS_DUAL Q4
U 1 1 6290F6A3
P 3600 4650
F 0 "Q4" H 3790 4696 50  0000 L CNN
F 1 "Q_NMOS_DUAL" H 3790 4605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 3800 4750 50  0001 C CNN
F 3 "" H 3600 4650 50  0000 C CNN
F 4 "Diodes Incorporated" H 3600 4650 50  0001 C CNN "Mfg"
F 5 "DMN2004DMK" H 3600 4650 50  0001 C CNN "Mfg PN"
F 6 "Diodes Incorporated" H 3600 4650 50  0001 C CNN "Mfg 2"
F 7 "DMN5L06DMK-7" H 3600 4650 50  0001 C CNN "Mfg PN 2"
F 8 "M" H 3600 4650 50  0001 C CNN "Spice_Primitive"
F 9 "cmosn" H 3600 4650 50  0001 C CNN "Spice_Model"
F 10 "Y" H 3600 4650 50  0001 C CNN "Spice_Netlist_Enabled"
F 11 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Transistor/FET/cmos.lib" H 3600 4650 50  0001 C CNN "Spice_Lib_File"
	1    3600 4650
	1    0    0    -1  
$EndComp
$Comp
L frc-on-ftc-hw-special:Q_NMOS_DUAL Q4
U 2 1 629103E8
P 3600 7000
F 0 "Q4" H 3790 7046 50  0000 L CNN
F 1 "Q_NMOS_DUAL" H 3790 6955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 3800 7100 50  0001 C CNN
F 3 "" H 3600 7000 50  0000 C CNN
F 4 "Diodes Incorporated" H 3600 7000 50  0001 C CNN "Mfg"
F 5 "DMN2004DMK" H 3600 7000 50  0001 C CNN "Mfg PN"
F 6 "Diodes Incorporated" H 3600 7000 50  0001 C CNN "Mfg 2"
F 7 "DMN5L06DMK-7" H 3600 7000 50  0001 C CNN "Mfg PN 2"
F 8 "M" H 3600 7000 50  0001 C CNN "Spice_Primitive"
F 9 "cmosn" H 3600 7000 50  0001 C CNN "Spice_Model"
F 10 "Y" H 3600 7000 50  0001 C CNN "Spice_Netlist_Enabled"
F 11 "/Users/ihartwig/repos/KiCad-Spice-Library/Models/Transistor/FET/cmos.lib" H 3600 7000 50  0001 C CNN "Spice_Lib_File"
	2    3600 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3450 2300 4950
Wire Wire Line
	2700 4950 3650 4950
Wire Wire Line
	3650 4950 3650 4900
Wire Wire Line
	3650 4900 3700 4900
Connection ~ 2700 4950
Connection ~ 3700 4900
Wire Wire Line
	3700 4900 3700 4850
Wire Wire Line
	3700 7250 3650 7250
Wire Wire Line
	3650 7250 3650 7300
Wire Wire Line
	3650 7300 2700 7300
Connection ~ 3700 7250
Wire Wire Line
	3700 7250 3700 7200
Wire Wire Line
	2700 6600 2700 7300
Wire Wire Line
	3200 6200 3200 7000
Wire Wire Line
	4150 6600 4150 6700
Wire Wire Line
	4150 6700 3700 6700
Connection ~ 3700 6700
Wire Wire Line
	3700 6600 3700 6700
Wire Wire Line
	4150 5850 4150 5700
Connection ~ 4150 5700
Wire Wire Line
	4150 5700 3700 5700
Wire Wire Line
	2300 4950 2700 4950
Wire Wire Line
	3200 3850 3200 4650
Wire Wire Line
	2000 3350 2100 3350
Wire Wire Line
	3700 4350 4150 4350
Wire Wire Line
	4150 4350 4150 4250
Connection ~ 3700 4350
Wire Wire Line
	3700 4250 3700 4350
Wire Wire Line
	4150 3500 4150 3350
Connection ~ 4150 3350
Wire Wire Line
	4150 3350 3700 3350
$Comp
L Simulation_SPICE:VDC V_CONN1
U 1 1 62A3EAB9
P 1850 4650
F 0 "V_CONN1" H 1980 4741 50  0000 L CNN
F 1 "VDC" H 1980 4650 50  0000 L CNN
F 2 "" H 1850 4650 50  0001 C CNN
F 3 "~" H 1850 4650 50  0001 C CNN
F 4 "Y" H 1850 4650 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 1850 4650 50  0001 L CNN "Spice_Primitive"
F 6 "dc(1)" H 1980 4559 50  0000 L CNN "Spice_Model"
	1    1850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4950 1850 4950
Wire Wire Line
	1850 4950 1850 4850
Connection ~ 2300 4950
Wire Wire Line
	1850 4450 1850 3650
Wire Wire Line
	1850 3650 2100 3650
Wire Wire Line
	2100 3650 2100 3350
Connection ~ 2100 3350
Wire Wire Line
	2100 3350 2700 3350
$Comp
L Simulation_SPICE:VDC V_TR2
U 1 1 62A55193
P 1850 7000
F 0 "V_TR2" H 1980 7091 50  0000 L CNN
F 1 "VDC" H 1980 7000 50  0000 L CNN
F 2 "" H 1850 7000 50  0001 C CNN
F 3 "~" H 1850 7000 50  0001 C CNN
F 4 "Y" H 1850 7000 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 1850 7000 50  0001 L CNN "Spice_Primitive"
F 6 "dc(1)" H 1980 6909 50  0000 L CNN "Spice_Model"
	1    1850 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7300 1850 7300
Wire Wire Line
	1850 7300 1850 7200
Connection ~ 2700 7300
Wire Wire Line
	2000 5700 2100 5700
Wire Wire Line
	1850 6800 1850 6100
Wire Wire Line
	1850 6100 2100 6100
Wire Wire Line
	2100 6100 2100 5700
Connection ~ 2100 5700
Wire Wire Line
	2100 5700 2700 5700
$Comp
L frc-on-ftc-hw-special:R_Pack04_SMD_Split RN1
U 1 1 626CC9C4
P 2700 3600
F 0 "RN1" H 2788 3646 50  0000 L CNN
F 1 "10k" H 2788 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2620 3600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2700 3600 50  0001 C CNN
F 4 "Yaego" H 2700 3600 50  0001 C CNN "Mfg"
F 5 "YC164-JR-0710KL" H 2700 3600 50  0001 C CNN "Mfg PN"
	1    2700 3600
	1    0    0    1   
$EndComp
Text Notes 3400 6950 0    50   ~ 0
Vgs\nMax\n-8V
$EndSCHEMATC
