# frozen_string_literal: true

describe 'solution' do
  # 0 ≤ X < Y < Z < N
  # A[X+1] + A[X+2] + ... + A[Y-1] + A[Y+1] + A[Y+2] + ... + A[Z-1]
  # Assume that if Y = X+1 then A[X+1] + ... + A[X] = 0
  def solution(a)
    n = a.length
    # 1 ≤ Y ≤ N-2, but we use Array to store results, so start from 0.
    max_ending = Array.new(n-1, 0)
    max_starting = Array.new(n-1, 0)
    2.upto(n-2) do |y|
      max_ending[y] = [max_ending[y-1] + a[y-1], 0].max
    end
    (n-3).downto(1) do |y|
      max_starting[y] = [a[y+1] + max_starting[y+1], 0].max
    end
    max_double_slice = 0
    (1..n-2).each do |y|
      max_double_slice = [max_double_slice, max_ending[y] + max_starting[y]].max
    end
    max_double_slice
  end

  it { expect(solution([3, 2, 6, -1, 4, 5, -1, 2])).to eq(17) }
  it { expect(solution([-1, -5, 10, -1, 10, -3])).to eq(20) }
  it { expect(solution((-1000..1000).to_a)).to eq(499500) }
  it { expect(solution([-1, -5, 10, -1, 10])).to eq(10) }
end
