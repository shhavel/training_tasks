# frozen_string_literal: true

describe 'solution' do
  def sieve(n)
    sieve = Array.new(n + 1, true)
    sieve[0] = sieve[1] = false
    i = 2
    while i * i <= n
      k = i * i
      while k <= n
        sieve[k] = false
        k += i
      end
      i += 1
    end
    sieve
  end

  it { expect(sieve(17)).to eq([false, false, true, true, false, true, false, true, false, false, false, true, false, true, false, false, false, true]) }
end
