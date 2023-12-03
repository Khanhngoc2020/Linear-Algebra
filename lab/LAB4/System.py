import matplotlib.pyplot as plt
import numpy as np

fig, axes = plt.subplots(nrows=2, ncols=2, figsize=(12, 10))
fig.suptitle('Система асимптотически устойчива', color='mediumaquamarine', fontname='Times New Roman',fontsize=20)

# Set labels for each graph
for i in range(2):
    for j in range(2):
        if i == 1 and j == 1:
            axes[i][j].set_xlabel(r'$x_{1}(t)$', color='black', fontsize=12)
            axes[i][j].set_ylabel(r'$x_{2}(t)$', color='black', fontsize=12)
            axes[i][j].xaxis.set_label_coords(1.05, 0.52)
            axes[i][j].yaxis.set_label_coords(0.5, 1.016)
            axes[i][j].yaxis.label.set_rotation(0)
        else:
            axes[i][j].set_xlabel('t', color='black', fontsize=12)
            axes[i][j].set_ylabel('x(t)', color='black', fontsize=12)
            axes[i][j].xaxis.set_label_coords(1.02, 0.52)
            axes[i][j].yaxis.set_label_coords(0.5, 1.016)
            axes[i][j].yaxis.label.set_rotation(0)
            
def Oxy(ax):
    plt.sca(ax)
    # Draw the coordinate system Oxy
    Ox = np.arange(-10,11,2)
    Oy = np.arange(-10,11,2)
    # Set the color for the values of the Ox axis and Oy axis
    plt.grid(linestyle="--", color="silver", linewidth=0.5)
    plt.xticks(Ox, color='black')
    plt.yticks(Oy, color='black')
    plt.xlim(-10, 10)
    plt.ylim(-10, 10)
    plt.plot(Ox, [0] * len(Ox), color='black', linewidth=0.5)  # axis Ox
    plt.plot([0] * len(Oy), Oy, color='black', linewidth=0.5)  # axis Oy

def Draw_graphs(ax, title, t, x1, x2, color_1, color_2):
    plt.sca(ax)
    plt.title(f'{title}', loc='left', fontname='Times New Roman', fontsize=15, color='tomato')
    plt.plot(t, x1, color=f'{color_1}' , linewidth=1.25, label=r'$x_{1}(t)$')
    plt.plot(t, x2, color=f'{color_2}' , linewidth=1.25, label=r'$x_{2}(t)$')
    plt.legend()   
  
t = np.arange(-10, 10, 0.01)
# Case 1
x1_1 = 3*np.exp(-2*t) + 3*np.exp(-5*t)
x2_1 = 6*np.exp(-2*t) - 3*np.exp(-5*t)
# Case 2
x1_2 = (1/3)*np.exp(-2*t) - (7/3)*np.exp(-5*t)
x2_2 = (2/3)*np.exp(-2*t) + (7/3)*np.exp(-5*t)
# Case 3
x1_3 = -np.exp(-2*t) - np.exp(-5*t)
x2_3 = -2*np.exp(-2*t) + np.exp(-5*t)

Oxy(axes[0][0])
Oxy(axes[0][1])
Oxy(axes[1][0])
Oxy(axes[1][1])

# Draw graphs of x(t) in 3 cases
Draw_graphs(axes[0][0], 'Case 1', t, x1_1, x2_1, 'red', 'green')
Draw_graphs(axes[0][1], 'Case 2', t, x1_2, x2_2, 'red', 'green')
Draw_graphs(axes[1][0], 'Case 3', t, x1_3, x2_3, 'red', 'green') 

# Draw the phase trajectory of the 3 cases
plt.sca(axes[1][1])
plt.title('Phase trajectory', loc='left', color='orange', fontname='Times New Roman', fontsize=15)

plt.plot(x1_1, x2_1, color='cyan', linewidth=1.25, label='Case 1')
plt.plot(x1_2, x2_2, color='violet', linewidth=1.25, label='Case 2')
plt.plot(x1_3, x2_3, color='black', linewidth=1.25, label='Case 3')
plt.legend()
# Draw symmetrically through center O
plt.plot(-x1_1, -x2_1, color='cyan', linewidth=1.25)
plt.plot(-x1_2, -x2_2, color='violet', linewidth=1.25)
plt.plot(-x1_3, -x2_3, color='black', linewidth=1.25)

# Show graph
plt.show()
