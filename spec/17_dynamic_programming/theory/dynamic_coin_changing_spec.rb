# frozen_string_literal: true

describe 'The dynamic algorithm for finding change' do
  def dynamic_coin_changing1(c, k)
    n = c.length
    # create two-dimensional array with all zeros
    dp = (0..n).map { Array.new(k + 1, 0) }
    dp[0] = [0] + [Float::INFINITY] * k
    for i in (1..n)
      for j in (1...c[i - 1])
        dp[i][j] = dp[i - 1][j]
      end
      for j in (c[i - 1]..k)
        dp[i][j] = [dp[i][j - c[i - 1]] + 1, dp[i - 1][j]].min
      end
    end
    puts dp
    dp[n][k]
  end

  def dynamic_coin_changing(c, k)
    n = c.length
    dp = [0] + [Float::INFINITY] * k
    for i in (1..n)
      for j in (c[i - 1]..k)
        dp[j] = [dp[j - c[i - 1]] + 1, dp[j]].min
      end
    end
    dp[k]
  end

  it { expect(dynamic_coin_changing([1, 3, 4], 6)).to eq(2) }
  it { expect(dynamic_coin_changing([2, 3, 4], 6)).to eq(2) }
end
