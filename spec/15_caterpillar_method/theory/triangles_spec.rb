# frozen_string_literal: true

describe 'The number of triangles' do
  def triangles(a)
    n = a.length
    result = 0
    for x in (0..n - 3)
      z = x + 2
      for y in (x + 1..n - 2)
        while z < n and a[x] + a[y] > a[z]
          z += 1
        end
        result += z - y - 1
      end
    end
    result
  end

  it { expect(triangles([2, 3, 4])).to eq(1) }
  it { expect(triangles([2, 3, 4, 5, 10])).to eq(3) }
end
