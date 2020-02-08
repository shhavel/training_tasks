# frozen_string_literal: true

describe 'solution' do
  # def fibonacci_modulo(n, m)
  #   rt5 = Math.sqrt(5)
  #   fi = (rt5 + 1) / 2
  #   ((fi ** (n + 1) - (-fi) ** -(n + 1)) / rt5).to_i % (2 ** m)
  # end

  F = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55,
       89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765,
       10946, 17711, 28657, 46368, 75025]

  def fibonacci_modulo(n, max_pow, m)
    return 1 if n == 1
    p = 2 ** m
    (n + 1 - F.length).times do
      F << ((F[-2] + F[-1]) % max_pow)
    end
    F[n] % (2 ** m)
  end

  # O(L)
  def solution(a, b)
    max_pow = 2 ** b.max
    a.zip(b).map { |n, m| fibonacci_modulo(n, max_pow, m) }
  end

  context 'example1' do
    it { expect(solution([4, 4, 5, 5, 1], [3, 2, 4, 3, 1])).to eq([5, 1, 8, 0, 1]) }
  end
end
