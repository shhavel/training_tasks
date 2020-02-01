# frozen_string_literal: true

describe 'solution' do
  def solution(a, b)
    alive = 0 # upstream alive
    downstream = []
    a.zip(b).each do |fish, dir|
      next downstream << fish if dir == 1 # adding a new fish to lead downstream flowing fished
      # current fish flows upstream
      next alive += 1 if downstream.empty? # flowing upstream fish stayed alive
      # clash of counter directions
      downstream.pop while downstream.any? && downstream.last < fish # downstream fishes are being eaten
      alive += 1 if downstream.empty? # flowing upstream fish survived
    end
    alive + downstream.length
  end

  it { expect(solution([4, 3, 2, 1, 5], [0, 1, 0, 0, 0])).to eql(2) }
end
