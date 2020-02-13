#!/usr/bin/python
# python spec/15_caterpillar_method/theory/caterpillar_method_test.py

def caterpillarMethod(A, s):
    n = len(A)
    front, total = 0, 0
    for back in xrange(n):
        while (front < n and total + A[front] <= s):
            total += A[front]
            front += 1
        if total == s:
            return True
        total -= A[back]
    return False


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(caterpillarMethod([6, 2, 7, 4, 1, 3, 6], 12), True)

if __name__ == '__main__':
    unittest.main()
