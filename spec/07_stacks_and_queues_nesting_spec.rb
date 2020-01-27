# frozen_string_literal: true

describe 'solution' do
  def solution(s)
    len = s.length
    return 1 if len == 0
    return 0 if len.odd?
    opening_parenthesis = '('
    opened = 0
    s.each_char do |parenthesis|
      if parenthesis == opening_parenthesis
        opened += 1
      else
        return 0 if opened == 0
        opened -= 1
      end
    end
    opened == 0 ? 1 : 0
  end

  it { expect(solution('(()(())())')).to eql(1) }
  it { expect(solution('())')).to eql(0) }
end
