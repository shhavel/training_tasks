# frozen_string_literal: true

describe 'solution' do
  def solution(a, k)
    return a if a.empty? || k.zero?
    n = a.length
    r = k % n
    (0...n).map { |i| a[i - r] }
  end

  it { expect(solution([3, 8, 9, 7, 6], 3)).to eq([9, 7, 6, 3, 8]) }
  it { expect(solution([1, 2, 3, 4], 1)).to eq([4, 1, 2, 3]) }
  it { expect(solution([1, 2, 3, 4], 2)).to eq([3, 4, 1, 2]) }
  it { expect(solution([1, 2, 3, 4], 3)).to eq([2, 3, 4, 1]) }
  it { expect(solution([1, 2, 3, 4], 4)).to eq([1, 2, 3, 4]) }
  it { expect(solution([1, 2, 3, 4], 5)).to eq([4, 1, 2, 3]) }
  it { expect(solution([1, 2, 3, 4], 6)).to eq([3, 4, 1, 2]) }
end
