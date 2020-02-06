#!/usr/bin/python
# python spec/11_sieve_of_eratosthenes/theory/sieve_test.py

def sieve(n):
    sieve = [True] * (n + 1)
    sieve[0] = sieve[1] = False
    i = 2
    while (i * i <= n):
        if (sieve[i]):
            k = i * i
            while (k <= n):
                sieve[k] = False
                k += i
        i += 1
    return sieve


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(sieve(17), [False, False, True, True, False, True, False, True, False, False, False, True, False, True, False, False, False, True])

if __name__ == '__main__':
    unittest.main()
