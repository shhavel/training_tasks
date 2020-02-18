#!/usr/bin/python
# python spec/17_dynamic_programming/theory/frog_test.py

def frog(S, k, q):
    n = len(S)
    dp = [1] + [0] * k
    for j in xrange(1, k + 1):
        for i in xrange(n):
            if S[i] <= j:
                dp[j] = (dp[j] + dp[j - S[i]]) % q;
    return dp[k]


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(frog([2, 3], 9, 1000), 5)

if __name__ == '__main__':
    unittest.main()
