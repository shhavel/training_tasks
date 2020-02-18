#!/usr/bin/python
# python spec/17_dynamic_programming/theory/dynamic_coin_changing_test.py

def dynamic_coin_changing1(C, k):
    MAX_INT = float('inf')
    n = len(C)
    # create two-dimensional array with all zeros
    dp = [[0] * (k+1) for i in xrange(n+1)]
    dp[0] = [0] + [MAX_INT] * k
    for i in xrange(1, n + 1):
        for j in xrange(C[i - 1]):
            dp[i][j] = dp[i - 1][j]
        for j in xrange(C[i - 1], k + 1):
            dp[i][j] = min(dp[i][j - C[i - 1]] + 1, dp[i - 1][j])
    return dp[n][k]


def dynamic_coin_changing(C, k):
    MAX_INT = float('inf')
    n = len(C)
    dp = [0] + [MAX_INT] * k
    for i in xrange(1, n + 1):
        for j in xrange(C[i - 1], k + 1):
            dp[j] = min(dp[j - C[i - 1]] + 1, dp[j])
    return dp[k]


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(dynamic_coin_changing([1, 3, 4], 6), 2)

if __name__ == '__main__':
    unittest.main()
