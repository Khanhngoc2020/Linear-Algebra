import matplotlib.pyplot as plt
import numpy as np

fig, axes = plt.subplots(nrows=1, ncols=1, figsize=(15, 9))
fig.suptitle('5', color='black', fontname='Times New Roman',
             fontsize=20, fontweight='bold')

k = np.arange(0, 10, 1)
#x1 = 2 * np.power(-1,k)
#x2 = 3 * np.power(0.5,k)
i = complex(0, 1)

x1 = 65 * np.power(-1, k)
x2 = 5

#x1 = ((5-15*i) * np.power(i, k) * np.power(-1, k) + (5+15*i) * np.power(i, k)) / 2*np.power(2,k)
#x2 = ((-5-10*i) * np.power(i, k) * np.power(-1, k) - (5-10*i) * np.power(i, k)) / 2*np.power(2,k)

#Draw the phase trajectory of the 3 cases

plt.plot(x1, color='red', linewidth=1.25)
plt.plot(x2, color='blue', linewidth=1.25)


plt.grid(True, linestyle='--', linewidth=0.5, color='gray', alpha=0.5)

# Show graph
plt.show()
