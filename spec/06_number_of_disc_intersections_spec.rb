# frozen_string_literal: true

describe 'solution' do
  def solution(a)
    max_ins = 10_000_000
    n = a.size
    starts, ends = Array.new(n, 0), Array.new(n, 0)
    a.each_with_index do |r, i|
      s, e = [i-r, 0].max, [i+r, n-1].min
      starts[s] += 1
      ends[e] += 1
    end
    ins, opened = 0, 0
    starts.zip(ends).each_with_index do |(s, e), i|
      ins += opened * s + s*(s-1)/2
      return -1 if ins > max_ins
      opened += s - e
    end
    ins
  end

  it { expect(solution([1, 5, 2, 1, 4, 0])).to eql(11) }
  it { expect(solution(Array.new(100_000, 0))).to eql(0) }
end
