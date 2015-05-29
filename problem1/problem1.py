# avoid trouble with the python 2 division
from __future__ import division

def calculate_parameters(aa):
    # assume sequence follows pattern
    # first three elements enough to calculate K, L
    a0 = aa[0]
    a1 = aa[1]
    a2 = aa[2]
    K = (a2-a1)/(a1-a0)
    L = a1 - K * a0
    return K, L

def check_array(aa):
    ok = False
    K, L = calculate_parameters(aa) # use first three elements
    # check with the rest
    for i in range(3,len(aa)):
        if aa[i] != aa[i-1]*K + L:
            ok = False
            break
        else: # if all elements pass, set ok to True
            ok = True
    return ok

if __name__ == "__main__":
    # read first line
    what = int(raw_input())
    # read second line with number array
    the_raw_input = raw_input()
    a_numbers = [float(n) for n in the_raw_input.split()]

    if what == 2:
        ok = check_array(a_numbers)
        if ok:
            print 'true'
        else:
            print 'false'
    else:
        # assume array is the correct sequence
        K, L = calculate_parameters(a_numbers)
        print '%.2f %.2f' % (round(K,2), round(L, 2))