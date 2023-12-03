import matplotlib.pyplot as plt
import numpy as np


ax = plt.gca()

def Draw_vecto(vecto, color, vecto_name):
    ax.quiver(0, 0, vecto[0], vecto[1], angles='xy', scale_units='xy', scale=1, color=f'{color}', label=f'{vecto_name}', width=0.005, headwidth=4, headaxislength=4, headlength=4)

    # Customize the limits of the x and y-axis
    ax.set_xlim([0, max(vecto[0], 1)])  # Sets the x-axis limit from 0 to the x-value of the vector, or 1 if vector[0] <= 1
    ax.set_ylim([0, max(vecto[1], 1)])  # Sets the y-axis limit from 0 to the y-value of the vector, or 1 if vector[0] <= 1

    # Name the x and y axes
    ax.set_xlabel('Re')
    ax.set_ylabel('Im')

def Oxy():
    Ox = list(range(-2,3,1))
    Oy = list(range(-2,3,1))

    plt.plot(Ox, [0]*len(Ox), color='black', linewidth=1)
    plt.plot([0]*len(Oy), Oy , color='black', linewidth=1)
    plt.xticks(Ox, color='black')
    plt.yticks(Oy, color='black')
    plt.grid(linestyle='--', color='gray', linewidth=0.5)
    plt.axis('equal')



Vector_1 = [0, 0]
Vector_2 = [0, 0]

# Draw graphs

Draw_vecto(Vector_1, 'blue', 'Vector 1')
Draw_vecto(Vector_2, 'red', 'Vector 2')

Oxy()

ax = plt.subplot()

# Show caption
plt.legend()

# Show graphs
plt.show()