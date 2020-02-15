# frozen_string_literal: true

describe 'solution' do
  # O(N)
  def solution(k, a)
    cnt = 0
    tied = 0
    a.each do |rope|
      tied += rope
      if tied >= k
        cnt += 1
        tied = 0
      end
    end
    cnt
  end

  it { expect(solution(4, [1, 2, 3, 4, 1, 1, 3])).to eq(3) }
end
