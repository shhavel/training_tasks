# frozen_string_literal: true

describe 'solution' do
  # O(N * log(log(N)))
  def solution(a)
    n = a.length
    return 0 if n.zero? || n == 1 || n == 2
    # Indicate indexes considered peaks
    peaks = Array.new(n, false)
    peaks_cnt = 0
    1.upto(n - 2) do |i|
      if a[i - 1] < a[i] && a[i] > a[i + 1]
        peaks[i] = true
        peaks_cnt += 1
      end
    end
    return peaks_cnt if peaks_cnt.zero? || peaks_cnt == 1
    # Nearest peak on the right for each index
    next_peak = Array.new(n, -1)
    (n - 2).downto(0) { |i| next_peak[i] = peaks[i] ? i : next_peak[i + 1] }
    # Find the maximum number of blocks into which the array A can be divided
    peaks_cnt.downto(2) do |blocks_number|
      next unless n % blocks_number == 0
      k = n / blocks_number # number of elements in each block (block size)
      # Check if each block cover at least one peak
      return blocks_number if (0...n).step(k).all? { |i| (i...i + k).cover? next_peak[i] }
    end
    1
  end

  it { expect(solution([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])).to eq(3) }
end
