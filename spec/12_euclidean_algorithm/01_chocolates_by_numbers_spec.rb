# frozen_string_literal: true

describe 'solution' do
  def solution(n, m)
    n / n.gcd(m)
  end

  it { expect(solution(10, 4)).to eq(5) }
  it { expect(solution(24, 18)).to eq(4) }
  it { expect(solution((3**9)*(2**14), (2**14)*(2**14))).to eq(3**9) }
end
