# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt

x = [];
y = [];
for i in range(401):
    x.append(float(i)/100)
    y.append(x[i]*x[i])
    print(str(i) + " " + str(x[i]) + " " + str(y[i]))

plt.plot(x,y,'g',linewidth=2)
plt.grid()
plt.xlabel('x')
#plt.ylabel('y',rotation=0)
plt.ylabel('y')
plt.savefig('figures/Quadratic.py.png',dpi=600)
plt.show()
