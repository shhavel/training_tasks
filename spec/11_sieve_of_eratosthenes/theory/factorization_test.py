#!/usr/bin/python
# python spec/11_sieve_of_eratosthenes/theory/factorization_test.py

def arrayF(n):
    F = [0] * (n + 1)
    i = 2
    while (i * i <= n):
        if (F[i] == 0):
            k = i * i
            while (k <= n):
                if (F[k] == 0):
                    F[k] = i
                k += i
        i += 1
    return F

def factorization(x, F):
    primeFactors = []
    while (F[x] > 0):
        primeFactors += [F[x]]
        x /= F[x]
    primeFactors += [x]
    return primeFactors


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        F = arrayF(18)
        self.assertEqual(factorization(18, F), [2, 3, 3])
        self.assertEqual(factorization(16, F), [2, 2, 2, 2])
        self.assertEqual(factorization(9, F), [3, 3])
        self.assertEqual(factorization(3, F), [3])

if __name__ == '__main__':
    unittest.main()
