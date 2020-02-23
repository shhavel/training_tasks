# frozen_string_literal: true

describe 'solution' do
  # O(length(S))
  def solution(s)
    n = s.length
    return -1 if n.even?
    return 0 if n == 1
    m = n / 2
    s[0..m - 1].reverse == s[m + 1..n - 1] ? m : -1
  end

  it { expect(solution('racecar')).to eq(3) }
  it { expect(solution('x')).to eq(0) }
end
