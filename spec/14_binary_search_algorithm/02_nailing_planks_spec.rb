# frozen_string_literal: true
require 'set'

describe 'solution' do
  ##
  # planks: [1, 4], [4, 5], [5, 9], [8, 10].
  #
  # Given array C such that:
  #     C[0] = 4
  #     C[1] = 6
  #     C[2] = 7
  #     C[3] = 10
  #     C[4] = 2
  #
  # if we use the following nails:
  #
  #     0, then planks [1, 4] and [4, 5] will both be nailed.
  #     0, 1, then planks [1, 4], [4, 5] and [5, 9] will be nailed.
  #     0, 1, 2, then planks [1, 4], [4, 5] and [5, 9] will be nailed.
  #     0, 1, 2, 3, then all the planks will be nailed.
  #

  # O(N * M)
  def basic_solution(a, b, c)
    planks = a.zip(b)
    c.each.with_index(1) do |nail_pos, nails_cnt|
      planks.delete_if { |(start, ends)| start <= nail_pos && nail_pos <= ends }
      return nails_cnt if planks.empty?
    end
    -1
  end

  # O((N + M) * log(M))
  def solution(a, b, c)
    _starts = a.map.with_index { |coord, nr| [:start, nr, coord] }
    _ends   = b.map.with_index { |coord, nr| [:end, nr, coord] }
    _nails = c.map.with_index { |coord, nr| [:nail, nr, coord] }
    order = { start: 0, nail: 1, end: 2 }
    points = [*_starts, *_nails, *_ends].sort_by! { |ident, _, coord| [coord, order[ident]] }
    beg = 1
    ends = c.length
    res = -1
    while beg <= ends
      med = (beg + ends) / 2
      if check(points, med)
        res = med
        ends = med - 1
      else
        beg = med + 1
      end
    end
    res
  end

  def check(points, k)
    starts = Set.new
    points.each do |(what, nr, _)|
      case what
      when :start
        starts.add(nr)
      when :nail
        starts.clear if nr < k
      when :end
        return false if starts.include?(nr)
      end
    end
    true
  end

  it { expect(solution([1, 4, 5, 8], [4, 5, 9, 10], [4, 6, 7, 10, 2])).to eq(4) }
  it { expect(solution([1], [1], [1])).to eq(1) }
  it { expect(solution([1], [1], [0])).to eq(-1) }
end
