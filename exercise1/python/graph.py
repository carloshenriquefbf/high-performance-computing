import pandas as pd
import matplotlib.pyplot as plt

C_IJ = pd.read_csv("../documents/c/csv/matrixVectorMultiplicationIJ.csv",header = None)
C_JI = pd.read_csv("../documents/c/csv/matrixVectorMultiplicationJI.csv",header = None)

plt.figure(1)
plt.plot(C_IJ[0], C_IJ[1], label='I x J')
plt.plot(C_JI[0], C_JI[1], label='J x I')
plt.title('C')
plt.ylabel('Runtime (s)')
plt.xlabel('N')
plt.legend()
plt.savefig('../documents/c/images/graph.png')

FORTRAN_IJ = pd.read_csv("../documents/fortran/csv/matrixVectorMultiplicationIJ.csv",header = None)
FORTRAN_JI = pd.read_csv("../documents/fortran/csv/matrixVectorMultiplicationJI.csv",header = None)

plt.figure(2)
plt.plot(FORTRAN_IJ[0], FORTRAN_IJ[1], label='I x J')
plt.plot(FORTRAN_JI[0], FORTRAN_JI[1], label='J x I')
plt.title('Fortran')
plt.ylabel('Runtime (s)')
plt.xlabel('N')
plt.legend()
plt.savefig('../documents/fortran/images/graph.png')