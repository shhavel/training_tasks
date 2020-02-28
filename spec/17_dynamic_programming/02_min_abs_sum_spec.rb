# frozen_string_literal: true

describe 'solution' do
  # O(N * max(abs(A))**2)
  def solution(a)
    return 0 if a.empty?
    a = a.map(&:abs)
    sum = a.reduce(:+)
    # numbers in array and their count (NOTE: no need to sort array)
    nums = a.each_with_object(Hash.new(0)) { |n, h| h[n] += 1 }
    # indicates whether it is possible to obtain sum s (if != -1)
    # and how many of last checked number n remains
    gain = [0] + Array.new(sum / 2, -1)

    nums.each do |(n, c)|
      for s in 0...gain.length
        if gain[s] != -1 # possible to construct sum without number n
          gain[s] = c    # c numbers n remains available after obtaining sum s
        elsif n <= s && gain[s - n] > 0 # can obtain (s - n) and remains numbers n
          gain[s] = gain[s - n] - 1     # then can obtain sum s taking one num n
        end
      end
    end

    closest_to_half = gain.rindex { |a| a != -1 }
    sum - 2 * closest_to_half
  end

  it { expect(solution([1, 5, 2, -2])).to eq(0) }
  it { expect(solution([3, 3, 3, 4, 5])).to eq(0) }
  it { expect(solution([1, 3, 3, 3, 8])).to eq(0) }
  it { expect(solution([10, 1, 1, 1, 1, 1, 1])).to eq(4) }
end
