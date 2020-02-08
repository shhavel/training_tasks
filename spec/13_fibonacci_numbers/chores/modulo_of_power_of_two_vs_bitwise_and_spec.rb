# frozen_string_literal: true

require 'benchmark'

describe 'int Array with int default value VS no default' do
  it 'returns the same result' do
    n = rand(10000000)
    m = rand(10) + 1
    expect(n & ((1 << m) - 1)).to eq(n % (2 ** m))
    expect(n % (1 << m)).to eq(n % (2 ** m))
    expect(n & ((2 ** m) - 1)).to eq(n % (2 ** m))
  end

  it 'compare time' do
    t = 100_000
    puts ''
    n = rand(10_000_000) + 10_000_000
    m = rand(20) + 11
    puts "#{n} % (2 ** #{m})"
    Benchmark.bm do |bm|
      bm.report('n % (2 ** m)      ') do
        t.times { n % (2 ** m) }
      end
      bm.report('n % (1 << m)      ') do
        t.times { n % (1 << m) }
      end
      bm.report('n & ((2 ** m) - 1)') do
        t.times { n & ((2 ** m) - 1) }
      end
      bm.report('n & ((1 << m) - 1)') do
        t.times { n & ((1 << m) - 1) }
      end
    end
  end
end
