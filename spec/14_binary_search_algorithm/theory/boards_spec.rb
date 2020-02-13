# frozen_string_literal: true

describe 'Boards' do
  def boards(a, k)
    n = a.length
    beg = 1
    ends = n
    res = n
    while beg <= ends
      mid = (beg + ends) / 2
      if check(a, k, mid)
        res = mid
        ends = mid - 1
      else
        beg = mid + 1
      end
    end
    res
  end

  # def check(a, k, d)
  #   covered = 0
  #   a.each do |x|
  #     if x == 1 && covered == 0
  #       return false if k == 0
  #       k -= 1
  #       covered = d - 1 unless d < 1
  #     else
  #       covered -= 1 if covered > 0
  #     end
  #   end
  #   true
  # end

  def check(a, k, d)
    boards = 0
    last = -1 # end of the last board (covered up to the index)
    a.each_with_index do |x, i|
      if x == 1 && i > last
        return false if boards == k
        boards += 1
        last = i + d - 1
      end
    end
    true
  end

  it { expect(boards([0, 0, 0], 1)).to eq(1) }
  it { expect(boards([1, 0, 0], 1)).to eq(1) }
  it { expect(boards([1, 1, 0], 1)).to eq(2) }
  it { expect(boards([1, 0, 1], 1)).to eq(3) }
  it { expect(boards([0, 1, 0, 1, 1, 0, 0, 1, 0, 0], 3)).to eq(2) }
end
