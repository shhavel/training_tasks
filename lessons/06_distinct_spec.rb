describe "solution" do
  def solution(a)
    x = nil
    c = 0
    a.sort.each do |y|
      if y != x
       c += 1
       x = y
      end
    end
    c
  end

  it { expect(solution([2, 1, 1, 2, 3, 1])).to eql(3) }
end
