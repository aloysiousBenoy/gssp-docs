import math

# tx power and rx sensitivity
tx_power = 20
rx_sens = -148

# Gain provided by antennae
tx_ant_gain = 2
rx_ant_gain = 2

# orbit height of the satellite, LEO
height = 35 * (10**3)

# Distance at horizon from ground
los_distance = 3.57*math.sqrt(height) * (10**3)

# frequency of transmitter
f = 868 * (10**6)


c = 3 * (10**8)

a = 20 * math.log10(height)
b = 20*math.log10(f)
d = 20*math.log10(4*math.pi/c)


fspl = a+b+d

print("Max line of sight distance at horizon = {} km".format(los_distance / (10**3)))
print("Free space path loss = {} dBm".format(fspl))
print("Total signal strength at Rx after loss = {} dBm".format(
    tx_power + tx_ant_gain-fspl+rx_ant_gain))
print("Margin = {} dBm".format(tx_power + tx_ant_gain-fspl+rx_ant_gain-rx_sens))
