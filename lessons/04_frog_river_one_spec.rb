# frozen_string_literal: true

describe 'solution' do
  def solution(x, a)
    require 'set'
    s = Set.new
    a.each_with_index do |l, t|
      s << l if l <= x
      return t if s.size == x
    end
    -1
  end

  context 'example1' do
    it { expect(solution(5, [1, 3, 1, 4, 2, 3, 5, 4])).to eq 6 }
  end
end
