# frozen_string_literal: true

describe 'solution' do
  # O(N)
  def solution(levels)
    return 0 if levels.empty? || levels.one?
    heights = []
    flood = 0

    levels.each do |level|
      downs = []
      while heights.any? && heights.last.last < level
        downs.unshift heights.pop
      end

      if downs.none?
        heights << [nil, level] unless heights.last && heights.last.last == level
      elsif heights.any?
        low = downs.flatten.compact.min
        heights << [low, level]
        flood = [flood, level - low].max if low
      elsif downs.one?
        heights << [nil, level]
      else
        h = downs.shift.last
        low = downs.flatten.compact.min
        flood = [flood, h - low].max
        heights << [nil, level]
      end

      # puts "level: #{level}  heights: #{heights.inspect}  downs: #{downs.inspect}  flood: #{flood}"
    end

    flood
  end

  it { expect(solution([1, 3, 2, 1, 2, 1, 5, 3, 3, 4, 2])).to eq(2) }
  it { expect(solution([5, 8])).to eq(0) }
end
