# frozen_string_literal: true

describe 'solution' do
  def solution(n)
    return 1 if n == 1
    # ds = [1, n]
    # is = [1]
    i = 2
    cnt = 2
    while i * i < n
      if n % i == 0
        # is << i; ds << i; ds << n/i
        cnt += 2
      end
      i += 1
    end
    # puts "i = #{i}"
    if i * i == n
      # is << i
      # ds << i
      cnt += 1
    end
    # puts is.sort.join(', ')
    # puts ds.sort.join(', ')
    cnt
  end

  it { expect(solution(1)).to eq(1) }
  it { expect(solution(2)).to eq(2) }
  it { expect(solution(3)).to eq(2) }
  it { expect(solution(4)).to eq(3) }
  it { expect(solution(5)).to eq(2) }
  it { expect(solution(6)).to eq(4) }
  it { expect(solution(7)).to eq(2) }
  it { expect(solution(8)).to eq(4) }
  it { expect(solution(9)).to eq(3) }
  it { expect(solution(10)).to eq(4) }
  it { expect(solution(16)).to eq(5) }
  it { expect(solution(36)).to eq(9) }
  it { expect(solution(24)).to eq(8) }
  it { expect(solution(41)).to eq(2) }
  it { expect(solution(42)).to eq(8) }
end
