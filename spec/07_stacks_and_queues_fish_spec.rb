# frozen_string_literal: true

describe 'solution' do
  def solution(a, b)
    alive = 0 # upstream alive
    downstream = []
    a.zip(b).each do |f, d|
      if d == 1
        downstream << f # adding a new fish to lead downstream flowing fished
      else
        if downstream.empty?
          alive += 1 # flowing upstream fish stayed alive
        else
          # clash of counter directions
          downstream.reverse_each do |df|
            break if df > f # flowing upstream fish was eaten
            downstream.pop  # flowing downstream fish was eaten
          end
          alive += 1 if downstream.empty?
        end
      end
    end
    alive + downstream.length
  end

  it { expect(solution([4, 3, 2, 1, 5], [0, 1, 0, 0, 0])).to eql(2) }
end
