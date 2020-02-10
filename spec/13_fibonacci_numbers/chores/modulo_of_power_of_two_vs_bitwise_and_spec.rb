# frozen_string_literal: true

require 'benchmark'

describe 'int Array with int default value VS no default' do
  it 'returns the same result' do
    n = rand(10000000)
    m = rand(1..10)
    expect(n & ((1 << m) - 1)).to eq(n % (2 ** m))
    expect(n % (1 << m)).to eq(n % (2 ** m))
    expect(n & ((2 ** m) - 1)).to eq(n % (2 ** m))
  end

  it 'compare time' do
    t = 100_000
    n = rand(10_000_000..20_000_000)
    m = rand(10..20)

    puts "\n  2 ** #{m}"
    Benchmark.bm do |bm|
      bm.report('2 ** m') do
        t.times { 2 ** m }
      end
      bm.report('1 << m') do
        t.times { 1 << m }
      end
    end

    pow_of_2 = 2 ** m
    puts "\n#{n} % pow_of_2"
    Benchmark.bm do |bm|
      bm.report('n % pow_of_2      ') do
        t.times { n % pow_of_2 }
      end
      bm.report('n & (pow_of_2 - 1)') do
        t.times { n & (pow_of_2 - 1) }
      end
    end
  end
end
