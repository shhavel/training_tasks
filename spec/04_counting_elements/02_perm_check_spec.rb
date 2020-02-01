# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    n = a.size
    r = Array.new(n, 0)
    a.each do |e|
      next if e < 1 || e > n
      r[e-1] += 1
    end
    r.all? { |c| c == 1 } ? 1 : 0
  end

  context 'example1' do
    it { expect(solution([4, 1, 3, 2])).to eq 1 }
    it { expect(solution([4, 1, 3])).to eq 0 }
  end
end
