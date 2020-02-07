# frozen_string_literal: true

describe 'solution' do
  def common_prime_divisors?(x, y)
    gcd = x_gcd = y_gcd = x.gcd(y)

    while x > 1 && x_gcd > 1
      x /= x_gcd
      x_gcd = x.gcd(gcd)
    end
    return false if x > 1

    while y > 1 && y_gcd > 1
      y /= y_gcd
      y_gcd = y.gcd(gcd)
    end
    y == 1
  end

  def solution(n, m)
    n.zip(m).count { |(x, y)| common_prime_divisors?(x, y) }
  end

  it { expect(solution([15, 10, 3], [75, 30, 5])).to eq(1) }
end
