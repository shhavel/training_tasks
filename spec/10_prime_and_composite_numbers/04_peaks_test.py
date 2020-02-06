#!/usr/bin/python
# python spec/10_prime_and_composite_numbers/04_peaks_test.py

# # O(N * log(log(N)))
def solution(A):
    peaks = []

    for idx in xrange(1, len(A)-1):
        if A[idx-1] < A[idx] > A[idx+1]:
            peaks.append(idx)

    if len(peaks) == 0 or len(peaks) == 1:
        return len(peaks)

    for size in xrange(len(peaks), 1, -1):
        if len(A) % size == 0:
            block_size = len(A) // size
            found = [False] * size
            found_cnt = 0
            for peak in peaks:
                block_nr = peak//block_size
                if found[block_nr] == False:
                    found[block_nr] = True
                    found_cnt += 1

                    if found_cnt == size:
                        return size

    return 1


import unittest

class TestSolution(unittest.TestCase):
    def test_examples(self):
        self.assertEqual(solution([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]), 3)

if __name__ == '__main__':
    unittest.main()
