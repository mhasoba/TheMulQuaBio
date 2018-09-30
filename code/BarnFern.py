#!/usr/bin/env python
"""
Animated construction of the Sierpinski gasket using the chaos game.
"""

import random
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from scipy.stats import rv_discrete as rv

A = np.array([[[0.0,0.0],[0.00,0.16]],
          [[0.85,0.04],[-0.04,0.85]],
          [[0.2,-0.26],[0.23,0.22]],
          [[-0.15,0.28],[0.26,0.24]]])

b = np.array([[0.00,0.00],
              [0.00,1.60],
              [0.00,1.60],
              [0.00,0.44]])

next_transform = rv(name='Fern',values=((0,1,2,3),(0.01,0.85,0.07,0.07)))

xs, ys = [], []

def simplify_axes(ax):
    ax.set_yticklabels([])
    ax.set_xticklabels([])
    ax.set_yticks([])
    ax.set_xticks([])
    ax.set_xlim(-2.3,2.8)
    ax.set_ylim(-0.1,10.1)
    
# int(last_point):
    # transform = next_transform.rvs()
    # return np.dot(A[transform],last_point) + b[transform]

def update_line(i):
    next = next_point(update_line.current)

    xs.append(next[0])
    ys.append(next[1])
    update_line.serp.set_data(xs, ys)

    update_line.current = next

def main():
    current = [0.15, 0.35]

    fig = plt.figure()
    ax = fig.add_subplot(111)
    simplify_axes(ax)

    # Don't plot the first few iterations.
    for x in range(15):
      current = next_point(current)
    ax.plot(current[0], current[1], 'go', markersize=1)

    update_line.current = current
    update_line.serp, = ax.plot(xs, ys, 'go', markersize=1)

    ani = animation.FuncAnimation(fig, update_line, 1000, interval=10, repeat=False)
    plt.show()

if __name__ == "__main__":
    main()
