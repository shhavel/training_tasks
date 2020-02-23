# frozen_string_literal: true

describe 'solution' do
  def solution(p, c)
    [p / 2, c].min
  end

  it { expect(solution(5, 3)).to eq(2) }
  it { expect(solution(10, 3)).to eq(3) }
end
