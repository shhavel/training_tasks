#!/usr/bin/python
# python spec/15_caterpillar_method/theory/triangles_test.py

def triangles(A):
    n = len(A)
    result = 0
    for x in xrange(n - 2):
        z = x + 2
        for y in xrange(x + 1, n - 1):
            while (z < n and A[x] + A[y] > A[z]):
                z += 1
            result += z - y - 1
    return result


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(triangles([2, 3, 4]), 1)
        self.assertEqual(triangles([2, 3, 4, 5, 10]), 3)

if __name__ == '__main__':
    unittest.main()
