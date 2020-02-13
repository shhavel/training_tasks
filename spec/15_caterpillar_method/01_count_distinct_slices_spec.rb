# frozen_string_literal: true
require 'set'

describe 'solution' do
  # # O(N * (N + M))
  def basic_solution(_m, a)
    n = a.length
    max_cnt = 1_000_000_000
    cnt = 0
    # slices = [] # debug
    for p in (0..n - 1)
      slice = [a[p]]
      # slices << [p, p] # debug
      cnt += 1
      return max_cnt if cnt >= max_cnt
      q = p + 1
      while q < n && !slice.include?(a[q])
        slice << a[q]
        # slices << [p , q] # debug
        cnt += 1
        return max_cnt if cnt >= max_cnt
        q += 1
      end
    end
    # puts slices.map { |(p, q)| "(#{p}, #{q})" }.join(', ') # debug
    cnt
  end

  # O(N) or O(N * (N + M))
  def solution_using_array_slice(_m, a)
    n = a.length
    return 0 if n.zero?
    max_cnt = 1_000_000_000
    cnt = 0
    q = 0
    slice = [a[0]]
    for p in (0..n - 1)
      if q == p - 1
        # puts "p = #{p}; q = #{q};"
        slice << a[p]
        q = p
      end
      while q < n - 1 && !slice.include?(a[q + 1])
        slice << a[q + 1]
        q += 1
      end
      # puts "p = #{p}; q = #{q}; cnt += #{q - p + 1}"
      cnt += q - p + 1
      return max_cnt if cnt >= max_cnt
      slice.shift
    end
    cnt
  end

  # O(N)
  def solution(_m, a)
    n = a.length
    return 0 if n.zero?
    max_cnt = 1_000_000_000
    cnt = 0
    q = 0
    slice = Set[a[0]]
    for p in (0..n - 1)
      if q == p - 1
        # puts "p = #{p}; q = #{q};"
        slice.add(a[p])
        q = p
      end
      while q < n - 1 && !slice.include?(a[q + 1])
        slice.add(a[q + 1])
        q += 1
      end
      # puts "p = #{p}; q = #{q}; cnt += #{q - p + 1}"
      cnt += q - p + 1
      return max_cnt if cnt >= max_cnt
      slice.delete(a[p])
    end
    cnt
  end

  it { expect(solution(5, [1])).to eq(1) }
  it { expect(solution(5, [1, 2])).to eq(3) }
  it { expect(solution(5, [1, 1])).to eq(2) }
  it { expect(solution(5, [1, 2, 3])).to eq(6) }
  it { expect(solution(5, [2, 2, 3])).to eq(4) }

  # (0, 0), (0, 1), (0, 2), (1, 1), (1, 2), (2, 2), (3, 3), (3, 4), (4, 4)
  it { expect(solution(5, [3, 4, 5, 5, 2])).to eq(9) }
  it { expect(solution(5, [1, 2, 3, 2])).to eq(8) }
  it { expect(solution(5, [1, 2, 3, 2, 5])).to eq(11) }
end
