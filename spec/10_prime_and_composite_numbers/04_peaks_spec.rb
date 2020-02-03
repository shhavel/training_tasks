# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    n = a.length
    return 0 if n.zero? || n == 1 || n == 2
    # Indicate indexes considered peaks
    peaks = Array.new(n, false)
    peaks_count = 0
    1.upto(n - 2) do |i|
      if a[i - 1] < a[i] && a[i] > a[i + 1]
        peaks[i] = true
        peaks_count += 1
      end
    end
    return peaks_count if peaks_count.zero? || peaks_count == 1
    # Nearest peak on the right for each index
    next_peak = Array.new(n, -1)
    (n - 2).downto(0) { |i| next_peak[i] = peaks[i] ? i : next_peak[i + 1] }
    # Find the maximum number of blocks into which the array A can be divided
    blocks = 1
    2.upto(peaks_count) do |b|
      next unless n % b == 0
      k = n / b # count of elements in each block
      # Check if each block cover at least one peak
      if (0...n).step(k).all? { |i| (i...i + k).cover? next_peak[i] }
        blocks = b
      end
    end
    blocks
  end

  it { expect(solution([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])).to eq(3) }
end
