import math
import scipy.constants as const
# Frequency in MHz
f =915 * 10**6
# Orbit height in Kilometers
h = 500
# Tx antenna gain in dBi
tx_gain = 1.2
# Rx antenna gain in dBi
rx_gain = 1.2
# Tx power in dBm
tx_power = 22
# Rx sens in dBm
rx_sens = -148

h = h*10**3
# calculating the line of sight distance at horizon
d = 3.57 * math.sqrt(h) 
# speed of light 
c = const.c

# Formula of free space path lose in ideal conditions
fspl = 20*math.log10(d*10**3)+20*math.log10(f)+20*math.log10(4*math.pi / c)

print("Distance at horizon ",d,"km")
print("Free space path loss : ", fspl,"dB")

min_rx_sens = tx_power +tx_gain - fspl +rx_gain 

print("Required receiver sensitivity ", min_rx_sens, "dBm")

margin_rx_sens = abs(rx_sens) - abs(min_rx_sens)

print("Available margin for other losses / fading etc : ", margin_rx_sens ,"dB")
