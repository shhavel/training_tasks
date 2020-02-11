#!/usr/bin/python
# python spec/14_binary_search_algorithm/theory/binary_search_test.py

def binarySearch(A, x):
    n = len(A)
    beg = 0
    end = n-1
    result = -1
    while (beg <= end):
        mid = (beg + end) / 2
        if (A[mid] <= x):
            beg = mid + 1
            result = mid
        else:
            end = mid - 1
    return result


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(binarySearch([1, 2, 3], 2), 1)
        self.assertEqual(binarySearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 11), 10)
        self.assertEqual(binarySearch([12, 15, 15, 19, 24, 31, 53, 59, 60], 31), 5)

if __name__ == '__main__':
    unittest.main()
