# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    max_ending = 0 # max positive sum ending in current position
    max_slice = 0
    (1...a.length).each do |i|
      diff = a[i] - a[i-1]
      max_ending = [max_ending + diff, 0].max
      max_slice = [max_slice, max_ending].max
    end
    max_slice
  end

  it { expect(solution([23171, 21011, 21123, 21366, 21013, 21367])).to eq(356) }
end
