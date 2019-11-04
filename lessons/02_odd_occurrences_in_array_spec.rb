describe "solution" do
  def solution(a)
    a.reduce(:^)
  end

  context "example1" do
    it { expect(solution([9, 3, 9, 3, 9, 7, 9])).to eq 7 }
  end
end
