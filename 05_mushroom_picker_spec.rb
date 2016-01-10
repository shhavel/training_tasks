# https://codility.com/media/train/3-PrefixSums.pdf

describe "mushrooms" do
  def max(*args)
    args.max
  end

  def min(*args)
    args.min
  end

  def count_total(p, x, y)
    p[y] - (p[x - 1] || 0)
  end

  def mushrooms(a, k, m)
    n = a.size
    result = 0
    sum = 0
    prefix_sums = a.map { |value| sum += value }
    # p steps to the left, m - 2p steps to the right
    0.upto(min(m, k)) do |p|
      left_pos = k - p
      right_pos = min(n - 1, max(k, k + m - 2 * p))
      result = max(result, count_total(prefix_sums, left_pos, right_pos))
    end
    result
  end

  it { expect(mushrooms([2, 3, 7, 5, 1, 3, 9], 4, 6)).to eq 25 }
end
