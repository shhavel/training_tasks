# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    min_avg_pos = 0 # The begin position of the first slice with mininal average
    min_sum = (a[0] + a[1]) * 3 # The mininal sum candidate (average * 6)
    for i in (0..(a.size - 3)) do
      # Try the next 2-element slice
      if (s6 = (a[i] + a[i+1]) * 3) < min_sum
        min_avg_pos, min_sum = i, s6
      end
      # Try the next 3-element slice
      if (s6 = (a[i] + a[i+1] + a[i+2]) * 2) < min_sum
        min_avg_pos, min_sum = i, s6
      end
    end
    # Try the last 2-element slice
    if (a[-2] + a[-1]) * 3 < min_sum
      return a.size - 2
    end
    min_avg_pos
  end

  it 'returns correct value' do
    expect(solution([4, 2, 2, 5, 1, 5, 8])).to eql(1)
  end
end
