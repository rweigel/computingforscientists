# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt

A = [1.0,4.0,16.0,32.0];
plt.plot(A)
plt.savefig('figures/Plotting_1D_I.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
x = [1.,2.,3.,4.]
plt.plot(x,A)
plt.savefig('figures/Plotting_1D_II.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
x = [10.,20.,30.,40.]
plt.plot(x,A)
plt.savefig('figures/Plotting_1D_III.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
x = [1.,2.,3.,4.];
plt.plot(x,A)
plt.grid()
plt.xlabel('Time [seconds]');
plt.ylabel('Height [meters]');
plt.title('Experiment 1 results');
plt.savefig('figures/Plotting_1D_IV.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
plt.plot(A,color=[0.5,0.5,0.5])
plt.savefig('figures/Plotting_1D_V.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
plt.plot(A,'*')
plt.savefig('figures/Plotting_1D_VI.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
plt.plot(A,'*',color=[0.5,0.5,0.5])
plt.savefig('figures/Plotting_1D_VII.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
plt.plot(A,'*',markersize=10)
plt.savefig('figures/Plotting_1D_VIII.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
plt.plot(A,'-',linewidth=5)
plt.savefig('figures/Plotting_1D_IX.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
plt.plot(A,'r-')
plt.savefig('figures/Plotting_1D_X.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
plt.plot(A,'r*-', linewidth=3,markersize=10)
plt.savefig('figures/Plotting_1D_XI.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
B = [1.1,4.4,16.9,32.9];
l1, = plt.plot(A,'b')
l2, = plt.plot(B,'r')
plt.legend(['A','B'])
plt.savefig('figures/Plotting_1D_XII.py.png',dpi=600)
plt.show()

A = [1.0,4.0,16.0,32.0];
B = [1.1,4.4,16.9,32.9];
l1, = plt.plot(A,'b')
l2, = plt.plot(B,'r')
plt.legend(['A','B'],loc='upper left')
plt.savefig('figures/Plotting_1D_XIII.py.png',dpi=600)
plt.show()