# frozen_string_literal: true
require 'set'

describe 'solution' do
  # O(N) or O(N*log(N))
  def basic_solution(a)
    Set[*a.map(&:abs)].size
  end

  # O(N) or O(N*log(N))
  def solution(a)
    return 0 if a.empty?
    n = a.length
    p = a.each_index.detect { |i| a[i] >= 0 }
    cnt = 1
    if p.nil? || p.zero?
      (1...n).each { |i| cnt += 1 if a[i] != a[i - 1] }
    else
      q = p
      u = a[p] # first uniq value
      # puts "0) [#{q}, #{p}]  a[#{p}] = #{a[p]}"
      # count unique negatives that abs less then u
      while 0 < q && a[q - 1].abs < u
        cnt += 1 if a[q - 1] < a[q]
        q -= 1
      end
      # check abs min withing lefter and righter element
      while 0 < q || p < n - 1
        if q == 0
          if u < a[p + 1]
            # puts "1) [#{q}, #{p}]  u = #{u}; a[#{p + 1}] = #{a[p + 1]}"
            u = a[p + 1]
            cnt += 1
          end
          p += 1
        elsif p == n - 1
          if a[q - 1] < u
            # puts "2) [#{q}, #{p}]  u = #{u}; a[#{q - 1}] = #{a[q - 1]}"
            u = a[q - 1]
            cnt += 1
          end
          q -= 1
        else
          if a[p + 1] < a[q - 1].abs
            if u < a[p + 1]
              # puts "3) [#{q}, #{p}]  u = #{u}; a[#{p + 1}] = #{a[p + 1]}"
              u = a[p + 1]
              cnt += 1
            end
            p += 1
          else
            if a[q - 1].abs > u
              # puts "4) [#{q}, #{p}]  u = #{u}; a[#{q - 1}] = #{a[q - 1]}"
              u = a[q - 1].abs
              cnt += 1
            end
            q -= 1
          end
        end
      end
    end
    cnt
  end

  it { expect(solution([0, 1, 2, 3, 4, 5])).to eq(6) }
  it { expect(solution([-5, -4, -3, -2, -1])).to eq(5) }
  it { expect(solution([-5, -3, -1, 0, 3, 6])).to eq(5) }

  it { expect(solution((-10..10).to_a)).to eq(11) }
  it { expect(solution((-10000..10000).to_a)).to eq(10001) }
  it { expect(solution((-50000..50000).to_a)).to eq(50001) }
  it 'long sequence of large numbers' do
    l = rand(2_147_383_647)
    expect(solution((l...l + 100_000).to_a)).to eq(100000)
  end
end
