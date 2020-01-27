# frozen_string_literal: true

describe 'solution' do
  def solution(heights)
    len = heights.length
    return len if len.zero? || len == 1
    stack = []
    cnt = 0
    heights.each do |h|
      while stack.any? && stack.last > h
        stack.pop
      end
      if stack.last != h
        stack << h
        cnt += 1
      end
    end
    cnt
  end

  it { expect(solution([8, 8, 5, 7, 9, 8, 7, 4, 8])).to eql(7) }
  it { expect(solution([5])).to eql(1) }
end
