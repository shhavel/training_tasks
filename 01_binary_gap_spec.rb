# A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

# For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.

# Write a function:

#     def solution(n)

# that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

# For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.

# Assume that:

#         N is an integer within the range [1..2,147,483,647].

# Complexity:

#         expected worst-case time complexity is O(log(N));
#         expected worst-case space complexity is O(1).


describe "solution" do
  def solution(n)
    max_gap     = 0
    current_gap = 0
    one_met     = false
    n.to_s(2).each_char do |digit|
      if digit == '0'
        current_gap += 1 if one_met
      else # d == '1'
        one_met = true
        max_gap = [max_gap, current_gap].max
        current_gap = 0
      end
    end
    max_gap
  end

  context "example1" do
    it { expect(solution(1041)).to eq 5 }
  end

  context "example2" do
    it { expect(solution(15)).to eq 0 }
  end

  context "extremes" do
    it { expect(solution(1)).to eq 0 }
    it { expect(solution(5)).to eq 1 }
    it { expect(solution(2147483647)).to eq 0 }
  end

  context "trailing_zeroes" do
    it { expect(solution(6)).to eq 0 }
    it { expect(solution(328)).to eq 2 }
  end

  context "power_of_2" do
    it { expect(solution(16)).to eq 0 }
    it { expect(solution(1024)).to eq 0 }
  end

  context "simple1" do
    it { expect(solution(9)).to eq 2 }
    it { expect(solution(11)).to eq 1 }
  end

  context "simple2" do
    it { expect(solution(19)).to eq 2 }
    it { expect(solution(42)).to eq 1 }
  end

  context "simple3" do
    it { expect(solution(1162)).to eq 3 }
    it { expect(solution(5)).to eq 1 }
  end

  context "medium1" do
    it { expect(solution(51712)).to eq 2 }
    it { expect(solution(20)).to eq 1 }
  end

  context "medium2" do
    it { expect(solution(561892)).to eq 3 }
    it { expect(solution(9)).to eq 2 }
  end

  context "medium3" do
    it { expect(solution(66561)).to eq 9 }
  end

  context "large1" do
    it { expect(solution(6291457)).to eq 20 }
  end

  context "large2" do
    it { expect(solution(74901729)).to eq 4 }
  end

  context "large3" do
    it { expect(solution(805306369)).to eq 27 }
  end

  context "large4" do
    it { expect(solution(1376796946)).to eq 5 }
  end

  context "large5" do
    it { expect(solution(1073741825)).to eq 29 }
  end

  context "large6" do
    it { expect(solution(1610612737)).to eq 28 }
  end
end
