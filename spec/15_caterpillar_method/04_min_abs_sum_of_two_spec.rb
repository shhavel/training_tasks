# frozen_string_literal: true

describe 'solution' do
  # O(N * log(N))
  def solution(a)
    pos, neg = a.partition { |x| x >= 0 }
    pos.sort!
    return 2 * pos[0] if neg.empty?
    neg = neg.map(&:abs).sort
    return 2 * neg[0] if pos.empty?
    min_abs = [pos[0], neg[0]].min
    min_diff = (pos[0] - neg[0]).abs
    p, q = 0, 0
    while p < pos.length - 1 || q < neg.length - 1
      if p == pos.length - 1
        q += 1
      elsif q == neg.length - 1
        p += 1
      else
        if pos[p + 1] < neg[q + 1]
          p += 1
        else
          q += 1
        end
      end
      min_diff = [min_diff, (pos[p] - neg[q]).abs].min
    end
    [min_diff, 2 * min_abs].min
  end

  # A[1] + A[2] = |4 + (−3)| = 1.
  it { expect(solution([1, 4, -3])).to eq(1) }

  # |(−8) + 5| = 3.
  it { expect(solution([-8, 4, 5, -10, 3])).to eq(3) }
end
