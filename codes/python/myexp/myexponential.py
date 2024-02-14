import numpy as np
import matplotlib.pyplot as plt

def factorial(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)

def calculate_exponential(x, tolerance=1e-10):
    result = 1.0
    term = 1.0

    i = 1
    kmax = 1000
    for k in range(kmax):
        t0 = term
        term = (x ** i) / factorial(i)
        result += term
        i += 1
        delta_t = abs(term - t0)
        if delta_t < tolerance:
            break

    return result

if __name__ == '__main__':
    x_values = np.linspace(-2, 1, 10000)
    y_numpy = np.exp(x_values)
    y_user_defined = [calculate_exponential(x) for x in x_values]

    plt.plot(x_values, y_numpy, label='numpy.exp(x)', linestyle='--')
    plt.plot(x_values, y_user_defined, label='my exp(x)', linestyle=':')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.legend()
    plt.title('Comparison of numpy.exp(x) and my exp(x)')
    # plt.grid(True)
    plt.show()
