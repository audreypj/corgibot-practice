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
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 625E64C6
P 4100 2700
F 0 "J1" H 4150 3117 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 4150 3026 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical" H 4100 2700 50  0001 C CNN
F 3 "~" H 4100 2700 50  0001 C CNN
	1    4100 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 625E8CFF
P 8150 2500
F 0 "J2" H 8230 2492 50  0000 L CNN
F 1 "Conn_01x04" H 8230 2401 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-SM4-TB_1x04-1MP_P2.00mm_Vertical" H 8150 2500 50  0001 C CNN
F 3 "~" H 8150 2500 50  0001 C CNN
	1    8150 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 625E9E4B
P 8150 3500
F 0 "J3" H 8230 3492 50  0000 L CNN
F 1 "Conn_01x04" H 8230 3401 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-SM4-TB_1x04-1MP_P2.00mm_Vertical" H 8150 3500 50  0001 C CNN
F 3 "~" H 8150 3500 50  0001 C CNN
	1    8150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2500 3150 2500
Wire Wire Line
	3150 2600 3900 2600
Wire Wire Line
	3900 2700 3150 2700
Wire Wire Line
	3150 2800 3900 2800
Wire Wire Line
	5150 2500 4400 2500
Wire Wire Line
	4400 2600 5150 2600
Wire Wire Line
	4400 2800 5150 2800
NoConn ~ 4400 2700
Text Notes 3150 2400 0    50   ~ 0
Key at pin 5.
Wire Wire Line
	3900 2900 3150 2900
Text Label 3150 2500 0    50   ~ 0
+3.3V
Text Label 5000 2500 0    50   ~ 0
+5V
Text Label 4850 2600 0    50   ~ 0
LIM_FWD
Text Label 4850 2800 0    50   ~ 0
LIM_REV
$Comp
L power:GND #PWR0101
U 1 1 625EE01D
P 4500 3000
F 0 "#PWR0101" H 4500 2750 50  0001 C CNN
F 1 "GND" H 4505 2827 50  0000 C CNN
F 2 "" H 4500 3000 50  0001 C CNN
F 3 "" H 4500 3000 50  0001 C CNN
	1    4500 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3000 4500 2900
Wire Wire Line
	4400 2900 4500 2900
Text Label 3150 2900 0    50   ~ 0
ENC_IDX
Text Label 3150 2800 0    50   ~ 0
ENC_A
Text Label 3150 2700 0    50   ~ 0
ENC_B
Text Label 3150 2600 0    50   ~ 0
ANA_IN
Text Notes 3150 2100 0    50   ~ 0
TalonSRX Data Port
Text Notes 7000 2100 0    50   ~ 0
Rev Encoder Port
Text Notes 7000 3150 0    50   ~ 0
Rev IO / Limit Port
Wire Wire Line
	7000 3500 7950 3500
$Comp
L power:GND #PWR0102
U 1 1 625EFD1B
P 8000 3100
F 0 "#PWR0102" H 8000 2850 50  0001 C CNN
F 1 "GND" H 8005 2927 50  0000 C CNN
F 2 "" H 8000 3100 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3400 7850 3400
Wire Wire Line
	7850 3400 7850 3050
Wire Wire Line
	7850 3050 8000 3050
Wire Wire Line
	8000 3050 8000 3100
Text Label 7000 3500 0    50   ~ 0
+3.3V
$Comp
L Jumper:SolderJumper_3_Bridged12 JP2
U 1 1 625F53CC
P 7500 3850
F 0 "JP2" H 7500 3963 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 7500 4054 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_Pad1.0x1.5mm" H 7500 3850 50  0001 C CNN
F 3 "~" H 7500 3850 50  0001 C CNN
	1    7500 3850
	1    0    0    1   
$EndComp
$Comp
L Jumper:SolderJumper_3_Bridged12 JP1
U 1 1 625F9056
P 6800 2300
F 0 "JP1" H 6800 2505 50  0000 C CNN
F 1 "SolderJumper_3_Bridged12" H 6800 2414 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_Pad1.0x1.5mm" H 6800 2300 50  0001 C CNN
F 3 "~" H 6800 2300 50  0001 C CNN
	1    6800 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3600 7500 3700
Wire Wire Line
	7500 3600 7950 3600
Wire Wire Line
	7700 3850 8000 3850
Wire Wire Line
	7300 3850 7000 3850
Text Label 7000 3850 0    50   ~ 0
LIM_FWD
Text Label 7700 3850 0    50   ~ 0
LIM_REV
NoConn ~ 7950 3700
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 6260C303
P 8150 4900
F 0 "J4" H 8230 4892 50  0000 L CNN
F 1 "Conn_01x04" H 8230 4801 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B4B-PH-SM4-TB_1x04-1MP_P2.00mm_Vertical" H 8150 4900 50  0001 C CNN
F 3 "~" H 8150 4900 50  0001 C CNN
	1    8150 4900
	1    0    0    -1  
$EndComp
Text Notes 7000 4550 0    50   ~ 0
Falcon 500 Limit Port
$Comp
L power:GND #PWR0103
U 1 1 6260C30B
P 7100 5100
F 0 "#PWR0103" H 7100 4850 50  0001 C CNN
F 1 "GND" H 7105 4927 50  0000 C CNN
F 2 "" H 7100 5100 50  0001 C CNN
F 3 "" H 7100 5100 50  0001 C CNN
	1    7100 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4800 7550 4800
Wire Wire Line
	7300 5000 7300 5100
Wire Wire Line
	7300 5000 7950 5000
Text Label 7550 4800 0    50   ~ 0
LIM_FWD
Text Label 7550 5100 0    50   ~ 0
LIM_REV
$Comp
L power:GND #PWR0104
U 1 1 6260D4C0
P 7300 5100
F 0 "#PWR0104" H 7300 4850 50  0001 C CNN
F 1 "GND" H 7305 4927 50  0000 C CNN
F 2 "" H 7300 5100 50  0001 C CNN
F 3 "" H 7300 5100 50  0001 C CNN
	1    7300 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 5100 7100 4900
Wire Wire Line
	7100 4900 7950 4900
Wire Wire Line
	7550 5100 7950 5100
$Comp
L Device:LED_Small_ALT D2
U 1 1 6260E9F2
P 4800 4250
F 0 "D2" V 4846 4180 50  0000 R CNN
F 1 "Green" V 4755 4180 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 4800 4250 50  0001 C CNN
F 3 "~" V 4800 4250 50  0001 C CNN
	1    4800 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 62610D05
P 4800 3850
F 0 "R2" H 4859 3896 50  0000 L CNN
F 1 "2.2k" H 4859 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4800 3850 50  0001 C CNN
F 3 "~" H 4800 3850 50  0001 C CNN
	1    4800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 3750 4800 3650
Wire Wire Line
	4800 3650 5150 3650
Text Label 4900 3650 0    50   ~ 0
+3.3V
Wire Wire Line
	4800 4150 4800 4050
Wire Wire Line
	4800 4350 4800 4450
Wire Wire Line
	4800 4450 5200 4450
Connection ~ 4800 4050
Wire Wire Line
	4800 4050 4800 3950
Text Label 4900 4450 0    50   ~ 0
LIM_FWD
$Comp
L Device:LED_Small_ALT D1
U 1 1 62619DC4
P 4050 4250
F 0 "D1" V 4096 4180 50  0000 R CNN
F 1 "Red" V 4005 4180 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 4050 4250 50  0001 C CNN
F 3 "~" V 4050 4250 50  0001 C CNN
	1    4050 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 62619DCA
P 4050 3850
F 0 "R1" H 4109 3896 50  0000 L CNN
F 1 "2.2k" H 4109 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4050 3850 50  0001 C CNN
F 3 "~" H 4050 3850 50  0001 C CNN
	1    4050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3750 4050 3650
Wire Wire Line
	4050 3650 4400 3650
Text Label 4150 3650 0    50   ~ 0
+3.3V
Wire Wire Line
	4050 4150 4050 4050
Wire Wire Line
	4050 4350 4050 4450
Wire Wire Line
	4050 4450 4450 4450
Connection ~ 4050 4050
Wire Wire Line
	4050 4050 4050 3950
Text Label 4150 4450 0    50   ~ 0
LIM_REV
Wire Wire Line
	6600 2300 6300 2300
Wire Wire Line
	7000 2300 7300 2300
Text Label 7150 2300 0    50   ~ 0
+5V
Text Label 6300 2300 0    50   ~ 0
+3.3V
$Comp
L Mechanical:MountingHole H1
U 1 1 6261F29F
P 3200 3850
F 0 "H1" H 3300 3896 50  0000 L CNN
F 1 "4-40/M3" H 3300 3805 50  0000 L CNN
F 2 "talonsrx-enc-limit-ftc-special:MountingHole_3.2mm_M3_Clearance" H 3200 3850 50  0001 C CNN
F 3 "~" H 3200 3850 50  0001 C CNN
	1    3200 3850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6262135D
P 3200 4250
F 0 "H2" H 3300 4296 50  0000 L CNN
F 1 "4-40/M3" H 3300 4205 50  0000 L CNN
F 2 "talonsrx-enc-limit-ftc-special:MountingHole_3.2mm_M3_Clearance" H 3200 4250 50  0001 C CNN
F 3 "~" H 3200 4250 50  0001 C CNN
	1    3200 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6263EA72
P 8000 2100
F 0 "#PWR0105" H 8000 1850 50  0001 C CNN
F 1 "GND" H 8005 1927 50  0000 C CNN
F 2 "" H 8000 2100 50  0001 C CNN
F 3 "" H 8000 2100 50  0001 C CNN
	1    8000 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2100 8000 2050
Wire Wire Line
	8000 2050 7850 2050
Wire Wire Line
	7850 2050 7850 2400
Wire Wire Line
	7850 2400 7950 2400
Wire Wire Line
	7950 2600 7000 2600
Wire Wire Line
	7000 2700 7950 2700
Text Label 7000 2600 0    50   ~ 0
ENC_A
Text Label 7000 2700 0    50   ~ 0
ENC_B
Wire Wire Line
	6800 2500 6800 2450
Wire Wire Line
	6800 2500 7950 2500
Text Label 7000 2500 0    50   ~ 0
ENC_PWR
Text Label 7500 3600 0    50   ~ 0
LIM_N
Text Label 4050 4050 0    50   ~ 0
LIM_REV_A
Wire Wire Line
	4050 4050 4450 4050
Wire Wire Line
	4800 4050 5200 4050
Text Label 4800 4050 0    50   ~ 0
LIM_FWD_A
$EndSCHEMATC
