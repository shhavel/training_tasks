describe 'solution' do
  def solution(a)
    return 0 if a.size < 3
    a.sort!
    x, y = a[0], a[1]
    a[2..-1].each do |z|
      return 1 if x > 0 && x + y > z
      x, y = y, z
    end
    0
  end

  it { expect(solution([10, 2, 5, 1, 8, 20])).to eql(1) }
  it { expect(solution([10, 50, 5, 1])).to eql(0) }
end
