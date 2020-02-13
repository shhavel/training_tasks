# frozen_string_literal: true

describe 'Caterpillar method' do
  def caterpillar_method(a, s)
    n = a.length
    front, total = 0, 0
    for back in (0...n)
      while front < n and total + a[front] <= s
        total += a[front]
        front += 1
      end
      if total == s
        return true
      end
      total -= a[back]
    end
    false
  end

  it { expect(caterpillar_method([6, 2, 7, 4, 1, 3, 6], 12)).to eq(true) }
end
