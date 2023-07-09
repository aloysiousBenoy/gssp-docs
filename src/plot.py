import matplotlib.pyplot as plt
import math as m
import numpy as np
c=3*(10**8)
txantgain=2
d=np.linspace(20,100,100)*(10**3)
print(d)
a=20*np.log10(d)
b=20*m.log10(868*(10**6))
e=20*m.log10((4*m.pi)/c)
fspl=a+b+e
power=20-fspl+txantgain
plt.plot(d/(10**3),power)
plt.xlabel("distance(km)")
plt.ylabel("power(dBm)")
plt.show()
