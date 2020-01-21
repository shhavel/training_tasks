# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    zeros = 0
    sum = 0
    max_sum = 1_000_000_000
    a.each do |d|
      if d.zero?
        zeros += 1
      elsif d == 1
        sum += zeros
        return -1 if sum > max_sum
      end
    end
    sum
  end

  context 'example1' do
    it { expect(solution([0, 1, 0, 1, 1])).to eq 5 }
    it { expect(solution([0, 1, 0, 1, 1, 0, 0, 0, 1])).to eq 10 }
    it { expect(solution([0, 1, 0, 1, 1, 0, 0, 0, 1, 0])).to eq 10 }
  end
end
