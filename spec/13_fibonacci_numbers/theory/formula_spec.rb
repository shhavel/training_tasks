# frozen_string_literal: true

describe 'solution' do
  def fibonacci(n)
    sqrt5 = Math.sqrt(5)
    fi = (sqrt5 + 1) / 2
    ((fi ** n - (-fi) ** -n) / sqrt5).to_i
  end

  it { expect(fibonacci(0)).to eq(0) }
  it { expect(fibonacci(1)).to eq(1) }
  it { expect(fibonacci(2)).to eq(1) }
  it { expect(fibonacci(3)).to eq(2) }
  it { expect(fibonacci(4)).to eq(3) }
  it { expect(fibonacci(5)).to eq(5) }
  it { expect(fibonacci(6)).to eq(8) }
  it { expect(fibonacci(7)).to eq(13) }
  it { expect(fibonacci(8)).to eq(21) }
  it { expect(fibonacci(9)).to eq(34) }
  it { expect(fibonacci(10)).to eq(55) }
  it { expect(fibonacci(11)).to eq(89) }
  it { expect(fibonacci(12)).to eq(144) }
  it { expect(fibonacci(13)).to eq(233) }
  it { expect(fibonacci(14)).to eq(377) }
  it { expect(fibonacci(15)).to eq(610) }
end
