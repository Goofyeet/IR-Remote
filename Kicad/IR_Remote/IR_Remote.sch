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
L Austin_Library:ATTiny12 U1
U 1 1 623C165D
P 5300 3600
F 0 "U1" H 5300 3150 50  0000 C CNN
F 1 "ATTiny12" H 5300 4050 50  0000 C CNN
F 2 "Austin's Footprints:ATTiny12" H 4550 4150 50  0001 C CNN
F 3 "" H 4550 4150 50  0001 C CNN
	1    5300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3300 2550 3300
Wire Wire Line
	2550 3800 2800 3800
Wire Wire Line
	2800 4200 2550 4200
Wire Wire Line
	2550 3300 2550 3800
Connection ~ 2550 3800
Wire Wire Line
	2550 3800 2550 4200
Wire Wire Line
	2800 4700 2550 4700
Connection ~ 2550 4200
Wire Wire Line
	2800 5150 2550 5150
Wire Wire Line
	2550 4200 2550 4700
Connection ~ 2550 4700
Wire Wire Line
	2550 4700 2550 5150
Wire Wire Line
	3500 3800 3750 3800
Wire Wire Line
	3750 3800 3750 3500
Wire Wire Line
	3750 3500 4900 3500
Wire Wire Line
	3500 4200 3900 4200
Wire Wire Line
	3900 4200 3900 3700
Wire Wire Line
	3900 3700 4900 3700
$Comp
L power:GND #PWR03
U 1 1 623C95E0
P 4800 4150
F 0 "#PWR03" H 4800 3900 50  0001 C CNN
F 1 "GND" H 4805 3977 50  0000 C CNN
F 2 "" H 4800 4150 50  0001 C CNN
F 3 "" H 4800 4150 50  0001 C CNN
	1    4800 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4150 4800 3900
Wire Wire Line
	4800 3900 4900 3900
Wire Wire Line
	5650 3300 5800 3300
Wire Wire Line
	5800 3300 5800 3050
Wire Wire Line
	3500 4700 5850 4700
Wire Wire Line
	5850 4700 5850 3900
Wire Wire Line
	5850 3900 5650 3900
Wire Wire Line
	3500 5150 6300 5150
Wire Wire Line
	6300 3700 5650 3700
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 623CD0B2
P 7550 3500
F 0 "Q1" H 7740 3546 50  0000 L CNN
F 1 "2N2222A" H 7740 3455 50  0000 L CNN
F 2 "digikey-footprints:TO-92-3" H 7750 3425 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 7550 3500 50  0001 L CNN
	1    7550 3500
	1    0    0    -1  
$EndComp
$Comp
L LED:CQY99 D1
U 1 1 623CE8F9
P 7650 2400
F 0 "D1" V 7646 2321 50  0000 R CNN
F 1 "CQY99" V 7555 2321 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm_Horizontal_O1.27mm_Z3.0mm_IRGrey" H 7650 2575 50  0001 C CNN
F 3 "https://www.prtice.info/IMG/pdf/CQY99.pdf" H 7600 2400 50  0001 C CNN
	1    7650 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 623D0CE6
P 7650 2950
F 0 "R3" H 7720 2996 50  0000 L CNN
F 1 "10" H 7720 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7580 2950 50  0001 C CNN
F 3 "~" H 7650 2950 50  0001 C CNN
	1    7650 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 623D11C8
P 7650 3900
F 0 "#PWR05" H 7650 3650 50  0001 C CNN
F 1 "GND" H 7655 3727 50  0000 C CNN
F 2 "" H 7650 3900 50  0001 C CNN
F 3 "" H 7650 3900 50  0001 C CNN
	1    7650 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 623D1B61
P 6750 3500
F 0 "R1" V 6543 3500 50  0000 C CNN
F 1 "220" V 6634 3500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6680 3500 50  0001 C CNN
F 3 "~" H 6750 3500 50  0001 C CNN
	1    6750 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 3500 6600 3500
Wire Wire Line
	6900 3500 7350 3500
Wire Wire Line
	7650 3700 7650 3900
Wire Wire Line
	7650 3300 7650 3200
Wire Wire Line
	7650 2800 7650 2700
Wire Wire Line
	7650 2050 7650 2300
$Comp
L Austin_Library:ISP_6Pin_Header J1
U 1 1 623D8B14
P 7500 4700
F 0 "J1" H 7728 4646 50  0000 L CNN
F 1 "ISP_6Pin_Header" H 7728 4555 50  0000 L CNN
F 2 "Austin's Footprints:2X3_ICSP_Header" H 7500 4700 50  0001 C CNN
F 3 "" H 7500 4700 50  0001 C CNN
	1    7500 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 623DEB01
P 7200 5250
F 0 "#PWR04" H 7200 5000 50  0001 C CNN
F 1 "GND" H 7205 5077 50  0000 C CNN
F 2 "" H 7200 5250 50  0001 C CNN
F 3 "" H 7200 5250 50  0001 C CNN
	1    7200 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 5250 7200 5050
Wire Wire Line
	7200 5050 7300 5050
$Comp
L power:GND #PWR02
U 1 1 623DFDCD
P 2550 5400
F 0 "#PWR02" H 2550 5150 50  0001 C CNN
F 1 "GND" H 2555 5227 50  0000 C CNN
F 2 "" H 2550 5400 50  0001 C CNN
F 3 "" H 2550 5400 50  0001 C CNN
	1    2550 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5400 2550 5150
Connection ~ 2550 5150
Text Notes 1800 5400 0    50   ~ 0
This may be\n5V instead if \nmicrocontroller\nuses sink inputs
Wire Wire Line
	7300 4950 7050 4950
Wire Wire Line
	7300 4850 7050 4850
Wire Wire Line
	7300 4750 7050 4750
Wire Wire Line
	7300 4650 7050 4650
Text Label 6000 3900 0    50   ~ 0
MOSI
Text Label 7050 4850 0    50   ~ 0
MOSI
Text Label 7050 4950 0    50   ~ 0
RST
Text Label 3950 3150 0    50   ~ 0
RST
Text Label 7050 4750 0    50   ~ 0
SCK
Text Label 5650 3500 0    50   ~ 0
SCK
Wire Wire Line
	6300 3700 6300 4550
Connection ~ 6300 4550
Wire Wire Line
	6300 4550 6300 5150
Wire Wire Line
	5850 3900 6000 3900
Connection ~ 5850 3900
Wire Wire Line
	4150 3300 4150 3150
Wire Wire Line
	4150 3150 3950 3150
Connection ~ 4150 3300
Wire Wire Line
	4150 3300 4900 3300
$Comp
L Austin_Library:4Pin_Pushbutton PB1
U 1 1 623FA0EC
P 3150 3300
F 0 "PB1" H 3150 3625 50  0000 C CNN
F 1 "Power" H 3150 3534 50  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 3150 3300 50  0001 C CNN
F 3 "" H 3150 3300 50  0001 C CNN
	1    3150 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3200 3500 3200
Wire Wire Line
	3500 3200 3500 3300
Wire Wire Line
	3450 3400 3500 3400
Wire Wire Line
	3500 3400 3500 3300
Connection ~ 3500 3300
Wire Wire Line
	2850 3200 2800 3200
Wire Wire Line
	2800 3200 2800 3300
Wire Wire Line
	2800 3400 2850 3400
$Comp
L Austin_Library:4Pin_Pushbutton PB2
U 1 1 62409071
P 3150 3800
F 0 "PB2" H 3150 4125 50  0000 C CNN
F 1 "Speed" H 3150 4034 50  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 3150 3800 50  0001 C CNN
F 3 "" H 3150 3800 50  0001 C CNN
	1    3150 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3700 3500 3700
Wire Wire Line
	3450 3900 3500 3900
Wire Wire Line
	2850 3700 2800 3700
Wire Wire Line
	2800 3700 2800 3800
Wire Wire Line
	2800 3900 2850 3900
Wire Wire Line
	3500 3700 3500 3800
Wire Wire Line
	3500 3900 3500 3800
Connection ~ 3500 3800
$Comp
L Austin_Library:4Pin_Pushbutton PB3
U 1 1 6240C3F0
P 3150 4200
F 0 "PB3" H 3150 4525 50  0000 C CNN
F 1 "Rotation" H 3150 4434 50  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 3150 4200 50  0001 C CNN
F 3 "" H 3150 4200 50  0001 C CNN
	1    3150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4100 3500 4100
Wire Wire Line
	3450 4300 3500 4300
Wire Wire Line
	2850 4100 2800 4100
Wire Wire Line
	2800 4100 2800 4200
Wire Wire Line
	2800 4300 2850 4300
Wire Wire Line
	3500 4100 3500 4200
Wire Wire Line
	3500 4300 3500 4200
Connection ~ 3500 4200
$Comp
L Austin_Library:4Pin_Pushbutton PB4
U 1 1 62410581
P 3150 4700
F 0 "PB4" H 3150 5025 50  0000 C CNN
F 1 "Timer" H 3150 4934 50  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 3150 4700 50  0001 C CNN
F 3 "" H 3150 4700 50  0001 C CNN
	1    3150 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4600 3500 4600
Wire Wire Line
	3450 4800 3500 4800
Wire Wire Line
	2850 4600 2800 4600
Wire Wire Line
	2800 4600 2800 4700
Wire Wire Line
	2800 4800 2850 4800
$Comp
L Austin_Library:4Pin_Pushbutton PB5
U 1 1 62412315
P 3150 5150
F 0 "PB5" H 3150 5475 50  0000 C CNN
F 1 "Mode" H 3150 5384 50  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 3150 5150 50  0001 C CNN
F 3 "" H 3150 5150 50  0001 C CNN
	1    3150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 5050 3500 5050
Wire Wire Line
	3450 5250 3500 5250
Wire Wire Line
	2850 5050 2800 5050
Wire Wire Line
	2800 5050 2800 5150
Wire Wire Line
	2800 5250 2850 5250
Wire Wire Line
	3500 5050 3500 5150
Wire Wire Line
	3500 5250 3500 5150
Connection ~ 3500 5150
Wire Wire Line
	3500 4800 3500 4700
Wire Wire Line
	3500 4600 3500 4700
Connection ~ 3500 4700
Connection ~ 2800 3300
Wire Wire Line
	2800 3300 2800 3400
Connection ~ 2800 3800
Wire Wire Line
	2800 3800 2800 3900
Connection ~ 2800 4200
Wire Wire Line
	2800 4200 2800 4300
Connection ~ 2800 4700
Wire Wire Line
	2800 4700 2800 4800
Connection ~ 2800 5150
Wire Wire Line
	2800 5150 2800 5250
Wire Wire Line
	6300 4550 7300 4550
Wire Wire Line
	3500 3300 4150 3300
$Comp
L Device:Battery_Cell BT1
U 1 1 624460D2
P 2550 2250
F 0 "BT1" H 2668 2346 50  0000 L CNN
F 1 "3V" H 2668 2255 50  0000 L CNN
F 2 "Austin's Footprints:CR2032_BH-124A-1" V 2550 2310 50  0001 C CNN
F 3 "~" V 2550 2310 50  0001 C CNN
	1    2550 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2050 2550 1750
Wire Wire Line
	2550 1750 3150 1750
Wire Wire Line
	2550 2350 2550 2700
$Comp
L power:GND #PWR01
U 1 1 623EF6A6
P 2550 2700
F 0 "#PWR01" H 2550 2450 50  0001 C CNN
F 1 "GND" H 2555 2527 50  0000 C CNN
F 2 "" H 2550 2700 50  0001 C CNN
F 3 "" H 2550 2700 50  0001 C CNN
	1    2550 2700
	1    0    0    -1  
$EndComp
Text Label 3150 1750 0    50   ~ 0
3V
Text Label 5800 3050 0    50   ~ 0
3V
Text Label 7650 2050 0    50   ~ 0
3V
Text Label 7050 4650 0    50   ~ 0
3V
$Comp
L Device:R R4
U 1 1 623F91D9
P 7950 2950
F 0 "R4" H 8020 2996 50  0000 L CNN
F 1 "10" H 8020 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7880 2950 50  0001 C CNN
F 3 "~" H 7950 2950 50  0001 C CNN
	1    7950 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 623F958F
P 7350 2950
F 0 "R2" H 7420 2996 50  0000 L CNN
F 1 "10" H 7420 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7280 2950 50  0001 C CNN
F 3 "~" H 7350 2950 50  0001 C CNN
	1    7350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2800 7950 2700
Wire Wire Line
	7950 2700 7650 2700
Connection ~ 7650 2700
Wire Wire Line
	7650 2700 7650 2600
Wire Wire Line
	7350 2800 7350 2700
Wire Wire Line
	7350 2700 7650 2700
Wire Wire Line
	7350 3100 7350 3200
Wire Wire Line
	7350 3200 7650 3200
Connection ~ 7650 3200
Wire Wire Line
	7650 3200 7650 3100
Wire Wire Line
	7950 3100 7950 3200
Wire Wire Line
	7950 3200 7650 3200
$EndSCHEMATC
