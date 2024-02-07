'''
A python module for calculating cube root using Newton's method
'''
def mycuberoot(x):
    '''
    A function to calculate cube root using Newton's method
    '''
    s = 1.
    kmax = 100
    tol = 1.e-14
    for k in range(kmax):
        s0 = s
        s = (1/3) * (2*s + x/(s**2))
        delta_s = s - s0
        if (abs(delta_s/x)) < tol:
            break
    return s

if __name__ == '__main__':
    x = 27
    print('The cube root of', x, 'is', mycuberoot(x))

