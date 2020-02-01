# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    n = a.size
    (n + 2) * (n + 1) / 2 - a.reduce(0, :+)
  end

  it { expect(solution([2, 3, 1, 5])).to eq 4 }
  it { expect(solution([])).to eq 1 }
  it { expect(solution([2])).to eq 1 }
end
