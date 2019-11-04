describe "solution" do
  def solution(s, p, q)
    nucleotides_to_impact_factors =  { 'A' => 1, 'C' => 2, 'G' => 3, 'T' => 4 }
    sequence_of_impact_factors = s.each_char.map { |n| nucleotides_to_impact_factors[n] }
    idx = -1
    prefix_max_a_idxs = sequence_of_impact_factors.map.with_index { |f, i| idx = i if f == 1; idx }
    idx = -1
    prefix_max_c_idxs = sequence_of_impact_factors.map.with_index { |f, i| idx = i if f == 2; idx }
    idx = -1
    prefix_max_g_idxs = sequence_of_impact_factors.map.with_index { |f, i| idx = i if f == 3; idx }

    p.zip(q).map do |(i, j)|
      if prefix_max_a_idxs[j] >= i
        1
      elsif prefix_max_c_idxs[j] >= i
        2
      elsif prefix_max_g_idxs[j] >= i
        3
      else
        4
      end
    end
  end

  context "example1" do
    it { expect(solution('CAGCCTA', [2, 5, 0], [4, 5, 6])).to eq [2, 4, 1] }
  end
end
