# frozen_string_literal: true

describe 'solution' do
  # O(N * log(N))
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

  def solution(pieces, min_area)
    min_sq_side = Math.sqrt(min_area)
    max_cnt = 1_000_000_000
    cnt = 0
    sides = []
    cand, cand_cnt = nil, 0
    pieces.sort.each do |piece|
      if cand.nil?
        cand = piece
        cand_cnt = 1
      elsif cand == piece
        cand_cnt += 1
      else
        if cand_cnt >= 2
          sides << cand
          cnt += 1 if cand_cnt >= 4 && cand >= min_sq_side # squares
        end
        cand, cand_cnt = piece, 1
      end
    end
    if cand_cnt >= 2
      sides << cand
      cnt += 1 if cand_cnt >= 4 && cand >= min_sq_side # square
    end

    n = sides.count
    for i in (0..n - 2) do
      min_b = min_area.to_f / sides[i]
      j = bsearch_index(sides, min_b)
      j = i + 1 if j <= i
      cnt += n - j
      return -1 if cnt > max_cnt
    end

    cnt
  end

  it { expect(solution([1, 2, 5, 1, 1, 2, 3, 5, 1], 5)).to eq(2) }
end
