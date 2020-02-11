# frozen_string_literal: true

describe 'Binary search algorithm' do
  def binary_search(a, x)
    n = a.length
    beg = 0
    ends = n - 1
    res = -1
    while beg <= ends
      mid = (beg + ends) / 2
      if a[mid] <= x
        res = mid
        beg = mid + 1
      else
        ends = mid - 1
      end
    end
    res
  end

  it { expect(binary_search([1, 2, 3], 2)).to eq(1) }
  it { expect(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 11)).to eq(10) }
  it { expect(binary_search([12, 15, 15, 19, 24, 31, 53, 59, 60], 31)).to eq(5) }
end
