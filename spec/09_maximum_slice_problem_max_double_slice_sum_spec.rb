# frozen_string_literal: true

describe 'solution' do
  # 0 ≤ X < Y < Z < N
  # A[X+1] + A[X+2] + ... + A[Y−1] + A[Y+1] + A[Y+2] + ... + A[Z−1]
  # Assume that if Y = X+1 then A[X+1] + ... + A[X] = 0
  def solution(a)
    len = a.length
    max_sum = max_left = max_right = 0
    # 1 ≤ Y ≤ N-2, but we use an Array to store results, so start from 0.
    max_lefts = (0..len-2).map do |y|
      next 0 if y.zero? || y == 1
      max_left = [max_left + a[y-1], 0].max
    end
    max_rights = Array.new(len-1, 0)
    (len-3).downto(1) do |y|
      max_rights[y] = max_right = [a[y+1] + max_right, 0].max
    end
    (1..len-2).each do |y|
      max_y_sum = max_lefts[y] + max_rights[y]
      max_sum = [max_sum, max_y_sum].max
    end
    max_sum
  end

  it { expect(solution([3, 2, 6, -1, 4, 5, -1, 2])).to eq(17) }
  it { expect(solution([-1, -5, 10, -1, 10, -3])).to eq(20) }
  it { expect(solution((-1000..1000).to_a)).to eq(499500) }
  it { expect(solution([-1, -5, 10, -1, 10])).to eq(10) }
end
