import numpy as np


def main():
    x = np.linspace(0, 20, num=21)
    y = np.array([
0.5,4.3,8.1,11.8,15.5,19.5,23.3,27.2,31,35,38.9,42.9,46.8,50.9,54.9,59,63.1,67.1,71.2,75.4,79.5
    ])
    c = np.polynomial.polynomial.polyfit(x, y, 3)
    print(c)

if __name__ == '__main__':
    main()
