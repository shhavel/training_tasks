# frozen_string_literal: true

describe 'solution' do
  # O(N ** 2)
  def solution_besic(a)
    return 0 if a.empty? || a.one?
    max_cnt = 1_000_000_000
    n = a.length
    cnt = 0
    for i in (0..n - 2) do
      for j in (i + 1..n - 1) do
        cnt += 1 if a[i] > a[j]
        return -1 if cnt >= max_cnt
      end
    end
    cnt
  end

  def bsearch_index(a, x)
    n = a.length
    beg = 0
    ends = n - 1
    res = n
    while beg <= ends
      mid = (beg + ends) / 2
      if a[mid] >= x
        res = mid
        ends = mid - 1
      else
        beg = mid + 1
      end
    end
    res
  end

  # O(N*log(N))
  def solution(a)
    # puts "a = #{a}"
    return 0 if a.empty? || a.one?
    max_cnt = 1_000_000_000
    n = a.length
    cnt = 0
    sorted_tail = [a.last]
    (n - 2).downto(0) do |p|
      i = bsearch_index(sorted_tail, a[p])
      # puts "a[p] = #{a[p]}  tail = #{sorted_tail}  i = #{i}"
      cnt += i
      return -1 if cnt >= max_cnt
      sorted_tail.insert(i, a[p])
    end
    cnt
  end

  # (1,2) (1,3) (1,5) (4,5)
  # (6,3) (6,4) (6,4) (7,4)
  it { expect(solution([-1, 6, 3, 4, 7, 4])).to eq(4) }
  it { expect(solution([0])).to eq(0) }
  it { expect(solution([])).to eq(0) }
  it { expect(solution([1, 2, 3])).to eq(0) }
  it { expect(solution([1, 1, 1])).to eq(0) }
  it { expect(solution((1..100).to_a)).to eq(0) }
  it { expect(solution((1..100).to_a.reverse)).to eq(4950) }
end
