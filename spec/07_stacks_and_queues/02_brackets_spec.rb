# frozen_string_literal: true

describe 'solution' do
  def solution(s)
    len = s.length
    return 1 if len == 0
    return 0 if len.odd?
    open_b = (o1, o2, o3 = %w<( [ {>)
    c1, c2, c3 = %w<) ] }>
    opened = []
    s.each_char do |b|
      if open_b.include?(b)
        opened << b
      else
        o = opened.pop
        return 0 unless (o == o1 && b == c1) || (o == o2 && b == c2) || (o == o3 && b == c3)
      end
    end
    opened.empty? ? 1 : 0
  end

  it { expect(solution('{[()()]}')).to eql(1) }
  it { expect(solution('([)()]')).to eql(0) }
end
