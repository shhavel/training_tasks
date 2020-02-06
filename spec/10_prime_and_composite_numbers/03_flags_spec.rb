# frozen_string_literal: true

describe 'solution' do
  # Check if k flags can be set.
  def check(k, n, next_peak)
    pos = 0
    num = 0
    while pos < n && num < k
      pos = next_peak[pos]
      break unless pos > 0
      num += 1
      pos += k
    end
    num == k
  end

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
    flags = 2
    k = 3
    while k * (k - 1) <= n
      return flags unless check(k, n, next_peak) # cannot set k flags (or >= k)
      flags = k
      k += 1
    end
    flags
  end

  it { expect(solution([1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])).to eq(3) }
  it { expect(solution([0, 1, 0, 0, 1, 0, 0, 1, 0])).to eq(3) }
  it { expect(solution([0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0])).to eq(3) }
  it { expect(solution([0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0])).to eq(4) }
  it { expect(solution([0, 1, 0, 0, 1, 0, 1, 0])).to eq(2) }
  it { expect(solution([])).to eq(0) }
  it { expect(solution([0])).to eq(0) }
  it { expect(solution([0, 0])).to eq(0) }
  it { expect(solution([0, 0, 0])).to eq(0) }
  it { expect(solution([1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2])).to eq(2) }
end
