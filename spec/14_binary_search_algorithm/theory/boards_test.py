#!/usr/bin/python
# python spec/14_binary_search_algorithm/theory/boards_test.py

def boards(A, k):
    n = len(A)
    beg = 1
    end = n
    result = -1
    while (beg <= end):
        mid = (beg + end) / 2
        if (check(A, mid) <= k):
            end = mid - 1
            result = mid
        else:
            beg = mid + 1
    return result

def check(A, d):
    n = len(A)
    boards = 0
    last = -1
    for i in xrange(n):
        if A[i] == 1 and last < i:
            boards += 1
            last = i + d - 1
    return boards

import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(boards([0, 0, 0], 1), 1)
        self.assertEqual(boards([1, 0, 0], 1), 1)
        self.assertEqual(boards([1, 1, 0], 1), 2)
        self.assertEqual(boards([1, 0, 1], 1), 3)
        self.assertEqual(boards([0, 1, 0, 1, 1, 0, 0, 1, 0, 0], 3), 2)

if __name__ == '__main__':
    unittest.main()
