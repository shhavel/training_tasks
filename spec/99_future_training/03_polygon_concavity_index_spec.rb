# frozen_string_literal: true

describe 'solution' do
  Point2D = Struct.new(:x, :y)

  def direction(p1, p2, p3)
    x1, y1, x2, y2, x3, y3 = p1.x, p1.y, p2.x, p2.y, p3.x, p3.y
    if x1 < x2
      y0 = (y2 - y1).to_f / (x2 - x1) * (x3 - x1) + y1
      return :on_the_line if y3 == y0
      return y3 < y0 ? :clockwise : :counterclockwise
    elsif x1 == x2
      raise ArgumentError, 'Duplicate points.' if y1 == y2
      return :on_the_line if x3 == x1
      if y1 < y2
        return x3 > x2 ? :clockwise : :counterclockwise
      else # y2 < y1
        return x3 < x2 ? :clockwise : :counterclockwise
      end
    else # x2 < x1
      y0 = (y2 - y1).to_f / (x2 - x1) * (x3 - x1) + y1
      return :on_the_line if y3 == y0
      return y3 > y0 ? :clockwise : :counterclockwise
    end
  end

  class Point2D
    attr_accessor :dir
  end

  # O(N)
  def solution(a)
    n = a.length
    raise ArgumentError, 'Less then three points.' if n < 3
    return -1 if n == 3
    a.each_with_index do |point, k|
      point.dir = direction(a[k - 1], point, a[k == n - 1 ? 0 : k + 1])
    end
    min_x = a.min_by(&:x).x
    dir = a.find { |point| point.x == min_x && point.dir != :on_the_line }.dir
    (0...n).find { |k| a[k].dir != dir && a[k].dir != :on_the_line } || -1
  end

  def vertex(*coords)
    points = coords.map { |(x, y)| Point2D[x, y] }
    solution(points)
  end

  it { expect(vertex([-1, 3], [3, 1], [0, -1], [-2, 1])).to eq(-1) }
  it { expect(vertex([-1, 3], [1, 2], [3, 1], [0, -1], [-2, 1])).to eq(-1) }
  it { expect(vertex([-1, 3], [1, 2], [1, 1], [3, 1], [0, -1], [-2, 1], [-1, 2])).to be_one_of(2, 6) }
  it { expect(vertex([-1, 3], [1, 2], [3, 1], [1, 1], [0, -1], [-2, 1], [-1, 2])).to be_one_of(3, 6) }

  it { expect(vertex([-2, 2], [2, 2], [2, -2], [-2, -2])).to eq(-1) }
  it { expect(vertex([-2, 2], [2, 2], [1, -1], [-2, -2])).to eq(-1) }
  it { expect(vertex([-2, 2], [2, 2], [0, 0], [-2, -2])).to eq(-1) }
  it { expect(vertex([-2, 2], [2, 2], [-1, 1], [-2, -2])).to eq(2) }

  it { expect(vertex([-4, 0], [-1, 1], [0, 4], [1, 1], [4, 0], [1, -1], [0, -4], [-1, -1])).to be_one_of(1, 3, 5, 7) }
  it { expect(vertex([-1, -1], [0, -4], [1, -1], [4, 0], [1, 1], [0, 4], [-1, 1], [-4, 0])).to be_one_of(0, 2, 4, 6) }
  it { expect(vertex([-1, 1], [-4, 0], [-1, -1], [0, -4], [1, -1], [4, 0], [1, 1], [0, 4])).to be_one_of(0, 2, 4, 6) }
  it { expect(vertex([-2, 2], [3, 0], [-2, -2], [0, 0])).to eq(3) }
end
