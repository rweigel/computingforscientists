# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt

P1 = [100]
P2 = [95]

for i in range(100):
    P1.append(1.01*P1[i])
    P2.append(1.011*P2[i])
    print(str(i) + " " + str(P1[i]) + " " + str(P2[i]))

plt.plot(P1,'r-',linewidth=2)
plt.plot(P2,'b-',linewidth=2)
plt.legend(["P1","P2"],loc='upper left')
plt.ylim([90,300])
plt.grid()
plt.savefig('figures/Population.py.png',dpi=600)
plt.show()
