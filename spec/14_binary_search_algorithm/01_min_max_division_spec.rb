# frozen_string_literal: true

describe 'solution' do
  # O(N*log(N+M))
  def solution(k, _m, a)
    a_sum = a.reduce(:+)
    block_avg = (a_sum.to_f / k).ceil
    beg = [block_avg, a.max].max
    ends = a_sum
    res = ends
    while beg <= ends
      med = (beg + ends) / 2
      if check(a, k, med)
        res = med
        ends = med - 1
      else
        beg = med + 1
      end
    end
    res
  end

  def check(a, k, max_sum)
    # blocks = [[]]
    cnt = 1
    sum = 0
    a.each do |x|
      return false if x > max_sum
      if sum + x <= max_sum
        # blocks.last << x
        sum += x
      else
        return false if cnt == k
        # blocks << [x]
        cnt += 1
        sum = x
      end
    end
    true
  end

  it { expect(solution(3, 5, [2, 1, 5, 1, 2, 2, 2])).to eq(6) }
end
