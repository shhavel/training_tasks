# frozen_string_literal: true

describe 'solution' do
  # O(N)
  def solution(a, b)
    return 0 if a.empty?
    n = a.length
    cnt = 1
    start = a.last
    # segments = [n - 1] # debug
    (n - 2).downto(0) do |i|
      if b[i] < start # nonoverlapping
        start = a[i]
        cnt += 1
        # segments.unshift(i) # debug
      else
        # start = [a[i], start].max
        if a[i] > start
          start = a[i]
          # segments[0] = i # debug
        end
      end
    end
    # puts "segments: {#{segments.join(', ')}}" # debug
    cnt
  end

  it { expect(solution([1, 3, 7, 9, 9], [5, 6, 8, 9, 10])).to eq(3) }
end
