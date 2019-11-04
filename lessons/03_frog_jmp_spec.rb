describe "solution" do
  def solution(x, y, d)
    ((y - x).to_f / d).ceil
  end

  it { expect(solution(10, 85, 30)).to eq 3 }
end
