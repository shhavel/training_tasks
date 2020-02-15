# frozen_string_literal: true

describe 'The greedy algorithm for finding change' do
  def greedy_coin_changing(m, k)
    result = []
    m.reverse_each do |coin|
      result << [coin, k / coin]
      k %= coin
    end
    result
  end

  it { expect(greedy_coin_changing([1, 3, 4], 6)).to eq([[4, 1], [3, 0], [1, 2]]) }
end
