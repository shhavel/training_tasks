# frozen_string_literal: true
require 'set'

describe 'solution' do
  def fibonacci(n)
    fib = (f1, f2 = [1, 1])
    while f2 < n
      f1, f2 = f2, f1 + f2
      fib << f2 if f2 <= n
    end
    fib
  end

  # O(N * log(N))
  def solution(a)
    return 1 if a.empty?
    finish = a.size
    leaf = a.push(1).map(&:odd?)
    fib = fibonacci(leaf.length)
    return 1 if fib.last == leaf.length

    positions = fib.select { |jump| leaf[jump - 1] }.map { |jump| jump - 1 }
    jump_cnt = 1

    while positions.any?
      jump_cnt += 1
      new_positions = Set.new
      positions.each do |pos|
        fib.each do |jump|
          next_pos = pos + jump
          return jump_cnt if next_pos == finish
          if leaf[next_pos]
            new_positions.add(next_pos)
          end
        end
      end
      positions = new_positions
    end

    -1
  end

  it { expect(solution([0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0])).to eq(3) }
  it { expect(solution([0])).to eq(1) }
  it { expect(solution([0, 0])).to eq(1) }
end
