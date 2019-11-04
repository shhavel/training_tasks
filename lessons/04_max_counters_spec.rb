describe "solution" do
  def solution(n, a)
    inf = 0
    m = 0
    cs = Array.new(n, 0)
    a.each do |x|
      if 1 <= x && x <= n
        c = (cs[x-1] = [cs[x-1], inf].max + 1) # increase(x)
        m = [m, c].max
      elsif x == n + 1
        inf = m
      end
    end
    cs.map { |c| [c, inf].max }
  end

  context "example1" do
    it { expect(solution(5, [3, 4, 4, 6, 1, 4, 4])).to eq [3, 2, 2, 4, 2] }
  end
end
