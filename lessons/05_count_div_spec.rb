# frozen_string_literal: true

describe 'solution' do
  def solution(a, b, k)
    f = (a / k.to_f).ceil
    l = b / k
    return 0 unless l >= f
    l - f + 1
  end

  context 'example1' do
    it { expect(solution(6, 11, 2)).to eq 3 }
  end
end
