import pandas as pd
import matplotlib.pyplot as plt

IJ = pd.read_csv("../documents/c/csv/matrixVectorMultiplicationIJ.csv",header = None)
JI = pd.read_csv("../documents/c/csv/matrixVectorMultiplicationJI.csv",header = None)

plt.plot(IJ[0], IJ[1], label='I x J')
plt.plot(JI[0], JI[1], label='J x I')
plt.title('C')
plt.ylabel('Runtime (s)')
plt.xlabel('N')
plt.legend()
plt.savefig('../documents/c/images/graph.png')