# frozen_string_literal: true

describe 'solution' do
  # finds an index of the first elem from sorted array which >= x
  def bsearch_index(a, x)
    n = a.length
    beg = 0
    ends = n - 1
    res = n
    while beg <= ends
      mid = (beg + ends) / 2
      if a[mid] >= x
        res = mid
        ends = mid - 1
      else
        beg = mid + 1
      end
    end
    res
  end

  it { expect(bsearch_index([0, 1, 4, 10], 3)).to eq(2) }
  it { expect(bsearch_index([0, 1, 4, 10], 9)).to eq(3) }
  it { expect(bsearch_index([0, 1, 4, 10], 10)).to eq(3) }
  it { expect(bsearch_index([0, 1, 4, 10], 11)).to eq(4) }
end
