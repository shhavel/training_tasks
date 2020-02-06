# frozen_string_literal: true

describe 'solution' do
  def smallest_prime_factor(n)
    f = Array.new(n + 1, nil) # smallest prime factor for i
    i = 2
    while i * i <= n
      if !f[i] # Not yet found a prime factor => i is a prime number
        (i * i).step(n, i) { |k| f[k] ||= i }
      end
      i += 1
    end
    f
  end

  def semi?(x, f)
    f[x] && !f[x / f[x]]
  end

  # O(N * log(log(N)) + M)
  def solution(n, p, q)
    f = smallest_prime_factor(n)
    semi = Array.new(n + 1, 0)
    4.upto(n) { |x| semi[x] = 1 if semi?(x, f) }
    cnt = 0
    semi_pref = semi.map { |n| cnt += n }
    p.zip(q).map { |(pi, qi)| semi_pref[qi] - semi_pref[pi - 1] }
  end

  it { expect(solution(26, [1, 4, 16], [26, 10, 20])).to eq([10, 4, 0]) }
end
