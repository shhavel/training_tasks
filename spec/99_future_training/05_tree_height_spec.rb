# frozen_string_literal: true

describe 'solution' do
  class Tree
    attr_accessor :x, :l, :r
  end

  def solution(t)
    return -1 if t.nil?
    return 0 if t.l.nil? && t.r.nil?
    if t.l && t.r
      1 + [solution(t.l), solution(t.r)].max
    elsif t.l
      1 + solution(t.l)
    else
      1 + solution(t.r)
    end
  end

  # (5, (3, (20, None, None), (21, None, None)), (10, (1, None, None), None))
  it 'returns binary tree height' do
    t = Tree.new
    t.l = tl = Tree.new
    t.r = tr = Tree.new
    tl.l = Tree.new
    tl.r = Tree.new
    tr.l = Tree.new
    expect(solution(t)).to eq(2)
  end
end
