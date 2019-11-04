describe "solution" do
  def solution(a)
    require 'set'
    s = Set.new(a)
    (1..(a.size+1)).find do |i|
      !s.include?(i)
    end
  end

  context "example1" do
    it { expect(solution([1, 3, 6, 4, 1, 2])).to eq 5 }
  end
end
