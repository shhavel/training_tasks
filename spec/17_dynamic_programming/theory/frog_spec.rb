# frozen_string_literal: true

describe 'Frog' do
  def frog(s, k, q)
    n = s.length
    dp = [1] + [0] * k
    for j in (1..k)
      for i in (0...n)
        if s[i] <= j
          dp[j] = (dp[j] + dp[j - s[i]]) % q
        end
      end
    end
    dp[k]
  end

  it { expect(frog([2, 3], 9, 1000)).to eq(5) }
end
