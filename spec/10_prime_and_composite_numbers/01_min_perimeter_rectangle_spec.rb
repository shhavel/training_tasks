# frozen_string_literal: true

describe 'solution' do
  def solution0(n)
    return 4 if n == 1
    d = 1
    i = 2
    while i * i < n
      if n % i == 0
        d = i
      end
      i += 1
    end
    if i * i == n
      return 4 * i
    end
    2 * d + 2 * (n / d)
  end

  def solution(n)
    r = Math.sqrt(n).to_i
    while r > 0
      if n % r == 0
        return 2 * r + 2 * (n / r)
      end
      r -= 1
    end
  end

  it { expect(solution(1)).to eq(4) }
  it { expect(solution(30)).to eq(22) }
  it { expect(solution(17)).to eq(36) }
end
