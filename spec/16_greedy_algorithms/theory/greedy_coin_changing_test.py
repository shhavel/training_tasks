#!/usr/bin/python
# python spec/16_greedy_algorithms/theory/greedy_coin_changing_test.py

def greedyCoinChanging(M, k):
    n = len(M)
    result = []
    for i in xrange(n - 1, -1, -1):
        result += [(M[i], k // M[i])]
        k %= M[i]
    return result


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(greedyCoinChanging([1, 3, 4], 6), [(4, 1), (3, 0), (1, 2)])

if __name__ == '__main__':
    unittest.main()
