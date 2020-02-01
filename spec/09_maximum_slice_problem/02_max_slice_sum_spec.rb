# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    sum_ending = 0 # max sum ending in the current position
    max_slice = nil
    a.each do |x|
      sum_ending = [sum_ending + x, x].max
      max_slice ||= sum_ending
      max_slice = [max_slice, sum_ending].max
    end
    max_slice
  end

  it { expect(solution([3, 2, -6, 4, 0])).to eq(5) }
  it { expect(solution([-1000000])).to eq(-1000000) }
end
