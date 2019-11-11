# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    x = a[0]
    y = a[1..-1].reduce(0, :+)
    m = (x - y).abs

    a[1..-2].each do |el|
      x += el
      y -= el
      m = [m, (x - y).abs].min
    end
    m
  end

  context 'example1' do
    it { expect(solution([3, 1, 2, 4, 3])).to eq 1 }
    it { expect(solution([1000, -1000])).to eq 2000 }
    it { expect(solution([-10, -5, -3, -4, -5])).to eq 3 }
  end
end
