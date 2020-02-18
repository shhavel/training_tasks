# frozen_string_literal: true

describe 'solution' do
  def max(a, b)
    return b if !a
    a > b ? a : b
  end

  # O(n)
  def solution(a)
    n = a.length
    sum = Array.new(n)
    sum[0] = a[0]
    for j in (1...n)
      for k in (1..6)
        break if k > j
        sum[j] = max(sum[j], sum[j - k] + a[j])
      end
    end
    sum[n - 1]
  end

  it { expect(solution([1, -2, 0, 9, -1, -2])).to eq(8) }
  it { expect(solution([-1, -2])).to eq(-3) }
end
