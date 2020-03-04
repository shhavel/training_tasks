# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    len = a.length
    return -1 if len.zero?
    return 0 if a.one?
    cand = a.sort[len / 2]
    cnt = 0
    a.each_with_index do |x, i|
      cnt += 1 if x == cand
      return i if cnt > len / 2
    end
    -1
  end

  # it { expect([0, 2, 4, 6, 7]).to include(solution([3, 4, 3, 2, 3, -1, 3, 3])) }
  it { expect(solution([3, 4, 3, 2, 3, -1, 3, 3])).to be_one_of(0, 2, 4, 6, 7) }
  it { expect(solution([1, 2, 3])).to eq(-1) }
  # it { expect([0, 2]).to include(solution([1, 2, 1])) }
  it { expect(solution([1, 2, 1])).to be_one_of(0, 2) }
end
