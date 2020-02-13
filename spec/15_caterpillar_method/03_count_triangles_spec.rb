# frozen_string_literal: true

describe 'solution' do
  # O(N**3)
  def solution(a)
    n = a.length
    a.sort!
    cnt = 0
    # triangles = []
    for x in (0..n - 3)
      z = x + 2
      for y in (x + 1..n - 2)
        # binding.pry if a[x] == 5 && a[y] == 8
        while z < n && a[x] + a[y] > a[z]
          # triangles << [x, y, z]
          # triangles << [a[x], a[y], a[z]]
          z += 1
        end
        cnt += z - y - 1
      end
    end
    # puts triangles.map { |(x, y, z)| "(#{x}, #{y}, #{z})" }.join(', ')
    cnt
  end

  it { expect(solution([10, 2, 5, 1, 8, 12])).to eq(4) }
end
