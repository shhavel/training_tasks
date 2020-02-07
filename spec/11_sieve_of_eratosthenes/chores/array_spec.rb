# frozen_string_literal: true

require 'benchmark'

describe 'int Array with int default value VS no default' do
  it 'compare time' do
    n = 1_000_000
    puts ''
    Benchmark.bm do |bm|
      bm.report('Array.new(n)    ') do
        arr = Array.new(n + 1)
        0.upto(n) { |i| arr[i] = i }
      end
      bm.report('Array.new(n, -1)') do
        arr = Array.new(n + 1, -1)
        0.upto(n) { |i| arr[i] = i }
      end
      bm.report('Array.new(n, 0) ') do
        arr = Array.new(n + 1, 0)
        0.upto(n) { |i| arr[i] = i }
      end
    end
  end
end
